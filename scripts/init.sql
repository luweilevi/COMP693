-- COMP639 Project 2 - support the 5 selected epics while keeping old Project 1 code more likely to run.
-- Key compatibility choice: keep users.role and keep existing core table names

-- =========================
-- DROP TABLES
-- =========================
DROP TABLE IF EXISTS donation_receipts CASCADE;
DROP TABLE IF EXISTS donations CASCADE;
DROP TABLE IF EXISTS group_donation_settings CASCADE;

DROP TABLE IF EXISTS knowledge_entry_comments CASCADE;
DROP TABLE IF EXISTS knowledge_entry_versions CASCADE;
DROP TABLE IF EXISTS knowledge_entries CASCADE;
DROP TABLE IF EXISTS knowledge_categories CASCADE;
DROP TABLE IF EXISTS group_update_comments CASCADE;
DROP TABLE IF EXISTS group_update_likes CASCADE;
DROP TABLE IF EXISTS group_updates CASCADE;

DROP TABLE IF EXISTS export_logs CASCADE;
DROP TABLE IF EXISTS group_operational_areas CASCADE;
DROP TABLE IF EXISTS bait_station_records CASCADE;
DROP TABLE IF EXISTS bait_stations CASCADE;

DROP TABLE IF EXISTS incidental_observations CASCADE;
DROP TABLE IF EXISTS trap_catches CASCADE;
DROP TABLE IF EXISTS operator_lines CASCADE;
DROP TABLE IF EXISTS traps CASCADE;
DROP TABLE IF EXISTS bait_type CASCADE;
DROP TABLE IF EXISTS bait_category CASCADE;
DROP TABLE IF EXISTS trap_status CASCADE;
DROP TABLE IF EXISTS species CASCADE;
DROP TABLE IF EXISTS lines CASCADE;

DROP TABLE IF EXISTS group_join_requests CASCADE;
DROP TABLE IF EXISTS group_creation_requests CASCADE;
DROP TABLE IF EXISTS group_memberships CASCADE;
DROP TABLE IF EXISTS groups CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- =========================
-- DROP TYPES
-- =========================
DROP TYPE IF EXISTS donation_type_enum CASCADE;
DROP TYPE IF EXISTS donation_status_enum CASCADE;
DROP TYPE IF EXISTS knowledge_status_enum CASCADE;
DROP TYPE IF EXISTS update_status_enum CASCADE;
DROP TYPE IF EXISTS request_status_enum CASCADE;
DROP TYPE IF EXISTS group_visibility_enum CASCADE;
DROP TYPE IF EXISTS group_role CASCADE;
DROP TYPE IF EXISTS user_role CASCADE;
DROP TYPE IF EXISTS line_type CASCADE;
DROP TYPE IF EXISTS bait_station_type_enum CASCADE;
DROP TYPE IF EXISTS trap_type_enum CASCADE;
DROP TYPE IF EXISTS sex_enum CASCADE;
DROP TYPE IF EXISTS maturity_enum CASCADE;
DROP TYPE IF EXISTS yes_no_enum CASCADE;
DROP TYPE IF EXISTS trap_condition_enum CASCADE;
DROP TYPE IF EXISTS observation_type_enum CASCADE;

-- =========================
-- TYPES
-- =========================
-- Kept for compatibility with old code that reads users.role.
CREATE TYPE user_role AS ENUM ('observer', 'operator', 'admin');

-- New per-group roles for Project 2 RBAC.
CREATE TYPE group_role AS ENUM ('observer', 'operator', 'group_coordinator');
CREATE TYPE group_visibility_enum AS ENUM ('Public', 'Private');
CREATE TYPE request_status_enum AS ENUM ('Pending', 'Approved', 'Rejected');

-- Updated for Project 2: two line types.
CREATE TYPE line_type AS ENUM ('Trap', 'Bait Station');

CREATE TYPE trap_type_enum AS ENUM (
    'A24', 'DOC 150', 'DOC 200', 'DOC 250', 'Flipping Timmy',
    'Rat trap', 'T-Rex Rat Trap', 'Trapinator', 'Victor'
);

CREATE TYPE bait_station_type_enum AS ENUM (
    'Bait Safe', 'Chimney', 'EnviroMate100', 'Flowerpot', 'Hockey stick',
    'KK', 'Kilmore', 'Mini Philproof', 'PelGar Rat Station', 'Philproof',
    'Pied Piper', 'Protecta Ambush', 'Protecta EVO Edge', 'Protecta Sidekick',
    'Rodent Cafe', 'Sentry', 'Sentry Plus', 'Striker', 'Trakka', 'Tunnel',
    'Wasptek', 'ZIP tunnel', 'Other'
);

