# COMP639 Project 2 – Wet

## Project Overview

PredatorFreeHub is a multi-group conservation management platform designed to support predator control activities across multiple conservation groups. The system enables organisations to manage traps field records, analytics, donations, community updates and knowledge sharing through a role-based access model.

---

## Technology Stack

- Python (Flask)
- PostgreSQL
- Bootstrap (UI)
- JavaScript

---

## System Roles

The system supports multiple roles:

- **Super Admin**: Full platform access, manages all groups
- **Group Coordinator**: Manages lines, traps, bait stations, and members for their group
- **Operator**: Records trap catches and bait station checks
- **Observer**: Views data and reports

---

## Project Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/COMP639-StudioProjects-26S1/COMP639_Project_2_Weta.git
cd COMP639_Project_2_Weta
```

---

### 2. Create virtual environment

```bash
python -m venv venv
source venv/bin/activate   # Mac/Linux
venv\Scripts\activate      # Windows
```

---

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

If `psycopg2` fails to install, use the binary version:

```bash
pip install psycopg2-binary
```

---

### 4. Configure PostgreSQL Database

Create a PostgreSQL database and update the database connection settings in:

`/app/connect.py`

Example:

```python
DB_NAME = "ecotrap"
DB_USER = "your_user"
DB_PASSWORD = "your_password"
DB_HOST = "localhost"
DB_PORT = "5432"
```

---

### 5. Initialise Database

Run the provided SQL scripts:

```bash
psql -U your_user -d ecotrap -f create_database.sql
psql -U your_user -d ecotrap -f populate_database.sql
```

---

### 6. Run the Application

```bash
python run.py
```

Then open:

http://localhost:5000

---

## Test Data Generation

To populate the database with realistic trap catch and bait station records for analytics dashboards, run the seed data script.

### Prerequisites

- Database is initialised with `create_database.sql` and `populate_database.sql`
- Flask app is configured (database connection in `app/connect.py`)

### Run the Script

```bash
# Activate virtual environment
source venv/bin/activate

# Generate test data for all active groups
python3 seed_test_data.py

