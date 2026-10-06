#!/usr/bin/env python3
"""
Seed test data for Analytics & Records epic.
Run this script on local or PythonAnywhere Bash console.

Usage:
    python3 seed_test_data.py              # Generate for ALL active groups
    python3 seed_test_data.py all          # Same as above
    python3 seed_test_data.py 2            # Generate only for group_id = 2
    python3 seed_test_data.py 2,3          # Generate for group_id = 2 and 3
"""

import random
import sys
import os
from datetime import datetime, timedelta

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from app.db import run_query

# =====================================================
# CONFIGURATION
# =====================================================

START_DATE = datetime(2025, 1, 1)
END_DATE = datetime(2026, 5, 1)   # Extended to end of 2026

# Records per group
TRAP_RECORDS_PER_GROUP = 200
BAIT_RECORDS_PER_GROUP = 100

# =====================================================
# SEASONAL WEIGHTS
# =====================================================

MONTH_WEIGHTS = {
    1: 1.5, 2: 1.4, 3: 1.2, 4: 1.0, 5: 0.8, 6: 0.6,
    7: 0.5, 8: 0.6, 9: 0.8, 10: 1.0, 11: 1.2, 12: 1.4,
}

# =====================================================
# SPECIES DISTRIBUTION
# =====================================================

SPECIES_WEIGHTS = [
    ("Possum", 35), ("Ship Rat", 25), ("Norway Rat", 15),
    ("Mouse", 10), ("Stoat", 8), ("Hedgehog", 5), ("Ferret", 2),
]

# =====================================================
# TRAP STATUS DISTRIBUTION
# =====================================================

STATUS_WEIGHTS = [
    ("Sprung", 40), ("Still set, bait OK", 30),
    ("Still set, bait missing", 15), ("Still set, bait bad", 10),
    ("Trap interfered with", 5),
]

# =====================================================
# BAIT TYPE DISTRIBUTION
# =====================================================

BAIT_WEIGHTS = [
    ("Peanut butter", 30), ("Nutella", 20), ("Fresh Rabbit", 15),
    ("Cheese", 10), ("Salted Possum", 10), ("Good Nature Chocolate", 10),
    ("None", 5),
]

# =====================================================
# TRAP CONDITION DISTRIBUTION
# =====================================================

CONDITION_WEIGHTS = [
    ("OK", 85), ("Needs maintenance", 10), ("Repaired", 3), ("Battery charge", 2),
]

# =====================================================
# BAIT STATION DISTRIBUTIONS
# =====================================================

ACTIVE_INGREDIENTS = ["Brodifacoum", "Diphacinone", "Cyanide", "Pindone"]
FORMULATIONS = ["Cereal", "Pellet", "Block", "Liquid"]
CONCENTRATION_RANGE = (0.005, 0.05)

# =====================================================
# HELPER FUNCTIONS
# =====================================================

def weighted_choice(weights):
    """Choose an item based on weighted distribution."""
    total = sum(w for _, w in weights)
    r = random.uniform(0, total)
    cumulative = 0
    for item, w in weights:
        cumulative += w
        if r <= cumulative:
            return item
    return weights[0][0]


def generate_date_with_seasonality(start_date, end_date, month_weights):
    """Generate a random date with seasonal weighting."""
    days_range = (end_date - start_date).days
    max_weight = max(month_weights.values())
    while True:
        candidate = start_date + timedelta(days=random.randint(0, days_range))
        weight = month_weights.get(candidate.month, 1.0)
        if random.random() < (weight / max_weight):
            return candidate


def get_species_id(species_name):
    """Get species_id by species name."""
    result = run_query(
        "SELECT species_id FROM species WHERE species_name = %s",
        (species_name,), fetchone=True
    )
    return result["species_id"] if result else None


def get_status_id(status_name):
    """Get status_id by status name."""
    result = run_query(
        "SELECT status_id FROM trap_status WHERE status_name = %s",
        (status_name,), fetchone=True
    )
    return result["status_id"] if result else None


def get_bait_id(bait_name):
    """Get bait_id by bait name."""
    result = run_query(
        "SELECT bait_id FROM bait_type WHERE bait_name = %s",
        (bait_name,), fetchone=True
    )
    return result["bait_id"] if result else None


def get_all_groups():
    """Get all active groups."""
    results = run_query(
        "SELECT group_id, name FROM groups WHERE is_active = TRUE ORDER BY group_id",
        fetchall=True
    ) or []
    return [(row["group_id"], row["name"]) for row in results]


def get_trap_ids(group_id):
    """Get trap IDs for a specific group."""
    results = run_query(
        "SELECT trap_id FROM traps WHERE group_id = %s AND is_active = TRUE",
        (group_id,), fetchall=True
    ) or []
    return [row["trap_id"] for row in results]