CREATE TYPE sex_enum AS ENUM ('Male', 'Female');
CREATE TYPE maturity_enum AS ENUM ('Juvenile', 'Adult');
CREATE TYPE yes_no_enum AS ENUM ('Yes', 'No');

CREATE TYPE trap_condition_enum AS ENUM (
    'OK', 'Needs maintenance', 'Repaired', 'Regassed', 'Recurred', 'Battery charge'
);

CREATE TYPE observation_type_enum AS ENUM (
    'Bird sighting',
    'Predator track or sighting',
    'Native species track or sighting',
    'Other'
);

CREATE TYPE update_status_enum AS ENUM ('Draft', 'Published', 'Removed');
CREATE TYPE knowledge_status_enum AS ENUM ('Draft', 'Pending Review', 'Published', 'Rejected', 'Archived');
CREATE TYPE donation_type_enum AS ENUM ('Group', 'Platform', 'General');
CREATE TYPE donation_status_enum AS ENUM ('Pending', 'Completed', 'Cancelled');

-- =========================
-- CORE USERS AND GROUPS
-- =========================
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    contact_number VARCHAR(25),
    emergency_contact VARCHAR(100),

    -- Compatibility field for old Project 1 code.
    role user_role NOT NULL DEFAULT 'observer',

    -- Project 2 platform-level Super Admin flag.
    -- Super Admin is NOT stored in users.role; users.role is only kept for old Project 1 code compatibility.
    is_super_admin BOOLEAN NOT NULL DEFAULT FALSE,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    slug VARCHAR(120) UNIQUE NOT NULL,
    short_description VARCHAR(255),
    description TEXT,
    visibility group_visibility_enum NOT NULL DEFAULT 'Public',
    tile_image VARCHAR(255),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE group_memberships (
    membership_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    group_id INT NOT NULL REFERENCES groups(group_id) ON DELETE CASCADE,
    role group_role NOT NULL DEFAULT 'observer',
    status request_status_enum NOT NULL DEFAULT 'Approved',
    joined_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, group_id)
);