# Generate test data only for specific groups
python3 seed_test_data.py 2          # Group ID 2 only
python3 seed_test_data.py 2,3        # Groups 2 and 3
```

### What It Does

- Generates **150 trap catch records** per group (12+ months, seasonal variation)
- Generates **75 bait station records** per group
- Data includes variation across:
  - Dates (with summer/winter seasonality)
  - Species (Possum, Rat, Mouse, Stoat, etc.)
  - Trap lines and bait stations
  - Trap status and bait types

### Notes for PythonAnywhere Deployment

The script can be run directly in the PythonAnywhere Bash console:

1. Go to **Consoles → Bash**
2. Navigate to project directory: `cd ~/COMP639_Project_2_Weta`
3. Activate venv: `source venv/bin/activate`
4. Run: `python3 seed_test_data.py`

> The script only inserts new records. It does not delete existing data. Run it once after the database is set up.

---

## Usage Instructions

### Login

Navigate to `/login` and use one of the test accounts below.

### Navigation

- Dashboard: Role-appropriate dashboard (group analytics for members, admin dashboard for Super Admin)
- Data: View lines, equipment, catch records, and observations
- Config (Coordinator/Admin): Manage species, trap status, bait types, bait categories
- Management (Coordinator/Admin): User management and group management
- About Us, Contact Us, Profile, Logout

### Contact Us

Users can:

- Click email links to contact team members directly
- Use the form to open a pre-filled email via their email client

---

## Test Accounts

| Role              | Username  | Password     |
| ----------------- | --------- | ------------ |
| Super Admin       | alex332   | Password123! |
| Group Coordinator | ray_hm    | Password123! |
| Operator          | ben_ops   | Password123! |
| Observer          | cara_view | Password123! |

---

## Key Features

### Core Platform Transformation (Required Epic)

- Multi-group conservation platform
- Public and private group visibility
- Group creation approval workflow
- Group join request and approval workflow
- Group-specific role management:
  - Group Coordinator
  - Operator
  - Observer
- Super Admin management functions
- Group switching and active group context

### Analytics & Records

- Group dashboard with interactive analytics charts
- Super Admin dashboard with cross-group reporting
- Species and date range filtering
- Automatic chart summaries
- trap.nz CSV export functionality
- Trap catch and bait station reporting

### Location Features

- Interactive map displaying traps and bait stations
- Group operational area boundaries
- Location validation for traps and bait stations
- Group-specific map view
- Super Admin group selection on maps

### Group Updates & Knowledge Hub

- Create and publish group updates
- Community news and announcements
- Knowledge Hub article management
- Search and browse shared knowledge resources

### Donations & Support

- Group-specific donations
- Platform-wide donations
- Donation summary dashboard
- Anonymous donation option
- Donation history and reporting

### Existing Project 1 Features

- Trap management
- Bait station management
- Trap catch recording
- Bait station record recording
- Operator line assignments
- Species, bait type and trap status management

---

## Special Configurations

### Database

- PostgreSQL must be installed and running
- All tables must be created using provided SQL scripts

### Session Handling

- Flask session is used for authentication
- Users must log in to access system features

### Email (Contact Us)

- The Contact Us form uses `mailto:` to open the user's email client
- No SMTP configuration is required

---

## UI Standards

The application follows a shared UI design standard to ensure consistency across all pages.

### Design Principles

- Consistent navigation structure
- Responsive layout for desktop, tablet and mobile
- Reusable colour palette and button styles
- Standardised table, form and card layouts
- Consistent role-based navigation
- Accessible and readable data visualisations

### Components

- Dashboard cards
- Data tables
- Forms and filters
- Charts and analytics panels
- Interactive maps
- Group information cards
- Status badges

Detailed standards are documented in:

📄 `UI_STANDARDS.md`

---

## Generative AI (GenAI) Usage Declaration

Generative AI tools were used as development support tools throughout Project 2.

AI assistance was used for:

- Flask route design
- SQL query development
- PostgreSQL troubleshooting
- Dashboard analytics implementation
- CSV export development
- Interactive map features
- Donation workflow implementation
- Group management workflows
- UI and Bootstrap refinement
- Test scenario preparation
- Documentation review and refinement

All AI-generated outputs were reviewed, validated, modified and integrated by team members before use.

The team remains fully responsible for all design decisions, implementation details and submitted work.

---

## GenAI Usage Log

| Entry | Tool Used        | Purpose                                                                                                     | Prompt Used                                                                                                                                                                            |
| ----- | ---------------- | ----------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1     | ChatGPT (OpenAI) | Assist in designing the multi-group platform architecture and role model for Project 2                      | "How can a single-group conservation system be redesigned to support multiple groups, role-based memberships, and Super Admin management?"                                             |
| 2     | ChatGPT (OpenAI) | Design PostgreSQL schema changes to support groups, memberships, join requests, and group creation requests | "Help extend this PostgreSQL database schema to support multi-group management while remaining compatible with the existing Project 1 system."                                         |
| 3     | ChatGPT (OpenAI) | Generate SQL queries for group management and membership reporting                                          | "Create SQL queries to display groups, member counts, coordinator information, and membership details."                                                                                |
| 4     | ChatGPT (OpenAI) | Assist in implementing group creation request workflows                                                     | "How should a Group Creation Request workflow be implemented using Flask and PostgreSQL?"                                                                                              |
| 5     | ChatGPT (OpenAI) | Assist in implementing group join request approval workflows                                                | "Design a join request approval process where coordinators can approve or reject users joining a group."                                                                               |
| 6     | ChatGPT (OpenAI) | Support development of role-based access control and permission validation                                  | "What permission checks should be applied for Super Admins, Coordinators, Operators, and Observers in a multi-group system?"                                                           |
| 7     | ChatGPT (OpenAI) | Assist with Analytics & Records dashboard implementation                                                    | "Suggest dashboard analytics suitable for conservation groups using trap catches and bait station records."                                                                            |
| 8     | ChatGPT (OpenAI) | Generate SQL queries for chart data and filtering                                                           | "Create PostgreSQL queries to calculate catch trends, species distribution, and line activity statistics."                                                                             |
| 9     | ChatGPT (OpenAI) | Troubleshoot dashboard chart issues and data aggregation problems                                           | "Why are bait station records being included in trap catch analytics and how can this be corrected?"                                                                                   |
| 10    | ChatGPT (OpenAI) | Assist in implementing CSV exports compatible with trap.nz                                                  | "Generate export logic and CSV structures that match trap.nz import requirements."                                                                                                     |
| 11    | ChatGPT (OpenAI) | Assist in designing interactive map features                                                                | "How can traps, bait stations, and operational boundaries be displayed using an interactive map?"                                                                                      |
| 12    | ChatGPT (OpenAI) | Support validation of trap and bait station locations within group operational areas                        | "How can location validation be implemented to ensure equipment remains within a group's operational boundary?"                                                                        |
| 13    | ChatGPT (OpenAI) | Assist in implementing Donations & Support features                                                         | "Design a donation workflow supporting group donations, platform donations, anonymous donations, and donation history."                                                                |
| 14    | ChatGPT (OpenAI) | Assist in troubleshooting donation summary calculations and filtering logic                                 | "Help debug donation summary totals and group filtering issues in a Flask application."                                                                                                |
| 15    | ChatGPT (OpenAI) | Assist in developing Group Updates and Knowledge Hub features                                               | "Suggest a structure for community updates, knowledge articles, comments, moderation, and publication workflows."                                                                      |
| 16    | ChatGPT (OpenAI) | Support UI design consistency across all Project 2 features                                                 | "Review our Flask templates and suggest improvements to maintain a consistent Bootstrap-based user interface."                                                                         |
| 17    | ChatGPT (OpenAI) | Generate PostgreSQL queries to display group coordinators and memberships                                   | "Show group coordinators with names and usernames while avoiding duplicate records in PostgreSQL."                                                                                     |
| 18    | ChatGPT (OpenAI) | Assist in creating realistic test data for groups, lines, traps, bait stations, and records                 | "Generate sample data that supports testing multiple groups with different roles, equipment, and activity records."                                                                    |
| 19    | ChatGPT (OpenAI) | Support troubleshooting PostgreSQL syntax and aggregation issues                                            | "Convert MySQL aggregation queries to PostgreSQL and resolve STRING_AGG and GROUP_CONCAT compatibility issues."                                                                        |
| 20    | ChatGPT (OpenAI) | Assist in preparing detailed functional test scenarios and acceptance testing plans                         | "Create step-by-step test scenarios covering user registration, group creation, approvals, role permissions, trap management, bait stations, analytics, maps, donations, and exports." |
| 21    | ChatGPT (OpenAI) | Assist in creating structured QA test cases for Jira and project validation                                 | "Convert system requirements and user stories into detailed Jira testing tasks with expected results and validation steps."                                                            |
| 22    | ChatGPT (OpenAI) | Support documentation updates, README preparation, and deployment instructions                              | "Review the project README and suggest improvements that better reflect Project 2 functionality and implementation."                                                                   |
| 23    | ChatGPT (OpenAI) | Assist in reviewing and refining UI standards documentation                                                 | "Create and refine UI standards covering navigation, colours, forms, tables, dashboards, maps, and responsive layouts."                                                                |
| 24    | ChatGPT (OpenAI) | Assist in creating group images and static content for conservation groups                                  | "Generate simple SVG image concepts for conservation groups that can be used as group tile images."                                                                                    |
| 25    | ChatGPT (OpenAI) | Support final project review, feature verification, and submission readiness checks                         | "Review the implemented Project 2 features and identify any missing functionality, edge cases, or testing gaps before submission."                                                     |
| 26    | ChatGPT (OpenAI) | Create detailed end-to-end testing scenarios covering all Project 1 and Project 2 features                  | "Create comprehensive end-to-end test scenarios covering group creation, approvals, memberships, traps, bait stations, analytics, maps and donations."                                 |
| 27    | ChatGPT (OpenAI) | Generate Excel-based test plans and validation checklists for system testing                                | "Create a structured testing spreadsheet with test steps, expected results, priorities and status tracking."                                                                           |
| 28    | ChatGPT (OpenAI) | Review implemented functionality and identify missing test coverage before submission                       | "Analyse the implemented features and identify edge cases, permissions and workflows that should be tested before project submission."                                                 |

---

## Compliance Statement

- All GenAI usage has been acknowledged in this document.
- Generated outputs were critically reviewed and adapted before use.
- The team remains fully responsible for all submitted work.
- The team is able to explain any part of the implementation if required.