def get_bait_station_ids(group_id):
    """Get bait station IDs for a specific group."""
    results = run_query(
        "SELECT station_id FROM bait_stations WHERE group_id = %s AND is_active = TRUE",
        (group_id,), fetchall=True
    ) or []
    return [row["station_id"] for row in results]


def get_user_ids(group_id):
    """Get user IDs for members of a specific group."""
    results = run_query(
        """
        SELECT DISTINCT u.user_id
        FROM users u
        JOIN group_memberships gm ON u.user_id = gm.user_id
        WHERE gm.group_id = %s AND u.is_active = TRUE
        """,
        (group_id,), fetchall=True
    ) or []
    return [row["user_id"] for row in results]


def get_group_name(group_id):
    """Get group name by group_id."""
    result = run_query(
        "SELECT name FROM groups WHERE group_id = %s",
        (group_id,), fetchone=True
    )
    return result["name"] if result else f"Group {group_id}"


def verify_and_fix_existing_data():
    """
    Verify and fix any trap_catches records with mismatched group_id.
    This ensures data integrity by updating group_id based on trap->line->group relationship.
    """
    print("\n" + "=" * 50)
    print("VERIFYING DATA INTEGRITY")
    print("=" * 50)
    
    # Check for records with incorrect or NULL group_id
    result = run_query(
        """
        SELECT COUNT(*) as count
        FROM trap_catches c
        INNER JOIN traps t ON c.trap_id = t.trap_id
        INNER JOIN lines l ON t.line_id = l.line_id
        WHERE c.group_id != l.group_id OR c.group_id IS NULL
        """,
        fetchone=True
    )
    
    if result and result['count'] > 0:
        print(f"Found {result['count']} records with incorrect or NULL group_id")
        
        # Fix these records by updating group_id based on trap->line->group relationship
        run_query(
            """
            UPDATE trap_catches c
            SET group_id = l.group_id
            FROM traps t
            INNER JOIN lines l ON t.line_id = l.line_id
            WHERE c.trap_id = t.trap_id
              AND (c.group_id != l.group_id OR c.group_id IS NULL)
            """
        )
        print("Fixed incorrect group_id values based on trap->line->group relationship")
    else:
        print("All trap_catches records have correct group_id")


def generate_trap_catches(group_id, group_name, trap_ids, user_ids, target_count):
    """Generate trap catch records for a specific group."""
    print(f"    Generating {target_count} trap records...")
    
    species_map = {name: get_species_id(name) for name, _ in SPECIES_WEIGHTS}
    status_map = {name: get_status_id(name) for name, _ in STATUS_WEIGHTS}
    bait_map = {name: get_bait_id(name) for name, _ in BAIT_WEIGHTS}
    
    inserted = 0
    for i in range(target_count):
        catch_date = generate_date_with_seasonality(START_DATE, END_DATE, MONTH_WEIGHTS)
        
        species_name = weighted_choice(SPECIES_WEIGHTS)
        status_name = weighted_choice(STATUS_WEIGHTS)
        bait_name = weighted_choice(BAIT_WEIGHTS)
        condition = weighted_choice(CONDITION_WEIGHTS)
        
        strikes = 1 if species_name != "None" else 0
        rebaited = status_name not in ["Still set, bait OK", "Still set, bait missing"]
        
        sex = random.choice(["Male", "Female", None])
        maturity = random.choice(["Juvenile", "Adult", None])
        
        trap_id = random.choice(trap_ids)
        user_id = random.choice(user_ids)
        
        try:
            # Insert with explicit group_id to ensure data consistency
            run_query(
                """
                INSERT INTO trap_catches (
                    trap_id, recorded_by, catch_date, species_id, sex, maturity,
                    status_id, rebaited, bait_id, bait_details, trap_condition,
                    strikes, notes, group_id
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """,
                (
                    trap_id, user_id, catch_date,
                    species_map.get(species_name), sex, maturity,
                    status_map.get(status_name), rebaited, bait_map.get(bait_name),
                    None, condition, strikes,
                    f"Auto-generated for {group_name}", group_id
                )
            )
            inserted += 1
        except Exception as e:
            # Silently skip errors to avoid breaking the batch
            pass
    
    print(f"      Inserted {inserted} trap records.")