CREATE TABLE group_creation_requests (
    request_id SERIAL PRIMARY KEY,
    requested_by INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    proposed_name VARCHAR(100) NOT NULL,
    proposed_description TEXT,
    requested_visibility group_visibility_enum NOT NULL DEFAULT 'Public',
    status request_status_enum NOT NULL DEFAULT 'Pending',
    reviewed_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    reviewed_at TIMESTAMP,
    admin_notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE group_join_requests (
    request_id SERIAL PRIMARY KEY,
    group_id INT NOT NULL REFERENCES groups(group_id) ON DELETE CASCADE,
    requested_by INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    status request_status_enum NOT NULL DEFAULT 'Pending',
    reviewed_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    reviewed_at TIMESTAMP,
    message TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (group_id, requested_by)
);

-- =========================
-- EXISTING CORE TABLES, WITH MINIMAL GROUP SUPPORT
-- =========================
CREATE TABLE lines (
    line_id SERIAL PRIMARY KEY,
    -- group_id is nullable at schema level to reduce breakage in old insert code.
    -- For production-quality multi-group logic, application code should always provide this.
    group_id INT REFERENCES groups(group_id) ON DELETE CASCADE DEFAULT 1,
    name VARCHAR(100) NOT NULL,
    type line_type NOT NULL DEFAULT 'Trap',
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    comments TEXT,
    UNIQUE (group_id, name)
);

CREATE TABLE traps (
    trap_id SERIAL PRIMARY KEY,
    group_id INT REFERENCES groups(group_id) ON DELETE CASCADE DEFAULT 1,
    code VARCHAR(50) NOT NULL,
    trap_type trap_type_enum NOT NULL,
    line_id INT NOT NULL REFERENCES lines(line_id) ON DELETE RESTRICT,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    comments TEXT,
    UNIQUE (group_id, code)
);

CREATE TABLE operator_lines (
    operator_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    line_id INT NOT NULL REFERENCES lines(line_id) ON DELETE CASCADE,
    PRIMARY KEY (operator_id, line_id)
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    species_name VARCHAR(50) UNIQUE NOT NULL,
    display_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE trap_status (
    status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(50) UNIQUE NOT NULL,
    display_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bait_category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE NOT NULL,
    display_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bait_type (
    bait_id SERIAL PRIMARY KEY,
    bait_name VARCHAR(100) UNIQUE NOT NULL,
    category_id INT REFERENCES bait_category(category_id) ON DELETE SET NULL,
    display_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    notes TEXT,
    created_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE trap_catches (
    catch_id SERIAL PRIMARY KEY,
    group_id INT REFERENCES groups(group_id) ON DELETE CASCADE DEFAULT 1,
    trap_id INT NOT NULL REFERENCES traps(trap_id),
    recorded_by INT REFERENCES users(user_id),
    catch_date TIMESTAMP NOT NULL,

    species_id INT NOT NULL REFERENCES species(species_id),
    sex VARCHAR(10),
    maturity VARCHAR(20),

    status_id INT NOT NULL REFERENCES trap_status(status_id),
    rebaited BOOLEAN NOT NULL,
    bait_id INT NOT NULL REFERENCES bait_type(bait_id),
    bait_details VARCHAR(100),

    trap_condition VARCHAR(50) NOT NULL,
    strikes INT NOT NULL DEFAULT 0,
    notes TEXT
);


-- =========================
-- REQUIRED EPIC: BAIT STATIONS
-- =========================
CREATE TABLE bait_stations (
    station_id SERIAL PRIMARY KEY,
    group_id INT REFERENCES groups(group_id) ON DELETE CASCADE DEFAULT 1,
    line_id INT NOT NULL REFERENCES lines(line_id) ON DELETE RESTRICT,
    code VARCHAR(50) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    bait_station_type bait_station_type_enum NOT NULL,
    other_type VARCHAR(100),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    comments TEXT,
    UNIQUE (group_id, code),
    CHECK (bait_station_type <> 'Other' OR other_type IS NOT NULL)
);

CREATE TABLE bait_station_records (
    record_id SERIAL PRIMARY KEY,
    group_id INT REFERENCES groups(group_id) ON DELETE CASCADE DEFAULT 1,
    station_id INT NOT NULL REFERENCES bait_stations(station_id) ON DELETE CASCADE,
    record_date TIMESTAMP NOT NULL,
    recorded_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    target_species_id INT NOT NULL REFERENCES species(species_id),
    active_ingredient VARCHAR(100) NOT NULL,
    formulation VARCHAR(100) NOT NULL,
    concentration DECIMAL(6,3) NOT NULL,
    bait_remaining DECIMAL(8,3) NOT NULL,
    bait_removed DECIMAL(8,3),
    bait_added DECIMAL(8,3),
    notes TEXT
);

CREATE TABLE incidental_observations (
    observation_id SERIAL PRIMARY KEY,
    group_id INT REFERENCES groups(group_id) ON DELETE CASCADE DEFAULT 1,
    trap_id INT REFERENCES traps(trap_id) ON DELETE CASCADE,
    bait_station_id INT REFERENCES bait_stations(station_id) ON DELETE CASCADE,
    recorded_by INT NOT NULL REFERENCES users(user_id),
    observation_date TIMESTAMP NOT NULL,
    observation_type observation_type_enum NOT NULL,
    notes TEXT,
    CONSTRAINT check_trap_or_bait CHECK (
        (trap_id IS NOT NULL AND bait_station_id IS NULL) OR 
        (trap_id IS NULL AND bait_station_id IS NOT NULL)
    )
);
-- =========================
-- LOCATION FEATURES
-- =========================
CREATE TABLE group_operational_areas (
    area_id SERIAL PRIMARY KEY,
    group_id INT NOT NULL UNIQUE REFERENCES groups(group_id) ON DELETE CASCADE,
    boundary_geojson JSONB NOT NULL,
    created_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- ANALYTICS & RECORDS
-- =========================
CREATE TABLE export_logs (
    export_id SERIAL PRIMARY KEY,
    group_id INT REFERENCES groups(group_id) ON DELETE CASCADE,
    exported_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    export_type VARCHAR(50) NOT NULL,
    filters_used JSONB,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- GROUP UPDATES & KNOWLEDGE HUB
-- =========================
CREATE TABLE group_updates (
    update_id SERIAL PRIMARY KEY,
    group_id INT NOT NULL REFERENCES groups(group_id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    body TEXT NOT NULL,
    image_path VARCHAR(255),
    status update_status_enum NOT NULL DEFAULT 'Draft',
    created_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    published_at TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE group_update_likes (
    update_id INT NOT NULL REFERENCES group_updates(update_id) ON DELETE CASCADE,
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (update_id, user_id)
);

CREATE TABLE group_update_comments (
    comment_id SERIAL PRIMARY KEY,
    update_id INT NOT NULL REFERENCES group_updates(update_id) ON DELETE CASCADE,
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    comment_text TEXT NOT NULL,
    is_removed BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE knowledge_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    display_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE knowledge_entries (
    entry_id SERIAL PRIMARY KEY,
    category_id INT REFERENCES knowledge_categories(category_id) ON DELETE SET NULL,
    group_id INT REFERENCES groups(group_id) ON DELETE SET NULL,
    title VARCHAR(150) NOT NULL,
    body TEXT NOT NULL,
    image_path VARCHAR(255),
    status knowledge_status_enum NOT NULL DEFAULT 'Draft',
    is_featured BOOLEAN NOT NULL DEFAULT FALSE,
    created_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    approved_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    approved_at TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE knowledge_entry_versions (
    version_id SERIAL PRIMARY KEY,
    entry_id INT NOT NULL REFERENCES knowledge_entries(entry_id) ON DELETE CASCADE,
    version_number INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    body TEXT NOT NULL,
    changed_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (entry_id, version_number)
);

CREATE TABLE knowledge_entry_comments (
    comment_id SERIAL PRIMARY KEY,
    entry_id INT NOT NULL REFERENCES knowledge_entries(entry_id) ON DELETE CASCADE,
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    comment_text TEXT NOT NULL,
    is_removed BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- DONATIONS & SUPPORT
-- =========================
CREATE TABLE group_donation_settings (
    group_id INT PRIMARY KEY REFERENCES groups(group_id) ON DELETE CASCADE,
    donations_enabled BOOLEAN NOT NULL DEFAULT TRUE,
    donation_description TEXT,
    is_registered_charity BOOLEAN NOT NULL DEFAULT FALSE,
    charity_name VARCHAR(150),
    charity_registration_number VARCHAR(50),
    updated_by INT REFERENCES users(user_id) ON DELETE SET NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE donations (
    donation_id SERIAL PRIMARY KEY,
    donation_type donation_type_enum NOT NULL,
    group_id INT REFERENCES groups(group_id) ON DELETE SET NULL,
    donor_user_id INT REFERENCES users(user_id) ON DELETE SET NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    donated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    donor_name VARCHAR(100),
    contact_email VARCHAR(100),
    is_anonymous BOOLEAN NOT NULL DEFAULT FALSE,
    message TEXT,
    status donation_status_enum NOT NULL DEFAULT 'Completed'
);

CREATE TABLE donation_receipts (
    receipt_id SERIAL PRIMARY KEY,
    donation_id INT NOT NULL UNIQUE REFERENCES donations(donation_id) ON DELETE CASCADE,
    receipt_number VARCHAR(50) UNIQUE NOT NULL,
    receipt_file_path VARCHAR(255),
    issued_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    emailed_at TIMESTAMP
);

-- =========================
-- DEFAULT DATA FOR COMPATIBILITY
-- =========================
-- Default group lets old single-group code continue operating while new multi-group features are added.
INSERT INTO groups (group_id, name, slug, short_description, description, visibility, is_active)
VALUES (1, 'Predator Free Lincoln University', 'pf-lu', 'Default conservation group', 'Default group used for backward compatibility.', 'Public', TRUE);

-- Keep the sequence correct after manually inserting group_id = 1.
SELECT setval('groups_group_id_seq', 1, TRUE);

-- =========================
-- PROJECT 2 ROLE ACCESS VIEW
-- =========================
-- This view makes the new role model easier for Flask code to query later.
-- Platform-level Super Admin comes from users.is_super_admin.
-- Group-level roles come from group_memberships.role.
CREATE OR REPLACE VIEW user_group_access AS
SELECT
    u.user_id,
    u.username,
    u.email,
    u.first_name,
    u.last_name,
    u.role AS legacy_role,
    u.is_super_admin,
    gm.group_id,
    g.name AS group_name,
    g.visibility AS group_visibility,
    gm.role AS group_role,
    gm.status AS membership_status
FROM users u
LEFT JOIN group_memberships gm ON u.user_id = gm.user_id
LEFT JOIN groups g ON gm.group_id = g.group_id;

-- =========================
-- HELPFUL INDEXES
-- =========================
CREATE INDEX idx_group_memberships_user ON group_memberships(user_id);
CREATE INDEX idx_group_memberships_group ON group_memberships(group_id);
CREATE INDEX idx_lines_group ON lines(group_id);
CREATE INDEX idx_traps_group ON traps(group_id);
CREATE INDEX idx_trap_catches_group_date ON trap_catches(group_id, catch_date);
CREATE INDEX idx_bait_stations_group ON bait_stations(group_id);
CREATE INDEX idx_bait_station_records_group_date ON bait_station_records(group_id, record_date);
CREATE INDEX idx_group_updates_group ON group_updates(group_id);
CREATE INDEX idx_knowledge_entries_status ON knowledge_entries(status);
CREATE INDEX idx_donations_group ON donations(group_id);
CREATE INDEX idx_donations_date ON donations(donated_at);