def generate_bait_records(group_id, group_name, station_ids, user_ids, target_count):
    """Generate bait station records for a specific group."""
    if not station_ids:
        print(f"    No bait stations found for {group_name}. Skipping.")
        return
    
    print(f"    Generating {target_count} bait station records...")
    
    species_map = {name: get_species_id(name) for name, _ in SPECIES_WEIGHTS}
    
    inserted = 0
    for i in range(target_count):
        record_date = generate_date_with_seasonality(START_DATE, END_DATE, MONTH_WEIGHTS)
        species_name = weighted_choice(SPECIES_WEIGHTS)
        species_id = species_map.get(species_name)
        
        bait_remaining = round(random.uniform(0.1, 1.0), 3)
        bait_removed = round(random.uniform(0, 0.5), 3)
        bait_added = round(random.uniform(0, 0.5), 3) if random.random() > 0.7 else 0
        
        try:
            run_query(
                """
                INSERT INTO bait_station_records (
                    group_id, station_id, record_date, recorded_by,
                    target_species_id, active_ingredient, formulation,
                    concentration, bait_remaining, bait_removed, bait_added, notes
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """,
                (
                    group_id, random.choice(station_ids), record_date,
                    random.choice(user_ids), species_id,
                    random.choice(ACTIVE_INGREDIENTS), random.choice(FORMULATIONS),
                    round(random.uniform(*CONCENTRATION_RANGE), 3),
                    bait_remaining, bait_removed, bait_added,
                    f"Auto-generated bait record for {group_name}"
                )
            )
            inserted += 1
        except Exception:
            pass
    
    print(f"      Inserted {inserted} bait station records.")


def process_group(group_id, group_name):
    """Generate data for a single group."""
    print(f"\n{'=' * 40}")
    print(f"Processing: {group_name} (ID: {group_id})")
    print(f"{'=' * 40}")
    
    trap_ids = get_trap_ids(group_id)
    station_ids = get_bait_station_ids(group_id)
    user_ids = get_user_ids(group_id)
    
    print(f"  Found {len(trap_ids)} traps")
    print(f"  Found {len(station_ids)} bait stations")
    print(f"  Found {len(user_ids)} users")
    
    if not trap_ids:
        print(f"  WARNING: No traps found for {group_name}. Skipping trap records.")
        print(f"    Please add traps via admin interface and re-run this script.")
    if not user_ids:
        print(f"  WARNING: No users found for {group_name}. Skipping all records.")
        return
    
    # Generate trap catches
    if trap_ids and user_ids:
        generate_trap_catches(group_id, group_name, trap_ids, user_ids, TRAP_RECORDS_PER_GROUP)
    
    # Generate bait station records
    if station_ids and user_ids and BAIT_RECORDS_PER_GROUP > 0:
        generate_bait_records(group_id, group_name, station_ids, user_ids, BAIT_RECORDS_PER_GROUP)
    elif not station_ids:
        print(f"  Note: No bait stations for {group_name}. Bait records skipped.")
    
    # Verify this group's data after generation
    trap_count = run_query(
        "SELECT COUNT(*) as count FROM trap_catches WHERE group_id = %s",
        (group_id,), fetchone=True
    )
    bait_count = run_query(
        "SELECT COUNT(*) as count FROM bait_station_records WHERE group_id = %s",
        (group_id,), fetchone=True
    )
    print(f"\n  VERIFICATION for {group_name}:")
    print(f"    Trap catches: {trap_count['count']}")
    print(f"    Bait records: {bait_count['count']}")


def parse_group_ids():
    """Parse command line arguments to get group IDs."""
    if len(sys.argv) < 2:
        return None  # All groups
    
    arg = sys.argv[1].lower()
    if arg in ['all', '--all', '-a']:
        return None  # All groups
    
    group_ids = []
    for part in arg.split(','):
        try:
            group_ids.append(int(part.strip()))
        except ValueError:
            print(f"Warning: Ignoring invalid group_id '{part}'")
    
    return group_ids if group_ids else None


# =====================================================
# MAIN
# =====================================================

def main():
    print("=" * 50)
    print("Test Data Generator for Analytics & Records Epic")
    print("=" * 50)
    print(f"Date range: {START_DATE.date()} to {END_DATE.date()}")
    print(f"Trap records per group: {TRAP_RECORDS_PER_GROUP}")
    print(f"Bait records per group: {BAIT_RECORDS_PER_GROUP}")
    
    # First, verify and fix any existing data integrity issues
    verify_and_fix_existing_data()
    
    group_ids = parse_group_ids()
    
    if group_ids is None:
        # Generate for ALL active groups
        groups = get_all_groups()
        if not groups:
            print("ERROR: No active groups found.")
            return
        
        print(f"\nFound {len(groups)} active group(s):")
        for gid, name in groups:
            print(f"  - {name} (ID: {gid})")
        
        # Process each group
        for gid, name in groups:
            process_group(gid, name)
    else:
        # Generate only for specified groups
        print(f"\nTarget groups: {group_ids}")
        for gid in group_ids:
            name = get_group_name(gid)
            if name:
                process_group(gid, name)
            else:
                print(f"  WARNING: Group ID {gid} not found, skipping.")
    
    # Final verification to ensure all data is consistent
    verify_and_fix_existing_data()
    
    print("\n" + "=" * 50)
    print("DONE!")
    print("=" * 50)
    print("\nYou can now view:")
    print("  - Group dashboard at /group/dashboard")
    print("  - Super Admin dashboard at /admin")
    print("\nNote: Groups with no traps or bait stations will show zero records.")
    print("      Add traps/bait stations via admin interface first.")


if __name__ == "__main__":
    main()