TRUNCATE TABLE donation_receipts CASCADE;
TRUNCATE TABLE donations CASCADE;
TRUNCATE TABLE group_donation_settings CASCADE;
TRUNCATE TABLE knowledge_entry_comments CASCADE;
TRUNCATE TABLE knowledge_entry_versions CASCADE;
TRUNCATE TABLE knowledge_entries CASCADE;
TRUNCATE TABLE knowledge_categories CASCADE;
TRUNCATE TABLE group_update_comments CASCADE;
TRUNCATE TABLE group_update_likes CASCADE;
TRUNCATE TABLE group_updates CASCADE;
TRUNCATE TABLE export_logs CASCADE;
TRUNCATE TABLE group_operational_areas CASCADE;
TRUNCATE TABLE bait_station_records CASCADE;
TRUNCATE TABLE bait_stations CASCADE;
TRUNCATE TABLE group_join_requests CASCADE;
TRUNCATE TABLE group_creation_requests CASCADE;
TRUNCATE TABLE group_memberships CASCADE;
TRUNCATE TABLE groups CASCADE;
TRUNCATE TABLE trap_catches CASCADE;
TRUNCATE TABLE incidental_observations CASCADE;
TRUNCATE TABLE operator_lines CASCADE;
TRUNCATE TABLE traps CASCADE;
TRUNCATE TABLE lines CASCADE;
TRUNCATE TABLE bait_type CASCADE;
TRUNCATE TABLE bait_category CASCADE;
TRUNCATE TABLE trap_status CASCADE;
TRUNCATE TABLE species CASCADE;
TRUNCATE TABLE users CASCADE;


-- =====================================================
-- USERS
-- =====================================================
INSERT INTO users
(username, email, password_hash, first_name, last_name, contact_number, emergency_contact, role)
VALUES
('alex332',       'alex332@test.com',       'pbkdf2_sha256$260000$997ec762297f9e11a14f69961d56daeb$e4e99baf28ec373d11ffff3a13a502f25430598ec4b5c7628350159ab4aa2987', 'Alex',   'Smith',    '0210000001', 'Amy Smith 0219000001', 'admin'),
('mor_ad',  'morgan_admin@test.com',  'pbkdf2_sha256$260000$997ec762297f9e11a14f69961d56daeb$e4e99baf28ec373d11ffff3a13a502f25430598ec4b5c7628350159ab4aa2987', 'Morgan', 'Taylor',   '0210000002', 'Jordan Taylor 0219000002', 'admin'),
('ray_hm',       'ray_hm@test.com',       'pbkdf2_sha256$260000$997ec762297f9e11a14f69961d56daeb$e4e99baf28ec373d11ffff3a13a502f25430598ec4b5c7628350159ab4aa2987', 'Ray',    'HM',       '0210000999', 'Emergency Contact 0219999999', 'admin'),
('ben_ops',       'ben_ops@test.com',       'pbkdf2_sha256$260000$11ed0efdc1e1436281f32138a2a39365$ad815e5411bb0a2560d6c2807f69facb9950d8c35df1e479e7f36475bb6b53e3', 'Ben',    'Johnson',  '0210000011', 'Lily Johnson 0219000011', 'operator'),
('olivia_field',  'olivia_field@test.com',  'pbkdf2_sha256$260000$11ed0efdc1e1436281f32138a2a39365$ad815e5411bb0a2560d6c2807f69facb9950d8c35df1e479e7f36475bb6b53e3', 'Olivia', 'Brown',    '0210000012', 'Mia Brown 0219000012', 'operator'),
('liam_ranger',   'liam_ranger@test.com',   'pbkdf2_sha256$260000$11ed0efdc1e1436281f32138a2a39365$ad815e5411bb0a2560d6c2807f69facb9950d8c35df1e479e7f36475bb6b53e3', 'Liam',   'Wilson',   '0210000013', 'Grace Wilson 0219000013', 'operator'),
('zoe_tracker',   'zoe_tracker@test.com',   'pbkdf2_sha256$260000$11ed0efdc1e1436281f32138a2a39365$ad815e5411bb0a2560d6c2807f69facb9950d8c35df1e479e7f36475bb6b53e3', 'Zoe',    'Martin',   '0210000014', 'Ella Martin 0219000014', 'operator'),
('noah_patrol',   'noah_patrol@test.com',   'pbkdf2_sha256$260000$11ed0efdc1e1436281f32138a2a39365$ad815e5411bb0a2560d6c2807f69facb9950d8c35df1e479e7f36475bb6b53e3', 'Noah',   'Anderson', '0210000015', 'Ruby Anderson 0219000015', 'operator'),
('emma_traps',    'emma_traps@test.com',    'pbkdf2_sha256$260000$11ed0efdc1e1436281f32138a2a39365$ad815e5411bb0a2560d6c2807f69facb9950d8c35df1e479e7f36475bb6b53e3', 'Emma',   'White',    '0210000016', 'Sophie White 0219000016', 'operator'),
('jack_outdoor',  'jack_outdoor@test.com',  'pbkdf2_sha256$260000$11ed0efdc1e1436281f32138a2a39365$ad815e5411bb0a2560d6c2807f69facb9950d8c35df1e479e7f36475bb6b53e3', 'Jack',   'Thomas',   '0210000017', 'Olive Thomas 0219000017', 'operator'),
('ava_monitor',   'ava_monitor@test.com',   'pbkdf2_sha256$260000$11ed0efdc1e1436281f32138a2a39365$ad815e5411bb0a2560d6c2807f69facb9950d8c35df1e479e7f36475bb6b53e3', 'Ava',    'Hall',     '0210000018', 'Aria Hall 0219000018', 'operator'),
('ethan_checker', 'ethan_checker@test.com', 'pbkdf2_sha256$260000$11ed0efdc1e1436281f32138a2a39365$ad815e5411bb0a2560d6c2807f69facb9950d8c35df1e479e7f36475bb6b53e3', 'Ethan',  'Young',    '0210000019', 'Nina Young 0219000019', 'operator'),
('mia_bush',      'mia_bush@test.com',      'pbkdf2_sha256$260000$11ed0efdc1e1436281f32138a2a39365$ad815e5411bb0a2560d6c2807f69facb9950d8c35df1e479e7f36475bb6b53e3', 'Mia',    'King',     '0210000020', 'Lucy King 0219000020', 'operator'),
('cara_view',     'cara_view@test.com',     'pbkdf2_sha256$260000$e6f9d7a4c1a40d6cf3269cdcdc41a317$80e92079c24015cb341cad36cde86c74891e366c84fb1d0f947c7e3b1c0bf34c', 'Cara',   'Lee',      '0210000031', 'Tom Lee 0219000031', 'observer'),
('lucas_watch',   'lucas_watch@test.com',   'pbkdf2_sha256$260000$e6f9d7a4c1a40d6cf3269cdcdc41a317$80e92079c24015cb341cad36cde86c74891e366c84fb1d0f947c7e3b1c0bf34c', 'Lucas',  'Scott',    '0210000032', 'Amy Scott 0219000032', 'observer'),
('ella_green',    'ella_green@test.com',    'pbkdf2_sha256$260000$e6f9d7a4c1a40d6cf3269cdcdc41a317$80e92079c24015cb341cad36cde86c74891e366c84fb1d0f947c7e3b1c0bf34c', 'Ella',   'Green',    '0210000033', 'Paul Green 0219000033', 'observer'),
('henry_spotter', 'henry_spotter@test.com', 'pbkdf2_sha256$260000$e6f9d7a4c1a40d6cf3269cdcdc41a317$80e92079c24015cb341cad36cde86c74891e366c84fb1d0f947c7e3b1c0bf34c', 'Henry',  'Walker',   '0210000034', 'Kate Walker 0219000034', 'observer'),
('sophia_trail',  'sophia_trail@test.com',  'pbkdf2_sha256$260000$e6f9d7a4c1a40d6cf3269cdcdc41a317$80e92079c24015cb341cad36cde86c74891e366c84fb1d0f947c7e3b1c0bf34c', 'Sophia', 'Wright',   '0210000035', 'Ben Wright 0219000035', 'observer'),
('charlie_note',  'charlie_note@test.com',  'pbkdf2_sha256$260000$e6f9d7a4c1a40d6cf3269cdcdc41a317$80e92079c24015cb341cad36cde86c74891e366c84fb1d0f947c7e3b1c0bf34c', 'Charlie','Hill',     '0210000036', 'Holly Hill 0219000036', 'observer'),
('grace_field',   'grace_field@test.com',   'pbkdf2_sha256$260000$e6f9d7a4c1a40d6cf3269cdcdc41a317$80e92079c24015cb341cad36cde86c74891e366c84fb1d0f947c7e3b1c0bf34c', 'Grace',  'Baker',    '0210000037', 'Jake Baker 0219000037', 'observer'),
('leo_forest',    'leo_forest@test.com',    'pbkdf2_sha256$260000$e6f9d7a4c1a40d6cf3269cdcdc41a317$80e92079c24015cb341cad36cde86c74891e366c84fb1d0f947c7e3b1c0bf34c', 'Leo',    'Adams',    '0210000038', 'Emma Adams 0219000038', 'observer'),
('ruby_sight',    'ruby_sight@test.com',    'pbkdf2_sha256$260000$e6f9d7a4c1a40d6cf3269cdcdc41a317$80e92079c24015cb341cad36cde86c74891e366c84fb1d0f947c7e3b1c0bf34c', 'Ruby',   'Nelson',   '0210000039', 'Mason Nelson 0219000039', 'observer'),
('isaac_track',   'isaac_track@test.com',   'pbkdf2_sha256$260000$e6f9d7a4c1a40d6cf3269cdcdc41a317$80e92079c24015cb341cad36cde86c74891e366c84fb1d0f947c7e3b1c0bf34c', 'Isaac',  'Carter',   '0210000040', 'Sarah Carter 0219000040', 'observer');


-- =====================================================
-- DEFAULT GROUPS AND MEMBERSHIPS
-- =====================================================
INSERT INTO groups
(group_id, name, slug, short_description, description, visibility, tile_image, is_active, created_by)
VALUES
(1, 'Predator Free Lincoln University', 'pf-lu', 'Default conservation group', 'Default group used for backward compatibility with the Project 1 app.', 'Public', NULL, TRUE, (SELECT user_id FROM users WHERE username = 'alex332')),
(2, 'Darfield Possum Catch Group', 'darfield-possum-catch', 'A public conservation group focused on possum control around Darfield.', 'Darfield Possum Catch Group coordinates local trapping and bait station operations.', 'Public', NULL, TRUE, (SELECT user_id FROM users WHERE username = 'alex332')),
(3, 'West Melton Predator-Free', 'west-melton-predator-free', 'A private predator control group for approved local members.', 'West Melton Predator-Free manages private conservation activity and requires approval to join.', 'Private', NULL, TRUE, (SELECT user_id FROM users WHERE username = 'mor_ad')),
(4, 'Selwyn River Restoration Team', 'selwyn-river-restoration', 'A public group monitoring traps and bait stations near the Selwyn River.', 'Selwyn River Restoration Team is used as Project 2 test data for users with different roles across different groups.', 'Public', NULL, TRUE, (SELECT user_id FROM users WHERE username = 'alex332')),
(5, 'Rolleston Backyard Trappers', 'rolleston-backyard-trappers', 'A private neighbourhood trapping group for approved Rolleston members.', 'Rolleston Backyard Trappers is used to test private group access and mixed user roles.', 'Private', NULL, TRUE, (SELECT user_id FROM users WHERE username = 'ray_hm')),
(6, 'Lincoln Wetland Watch', 'lincoln-wetland-watch', 'A public observer-focused group for wetland monitoring activity.', 'Lincoln Wetland Watch is used to test that the same account can switch groups and receive a different group role.', 'Public', NULL, TRUE, (SELECT user_id FROM users WHERE username = 'alex332')),
(8, 'Doria Group', 'doria-group', 'A conservation group for Doria area', 'Doria Group manages local trapping and monitoring activities.', 'Public', NULL, TRUE, (SELECT user_id FROM users WHERE username = 'alex332'))
ON CONFLICT (group_id) DO NOTHING;

SELECT setval('groups_group_id_seq', (SELECT MAX(group_id) FROM groups), TRUE);

INSERT INTO group_memberships (user_id, group_id, role, status)
SELECT
    user_id,
    1,
    CASE
        WHEN role = 'admin' THEN 'group_coordinator'::group_role
        WHEN role = 'operator' THEN 'operator'::group_role
        ELSE 'observer'::group_role
    END,
    'Approved'::request_status_enum
FROM users
ON CONFLICT (user_id, group_id) DO NOTHING;

INSERT INTO group_memberships (user_id, group_id, role, status)
VALUES
((SELECT user_id FROM users WHERE username = 'alex332'), 2, 'group_coordinator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ben_ops'), 2, 'operator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'mor_ad'), 3, 'group_coordinator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'olivia_field'), 3, 'operator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ray_hm'), 1, 'group_coordinator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ray_hm'), 2, 'operator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ray_hm'), 3, 'observer', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ray_hm'), 4, 'group_coordinator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ray_hm'), 5, 'group_coordinator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ray_hm'), 6, 'observer', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ben_ops'), 3, 'group_coordinator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ben_ops'), 4, 'observer', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ben_ops'), 5, 'operator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ben_ops'), 6, 'group_coordinator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'cara_view'), 2, 'group_coordinator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'cara_view'), 4, 'operator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'cara_view'), 5, 'observer', 'Approved'),
((SELECT user_id FROM users WHERE username = 'cara_view'), 6, 'operator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'alex332'), 4, 'operator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'alex332'), 5, 'observer', 'Approved'),
((SELECT user_id FROM users WHERE username = 'alex332'), 6, 'group_coordinator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'ben_ops'), 8, 'group_coordinator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'olivia_field'), 8, 'operator', 'Approved'),
((SELECT user_id FROM users WHERE username = 'cara_view'), 8, 'observer', 'Approved')
ON CONFLICT (user_id, group_id) DO UPDATE
SET role = EXCLUDED.role,
    status = EXCLUDED.status;

UPDATE users SET is_super_admin = TRUE WHERE username = 'alex332';
UPDATE users SET is_super_admin = FALSE WHERE username <> 'alex332';

INSERT INTO group_creation_requests (requested_by, proposed_name, proposed_description, requested_visibility, status)
VALUES
((SELECT user_id FROM users WHERE username = 'cara_view'), 'Springston Conservation Group', 'A proposed new conservation group for Springston.', 'Public', 'Pending')
ON CONFLICT DO NOTHING;

INSERT INTO group_join_requests (group_id, requested_by, status, message)
VALUES
(3, (SELECT user_id FROM users WHERE username = 'lucas_watch'), 'Pending', 'I would like to join this private group as an observer.')
ON CONFLICT (group_id, requested_by) DO NOTHING;

-- =====================================================
-- SYSTEM LOOKUP DATA
-- =====================================================
INSERT INTO species (species_name, display_order, is_active, created_by, updated_by)
SELECT 'Ferret',       1,  TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Hedgehog',    2,  TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Mouse',       3,  TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Possum',      4,  TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Kiore Rat',   5,  TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Norway Rat',  6,  TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Ship Rat',    7,  TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Stoat',       8,  TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Weasel',      9,  TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Unspecified', 98, TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'None',        99, TRUE, user_id, user_id FROM users WHERE username = 'alex332'
ON CONFLICT (species_name) DO NOTHING;

INSERT INTO trap_status (status_name, display_order, is_active, created_by, updated_by)
SELECT 'Initial set',             1, TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Removed for Repair',      2, TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Sprung',                  3, TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Still set, bait OK',      4, TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Still set, bait bad',     5, TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Still set, bait missing', 6, TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Trap Replaced',           7, TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Trap gone',               8, TRUE, user_id, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Trap interfered with',    9, TRUE, user_id, user_id FROM users WHERE username = 'alex332'
ON CONFLICT (status_name) DO NOTHING;

INSERT INTO bait_category (category_name, display_order, created_by)
SELECT 'Food',       1,  user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Fish',       2,  user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Meat',       3,  user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Commercial', 4,  user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Scent',      5,  user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'Other',      98, user_id FROM users WHERE username = 'alex332'
UNION ALL SELECT 'None',       99, user_id FROM users WHERE username = 'alex332'
ON CONFLICT (category_name) DO NOTHING;

INSERT INTO bait_type (bait_name, category_id, display_order, is_active, created_by)
SELECT 'Peanut butter', bc.category_id, 1, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Food' AND u.username = 'alex332'
UNION ALL SELECT 'Nutella', bc.category_id, 2, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Food' AND u.username = 'alex332'
UNION ALL SELECT 'Cheese', bc.category_id, 3, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Food' AND u.username = 'alex332'
UNION ALL SELECT 'Chocolate', bc.category_id, 4, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Food' AND u.username = 'alex332'
UNION ALL SELECT 'Cereal', bc.category_id, 5, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Food' AND u.username = 'alex332'
UNION ALL SELECT 'Dried fruit', bc.category_id, 6, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Food' AND u.username = 'alex332'
UNION ALL SELECT 'Fresh fruit', bc.category_id, 7, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Food' AND u.username = 'alex332'
UNION ALL SELECT 'Carrot', bc.category_id, 8, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Food' AND u.username = 'alex332'
UNION ALL SELECT 'Mayo', bc.category_id, 9, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Food' AND u.username = 'alex332'
UNION ALL SELECT 'Whole egg', bc.category_id, 10, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Food' AND u.username = 'alex332'
UNION ALL SELECT 'Nut', bc.category_id, 11, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Food' AND u.username = 'alex332'
UNION ALL SELECT 'Fish', bc.category_id, 21, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Fish' AND u.username = 'alex332'
UNION ALL SELECT 'Salmon', bc.category_id, 22, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Fish' AND u.username = 'alex332'
UNION ALL SELECT 'Tinned Sardines', bc.category_id, 23, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Fish' AND u.username = 'alex332'
UNION ALL SELECT 'Salmon oil', bc.category_id, 24, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Fish' AND u.username = 'alex332'
UNION ALL SELECT 'Lure-it Salmon Spray', bc.category_id, 25, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Fish' AND u.username = 'alex332'
UNION ALL SELECT 'Fresh meat', bc.category_id, 31, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Meat' AND u.username = 'alex332'
UNION ALL SELECT 'Fresh Possum', bc.category_id, 32, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Meat' AND u.username = 'alex332'
UNION ALL SELECT 'Fresh Rabbit', bc.category_id, 33, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Meat' AND u.username = 'alex332'
UNION ALL SELECT 'Dehydrated Rabbit', bc.category_id, 34, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Meat' AND u.username = 'alex332'
UNION ALL SELECT 'Salted meat', bc.category_id, 35, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Meat' AND u.username = 'alex332'
UNION ALL SELECT 'Salted Rabbit', bc.category_id, 36, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Meat' AND u.username = 'alex332'
UNION ALL SELECT 'Salted Possum', bc.category_id, 37, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Meat' AND u.username = 'alex332'
UNION ALL SELECT 'Good Nature Chocolate', bc.category_id, 41, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Commercial' AND u.username = 'alex332'
UNION ALL SELECT 'Good Nature Meat Lovers', bc.category_id, 42, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Commercial' AND u.username = 'alex332'
UNION ALL SELECT 'Goodnature Blood', bc.category_id, 43, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Commercial' AND u.username = 'alex332'
UNION ALL SELECT 'Goodnature Cinnamon pre feed', bc.category_id, 44, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Commercial' AND u.username = 'alex332'
UNION ALL SELECT 'Goodnature Nut Butter', bc.category_id, 45, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Commercial' AND u.username = 'alex332'
UNION ALL SELECT 'NZAT Lure - Original', bc.category_id, 46, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Commercial' AND u.username = 'alex332'
UNION ALL SELECT 'Mustelid and Cat Lure', bc.category_id, 47, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Commercial' AND u.username = 'alex332'
UNION ALL SELECT 'Rat and Possum Lure', bc.category_id, 48, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Commercial' AND u.username = 'alex332'
UNION ALL SELECT 'NARA Blocks', bc.category_id, 49, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Commercial' AND u.username = 'alex332'
UNION ALL SELECT 'PoaUku', bc.category_id, 50, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Commercial' AND u.username = 'alex332'
UNION ALL SELECT 'Possum Dough', bc.category_id, 51, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Commercial' AND u.username = 'alex332'
UNION ALL SELECT 'Rat oil', bc.category_id, 61, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Scent' AND u.username = 'alex332'
UNION ALL SELECT 'Rabbit oil', bc.category_id, 62, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Scent' AND u.username = 'alex332'
UNION ALL SELECT 'Lure', bc.category_id, 63, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Scent' AND u.username = 'alex332'
UNION ALL SELECT 'Ferret bedding', bc.category_id, 64, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Scent' AND u.username = 'alex332'
UNION ALL SELECT 'Terracotta Lures', bc.category_id, 65, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Scent' AND u.username = 'alex332'
UNION ALL SELECT 'Golf ball', bc.category_id, 71, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Other' AND u.username = 'alex332'
UNION ALL SELECT 'Smooth', bc.category_id, 72, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Other' AND u.username = 'alex332'
UNION ALL SELECT 'Other (please specify)', bc.category_id, 73, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'Other' AND u.username = 'alex332'
UNION ALL SELECT 'None', bc.category_id, 99, TRUE, u.user_id
FROM bait_category bc, users u WHERE bc.category_name = 'None' AND u.username = 'alex332'
ON CONFLICT (bait_name) DO NOTHING;
-- =====================================================
-- LINES (Each group gets at least 2 trap lines for line comparison)
-- =====================================================

-- Group 1: Predator Free Lincoln University
INSERT INTO lines (group_id, name, type, comments) VALUES
(1, 'Centre Line', 'Trap', 'Main line through Lincoln University campus'),
(1, 'North Campus Line', 'Trap', 'Northern boundary of Lincoln University'),
(1, 'Bait Station Line A', 'Bait Station', 'Main bait station line for Group 1')
ON CONFLICT (group_id, name) DO NOTHING;

-- Group 2: Darfield Possum Catch Group
INSERT INTO lines (group_id, name, type, comments) VALUES
(2, 'East Line', 'Trap', 'Eastern boundary line for Darfield'),
(2, 'West Line', 'Trap', 'Western boundary line for Darfield'),
(2, 'Darfield Bait Line', 'Bait Station', 'Bait station line for Darfield group')
ON CONFLICT (group_id, name) DO NOTHING;

-- Group 3: West Melton Predator-Free
INSERT INTO lines (group_id, name, type, comments) VALUES
(3, 'West Creek Line', 'Trap', 'Western creek boundary line for West Melton'),
(3, 'North Creek Line', 'Trap', 'Northern creek line for West Melton'),
(3, 'West Melton Stream Side', 'Bait Station', 'Stream side bait stations for West Melton')
ON CONFLICT (group_id, name) DO NOTHING;

-- Group 4: Selwyn River Restoration Team
INSERT INTO lines (group_id, name, type, comments) VALUES
(4, 'North Line', 'Trap', 'Northern section line for Selwyn River'),
(4, 'South Bank Line', 'Trap', 'Southern bank line for Selwyn River'),
(4, 'River Bend Line', 'Trap', 'Bend section of Selwyn River')
ON CONFLICT (group_id, name) DO NOTHING;

-- Group 5: Rolleston Backyard Trappers
INSERT INTO lines (group_id, name, type, comments) VALUES
(5, 'Residential Line A', 'Trap', 'Eastern residential area'),
(5, 'Residential Line B', 'Trap', 'Western residential area'),
(5, 'Bait Station Line B', 'Bait Station', 'Bait station line for Rolleston group')
ON CONFLICT (group_id, name) DO NOTHING;

-- Group 6: Lincoln Wetland Watch
INSERT INTO lines (group_id, name, type, comments) VALUES
(6, 'South Line', 'Trap', 'Southern section line for Lincoln Wetland'),
(6, 'Wetland Edge Line', 'Trap', 'Wetland perimeter line'),
(6, 'North Marsh Line', 'Trap', 'Northern marsh area line')
ON CONFLICT (group_id, name) DO NOTHING;

-- Group 8: Doria Group
INSERT INTO lines (group_id, name, type, comments) VALUES
(8, 'Doria Main Line', 'Trap', 'Main trap line for Doria area'),
(8, 'Doria Creek Line', 'Trap', 'Creek side trap line'),
(8, 'Doria Bait Line', 'Bait Station', 'Bait station line for Doria Group')
ON CONFLICT (group_id, name) DO NOTHING;


-- =====================================================
-- TRAPS (5 traps per trap line)
-- =====================================================

-- Group 1 Traps - Centre Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 1, 'CL01', 'A24'::trap_type_enum, line_id, -43.640100, 172.467100, TRUE FROM lines WHERE group_id = 1 AND name = 'Centre Line'
UNION ALL SELECT 1, 'CL02', 'DOC 150'::trap_type_enum, line_id, -43.640220, 172.467240, TRUE FROM lines WHERE group_id = 1 AND name = 'Centre Line'
UNION ALL SELECT 1, 'CL03', 'DOC 200'::trap_type_enum, line_id, -43.640360, 172.467380, TRUE FROM lines WHERE group_id = 1 AND name = 'Centre Line'
UNION ALL SELECT 1, 'CL04', 'Victor'::trap_type_enum, line_id, -43.640490, 172.467510, TRUE FROM lines WHERE group_id = 1 AND name = 'Centre Line'
UNION ALL SELECT 1, 'CL05', 'Rat trap'::trap_type_enum, line_id, -43.640620, 172.467660, TRUE FROM lines WHERE group_id = 1 AND name = 'Centre Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 1 Traps - North Campus Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 1, 'NC01', 'DOC 250'::trap_type_enum, line_id, -43.637800, 172.466500, TRUE FROM lines WHERE group_id = 1 AND name = 'North Campus Line'
UNION ALL SELECT 1, 'NC02', 'Trapinator'::trap_type_enum, line_id, -43.637650, 172.466650, TRUE FROM lines WHERE group_id = 1 AND name = 'North Campus Line'
UNION ALL SELECT 1, 'NC03', 'A24'::trap_type_enum, line_id, -43.637500, 172.466800, TRUE FROM lines WHERE group_id = 1 AND name = 'North Campus Line'
UNION ALL SELECT 1, 'NC04', 'DOC 150'::trap_type_enum, line_id, -43.637350, 172.466950, TRUE FROM lines WHERE group_id = 1 AND name = 'North Campus Line'
UNION ALL SELECT 1, 'NC05', 'Victor'::trap_type_enum, line_id, -43.637200, 172.467100, TRUE FROM lines WHERE group_id = 1 AND name = 'North Campus Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 2 Traps - East Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 2, 'EL01', 'DOC 250'::trap_type_enum, line_id, -43.639900, 172.468100, TRUE FROM lines WHERE group_id = 2 AND name = 'East Line'
UNION ALL SELECT 2, 'EL02', 'Trapinator'::trap_type_enum, line_id, -43.639760, 172.468260, TRUE FROM lines WHERE group_id = 2 AND name = 'East Line'
UNION ALL SELECT 2, 'EL03', 'A24'::trap_type_enum, line_id, -43.639620, 172.468420, TRUE FROM lines WHERE group_id = 2 AND name = 'East Line'
UNION ALL SELECT 2, 'EL04', 'Victor'::trap_type_enum, line_id, -43.639480, 172.468580, TRUE FROM lines WHERE group_id = 2 AND name = 'East Line'
UNION ALL SELECT 2, 'EL05', 'DOC 150'::trap_type_enum, line_id, -43.639340, 172.468740, TRUE FROM lines WHERE group_id = 2 AND name = 'East Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 2 Traps - West Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 2, 'WL01', 'Rat trap'::trap_type_enum, line_id, -43.639500, 172.467500, TRUE FROM lines WHERE group_id = 2 AND name = 'West Line'
UNION ALL SELECT 2, 'WL02', 'DOC 200'::trap_type_enum, line_id, -43.639350, 172.467350, TRUE FROM lines WHERE group_id = 2 AND name = 'West Line'
UNION ALL SELECT 2, 'WL03', 'Victor'::trap_type_enum, line_id, -43.639200, 172.467200, TRUE FROM lines WHERE group_id = 2 AND name = 'West Line'
UNION ALL SELECT 2, 'WL04', 'DOC 250'::trap_type_enum, line_id, -43.639050, 172.467050, TRUE FROM lines WHERE group_id = 2 AND name = 'West Line'
UNION ALL SELECT 2, 'WL05', 'A24'::trap_type_enum, line_id, -43.638900, 172.466900, TRUE FROM lines WHERE group_id = 2 AND name = 'West Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 3 Traps - West Creek Line 
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 3, 'WL01', 'Rat trap'::trap_type_enum, line_id, -43.640900, 172.466300, TRUE FROM lines WHERE group_id = 3 AND name = 'West Creek Line'
UNION ALL SELECT 3, 'WL02', 'DOC 200'::trap_type_enum, line_id, -43.641040, 172.466150, TRUE FROM lines WHERE group_id = 3 AND name = 'West Creek Line'
UNION ALL SELECT 3, 'WL03', 'Trapinator'::trap_type_enum, line_id, -43.641180, 172.466020, TRUE FROM lines WHERE group_id = 3 AND name = 'West Creek Line'
UNION ALL SELECT 3, 'WL04', 'DOC 250'::trap_type_enum, line_id, -43.641310, 172.465890, TRUE FROM lines WHERE group_id = 3 AND name = 'West Creek Line'
UNION ALL SELECT 3, 'WL05', 'Victor'::trap_type_enum, line_id, -43.641450, 172.465760, TRUE FROM lines WHERE group_id = 3 AND name = 'West Creek Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 3 Traps - North Creek Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 3, 'NC01', 'DOC 150'::trap_type_enum, line_id, -43.639500, 172.465800, TRUE FROM lines WHERE group_id = 3 AND name = 'North Creek Line'
UNION ALL SELECT 3, 'NC02', 'A24'::trap_type_enum, line_id, -43.639350, 172.465650, TRUE FROM lines WHERE group_id = 3 AND name = 'North Creek Line'
UNION ALL SELECT 3, 'NC03', 'DOC 250'::trap_type_enum, line_id, -43.639200, 172.465500, TRUE FROM lines WHERE group_id = 3 AND name = 'North Creek Line'
UNION ALL SELECT 3, 'NC04', 'Rat trap'::trap_type_enum, line_id, -43.639050, 172.465350, TRUE FROM lines WHERE group_id = 3 AND name = 'North Creek Line'
UNION ALL SELECT 3, 'NC05', 'Trapinator'::trap_type_enum, line_id, -43.638900, 172.465200, TRUE FROM lines WHERE group_id = 3 AND name = 'North Creek Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 4 Traps - North Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 4, 'NL01', 'A24'::trap_type_enum, line_id, -43.638900, 172.467300, TRUE FROM lines WHERE group_id = 4 AND name = 'North Line'
UNION ALL SELECT 4, 'NL02', 'DOC 150'::trap_type_enum, line_id, -43.638760, 172.467450, TRUE FROM lines WHERE group_id = 4 AND name = 'North Line'
UNION ALL SELECT 4, 'NL03', 'DOC 200'::trap_type_enum, line_id, -43.638620, 172.467590, TRUE FROM lines WHERE group_id = 4 AND name = 'North Line'
UNION ALL SELECT 4, 'NL04', 'Rat trap'::trap_type_enum, line_id, -43.638480, 172.467740, TRUE FROM lines WHERE group_id = 4 AND name = 'North Line'
UNION ALL SELECT 4, 'NL05', 'Trapinator'::trap_type_enum, line_id, -43.638340, 172.467880, TRUE FROM lines WHERE group_id = 4 AND name = 'North Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 4 Traps - South Bank Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 4, 'SB01', 'Victor'::trap_type_enum, line_id, -43.639800, 172.468000, TRUE FROM lines WHERE group_id = 4 AND name = 'South Bank Line'
UNION ALL SELECT 4, 'SB02', 'DOC 250'::trap_type_enum, line_id, -43.639650, 172.467850, TRUE FROM lines WHERE group_id = 4 AND name = 'South Bank Line'
UNION ALL SELECT 4, 'SB03', 'A24'::trap_type_enum, line_id, -43.639500, 172.467700, TRUE FROM lines WHERE group_id = 4 AND name = 'South Bank Line'
UNION ALL SELECT 4, 'SB04', 'DOC 150'::trap_type_enum, line_id, -43.639350, 172.467550, TRUE FROM lines WHERE group_id = 4 AND name = 'South Bank Line'
UNION ALL SELECT 4, 'SB05', 'Rat trap'::trap_type_enum, line_id, -43.639200, 172.467400, TRUE FROM lines WHERE group_id = 4 AND name = 'South Bank Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 4 Traps - River Bend Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 4, 'RB01', 'Trapinator'::trap_type_enum, line_id, -43.638000, 172.468500, TRUE FROM lines WHERE group_id = 4 AND name = 'River Bend Line'
UNION ALL SELECT 4, 'RB02', 'DOC 200'::trap_type_enum, line_id, -43.637850, 172.468350, TRUE FROM lines WHERE group_id = 4 AND name = 'River Bend Line'
UNION ALL SELECT 4, 'RB03', 'Victor'::trap_type_enum, line_id, -43.637700, 172.468200, TRUE FROM lines WHERE group_id = 4 AND name = 'River Bend Line'
UNION ALL SELECT 4, 'RB04', 'A24'::trap_type_enum, line_id, -43.637550, 172.468050, TRUE FROM lines WHERE group_id = 4 AND name = 'River Bend Line'
UNION ALL SELECT 4, 'RB05', 'DOC 150'::trap_type_enum, line_id, -43.637400, 172.467900, TRUE FROM lines WHERE group_id = 4 AND name = 'River Bend Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 5 Traps - Residential Line A
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 5, 'RA01', 'Rat trap'::trap_type_enum, line_id, -43.641000, 172.468000, TRUE FROM lines WHERE group_id = 5 AND name = 'Residential Line A'
UNION ALL SELECT 5, 'RA02', 'DOC 150'::trap_type_enum, line_id, -43.640850, 172.467850, TRUE FROM lines WHERE group_id = 5 AND name = 'Residential Line A'
UNION ALL SELECT 5, 'RA03', 'Victor'::trap_type_enum, line_id, -43.640700, 172.467700, TRUE FROM lines WHERE group_id = 5 AND name = 'Residential Line A'
UNION ALL SELECT 5, 'RA04', 'A24'::trap_type_enum, line_id, -43.640550, 172.467550, TRUE FROM lines WHERE group_id = 5 AND name = 'Residential Line A'
UNION ALL SELECT 5, 'RA05', 'DOC 200'::trap_type_enum, line_id, -43.640400, 172.467400, TRUE FROM lines WHERE group_id = 5 AND name = 'Residential Line A'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 5 Traps - Residential Line B
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 5, 'RB01', 'Trapinator'::trap_type_enum, line_id, -43.642000, 172.468500, TRUE FROM lines WHERE group_id = 5 AND name = 'Residential Line B'
UNION ALL SELECT 5, 'RB02', 'DOC 250'::trap_type_enum, line_id, -43.641850, 172.468350, TRUE FROM lines WHERE group_id = 5 AND name = 'Residential Line B'
UNION ALL SELECT 5, 'RB03', 'Rat trap'::trap_type_enum, line_id, -43.641700, 172.468200, TRUE FROM lines WHERE group_id = 5 AND name = 'Residential Line B'
UNION ALL SELECT 5, 'RB04', 'DOC 150'::trap_type_enum, line_id, -43.641550, 172.468050, TRUE FROM lines WHERE group_id = 5 AND name = 'Residential Line B'
UNION ALL SELECT 5, 'RB05', 'Victor'::trap_type_enum, line_id, -43.641400, 172.467900, TRUE FROM lines WHERE group_id = 5 AND name = 'Residential Line B'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 6 Traps - South Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 6, 'SL01', 'DOC 250'::trap_type_enum, line_id, -43.642200, 172.467050, TRUE FROM lines WHERE group_id = 6 AND name = 'South Line'
UNION ALL SELECT 6, 'SL02', 'Victor'::trap_type_enum, line_id, -43.642340, 172.467190, TRUE FROM lines WHERE group_id = 6 AND name = 'South Line'
UNION ALL SELECT 6, 'SL03', 'A24'::trap_type_enum, line_id, -43.642480, 172.467330, TRUE FROM lines WHERE group_id = 6 AND name = 'South Line'
UNION ALL SELECT 6, 'SL04', 'DOC 150'::trap_type_enum, line_id, -43.642620, 172.467470, TRUE FROM lines WHERE group_id = 6 AND name = 'South Line'
UNION ALL SELECT 6, 'SL05', 'Rat trap'::trap_type_enum, line_id, -43.642760, 172.467610, TRUE FROM lines WHERE group_id = 6 AND name = 'South Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 6 Traps - Wetland Edge Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 6, 'WE01', 'DOC 200'::trap_type_enum, line_id, -43.641500, 172.466500, TRUE FROM lines WHERE group_id = 6 AND name = 'Wetland Edge Line'
UNION ALL SELECT 6, 'WE02', 'Trapinator'::trap_type_enum, line_id, -43.641350, 172.466350, TRUE FROM lines WHERE group_id = 6 AND name = 'Wetland Edge Line'
UNION ALL SELECT 6, 'WE03', 'Victor'::trap_type_enum, line_id, -43.641200, 172.466200, TRUE FROM lines WHERE group_id = 6 AND name = 'Wetland Edge Line'
UNION ALL SELECT 6, 'WE04', 'DOC 250'::trap_type_enum, line_id, -43.641050, 172.466050, TRUE FROM lines WHERE group_id = 6 AND name = 'Wetland Edge Line'
UNION ALL SELECT 6, 'WE05', 'A24'::trap_type_enum, line_id, -43.640900, 172.465900, TRUE FROM lines WHERE group_id = 6 AND name = 'Wetland Edge Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 6 Traps - North Marsh Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 6, 'NM01', 'Rat trap'::trap_type_enum, line_id, -43.640000, 172.467500, TRUE FROM lines WHERE group_id = 6 AND name = 'North Marsh Line'
UNION ALL SELECT 6, 'NM02', 'DOC 150'::trap_type_enum, line_id, -43.639850, 172.467350, TRUE FROM lines WHERE group_id = 6 AND name = 'North Marsh Line'
UNION ALL SELECT 6, 'NM03', 'Victor'::trap_type_enum, line_id, -43.639700, 172.467200, TRUE FROM lines WHERE group_id = 6 AND name = 'North Marsh Line'
UNION ALL SELECT 6, 'NM04', 'A24'::trap_type_enum, line_id, -43.639550, 172.467050, TRUE FROM lines WHERE group_id = 6 AND name = 'North Marsh Line'
UNION ALL SELECT 6, 'NM05', 'DOC 200'::trap_type_enum, line_id, -43.639400, 172.466900, TRUE FROM lines WHERE group_id = 6 AND name = 'North Marsh Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 8 Traps - Doria Main Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 8, 'DM01', 'A24'::trap_type_enum, line_id, -43.640000, 172.467000, TRUE FROM lines WHERE group_id = 8 AND name = 'Doria Main Line'
UNION ALL SELECT 8, 'DM02', 'DOC 150'::trap_type_enum, line_id, -43.639850, 172.466850, TRUE FROM lines WHERE group_id = 8 AND name = 'Doria Main Line'
UNION ALL SELECT 8, 'DM03', 'Victor'::trap_type_enum, line_id, -43.639700, 172.466700, TRUE FROM lines WHERE group_id = 8 AND name = 'Doria Main Line'
UNION ALL SELECT 8, 'DM04', 'DOC 200'::trap_type_enum, line_id, -43.639550, 172.466550, TRUE FROM lines WHERE group_id = 8 AND name = 'Doria Main Line'
UNION ALL SELECT 8, 'DM05', 'Rat trap'::trap_type_enum, line_id, -43.639400, 172.466400, TRUE FROM lines WHERE group_id = 8 AND name = 'Doria Main Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 8 Traps - Doria Creek Line
INSERT INTO traps (group_id, code, trap_type, line_id, latitude, longitude, is_active)
SELECT 8, 'DC01', 'Trapinator'::trap_type_enum, line_id, -43.641000, 172.468000, TRUE FROM lines WHERE group_id = 8 AND name = 'Doria Creek Line'
UNION ALL SELECT 8, 'DC02', 'DOC 250'::trap_type_enum, line_id, -43.640850, 172.467850, TRUE FROM lines WHERE group_id = 8 AND name = 'Doria Creek Line'
UNION ALL SELECT 8, 'DC03', 'A24'::trap_type_enum, line_id, -43.640700, 172.467700, TRUE FROM lines WHERE group_id = 8 AND name = 'Doria Creek Line'
UNION ALL SELECT 8, 'DC04', 'DOC 150'::trap_type_enum, line_id, -43.640550, 172.467550, TRUE FROM lines WHERE group_id = 8 AND name = 'Doria Creek Line'
UNION ALL SELECT 8, 'DC05', 'Victor'::trap_type_enum, line_id, -43.640400, 172.467400, TRUE FROM lines WHERE group_id = 8 AND name = 'Doria Creek Line'
ON CONFLICT (group_id, code) DO NOTHING;


-- =====================================================
-- BAIT STATIONS (Distributed across groups)
-- =====================================================

-- Group 1 Bait Stations (Bait Station Line A)
INSERT INTO bait_stations (group_id, line_id, code, latitude, longitude, bait_station_type, comments)
SELECT 1, line_id, 'BSA01', -43.640800, 172.467900, 'Philproof'::bait_station_type_enum, 'Bait station for Group 1' FROM lines WHERE group_id = 1 AND name = 'Bait Station Line A'
UNION ALL SELECT 1, line_id, 'BSA02', -43.640950, 172.468050, 'Protecta Sidekick'::bait_station_type_enum, 'Second bait station for Group 1' FROM lines WHERE group_id = 1 AND name = 'Bait Station Line A'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 2 Bait Stations (Darfield Bait Line)
INSERT INTO bait_stations (group_id, line_id, code, latitude, longitude, bait_station_type, comments)
SELECT 2, line_id, 'DAR-BS01', -43.639700, 172.468950, 'EnviroMate100'::bait_station_type_enum, 'Group 2 bait station near East Line traps' FROM lines WHERE group_id = 2 AND name = 'Darfield Bait Line'
UNION ALL SELECT 2, line_id, 'DAR-BS02', -43.639150, 172.469350, 'Philproof'::bait_station_type_enum, 'Group 2 secondary bait station near East Line traps' FROM lines WHERE group_id = 2 AND name = 'Darfield Bait Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 3 Bait Stations (West Melton Stream Side)
INSERT INTO bait_stations (group_id, line_id, code, latitude, longitude, bait_station_type, comments)
SELECT 3, line_id, 'WMSS-01', -43.641050, 172.465650, 'Protecta Sidekick'::bait_station_type_enum, 'Group 3 bait station near West Line traps' FROM lines WHERE group_id = 3 AND name = 'West Melton Stream Side'
UNION ALL SELECT 3, line_id, 'WMSS-02', -43.641650, 172.466450, 'Tunnel'::bait_station_type_enum, 'Group 3 second bait station near West Line traps' FROM lines WHERE group_id = 3 AND name = 'West Melton Stream Side'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 5 Bait Stations (Bait Station Line B)
INSERT INTO bait_stations (group_id, line_id, code, latitude, longitude, bait_station_type, comments)
SELECT 5, line_id, 'BSB01', -43.641200, 172.468300, 'Tunnel'::bait_station_type_enum, 'Rolleston bait station' FROM lines WHERE group_id = 5 AND name = 'Bait Station Line B'
ON CONFLICT (group_id, code) DO NOTHING;

-- Group 8 Bait Stations (Doria Bait Line)
INSERT INTO bait_stations (group_id, line_id, code, latitude, longitude, bait_station_type, comments)
SELECT 8, line_id, 'DOR-BS01', -43.640500, 172.467500, 'Philproof'::bait_station_type_enum, 'Doria Group bait station' FROM lines WHERE group_id = 8 AND name = 'Doria Bait Line'
ON CONFLICT (group_id, code) DO NOTHING;

-- =====================================================
-- OPERATOR ASSIGNMENTS (All trap lines assigned to operators)
-- =====================================================

-- Group 1 operators (Centre Line + North Campus Line + Bait Station Line A)
INSERT INTO operator_lines (operator_id, line_id)
SELECT u.user_id, l.line_id FROM users u, lines l 
WHERE u.username IN ('ben_ops', 'olivia_field') AND l.group_id = 1 AND l.name IN ('Centre Line', 'North Campus Line', 'Bait Station Line A')
ON CONFLICT (operator_id, line_id) DO NOTHING;

-- Group 2 operators (East Line + West Line + Darfield Bait Line)
INSERT INTO operator_lines (operator_id, line_id)
SELECT u.user_id, l.line_id FROM users u, lines l 
WHERE u.username IN ('liam_ranger', 'zoe_tracker', 'cara_view') AND l.group_id = 2 AND l.name IN ('East Line', 'West Line', 'Darfield Bait Line')
ON CONFLICT (operator_id, line_id) DO NOTHING;

-- Add ben_ops as operator for Group 2 East Line
INSERT INTO operator_lines (operator_id, line_id)
SELECT u.user_id, l.line_id FROM users u, lines l 
WHERE u.username = 'ben_ops' AND l.group_id = 2 AND l.name = 'East Line'
ON CONFLICT (operator_id, line_id) DO NOTHING;

-- Group 3 operators (West Creek Line + North Creek Line + West Melton Stream Side)
INSERT INTO operator_lines (operator_id, line_id)
SELECT u.user_id, l.line_id FROM users u, lines l 
WHERE u.username IN ('noah_patrol', 'emma_traps', 'olivia_field') AND l.group_id = 3 AND l.name IN ('West Creek Line', 'North Creek Line', 'West Melton Stream Side')
ON CONFLICT (operator_id, line_id) DO NOTHING;

-- Group 4 operators (North Line + South Bank Line + River Bend Line)
INSERT INTO operator_lines (operator_id, line_id)
SELECT u.user_id, l.line_id FROM users u, lines l 
WHERE u.username IN ('jack_outdoor', 'ava_monitor', 'cara_view', 'alex332') AND l.group_id = 4 AND l.name IN ('North Line', 'South Bank Line', 'River Bend Line')
ON CONFLICT (operator_id, line_id) DO NOTHING;

-- Group 5 operators (Residential Line A + Residential Line B + Bait Station Line B)
INSERT INTO operator_lines (operator_id, line_id)
SELECT u.user_id, l.line_id FROM users u, lines l 
WHERE u.username IN ('ben_ops', 'cara_view') AND l.group_id = 5 AND l.name IN ('Residential Line A', 'Residential Line B', 'Bait Station Line B')
ON CONFLICT (operator_id, line_id) DO NOTHING;

-- Group 6 operators (South Line + Wetland Edge Line + North Marsh Line)
INSERT INTO operator_lines (operator_id, line_id)
SELECT u.user_id, l.line_id FROM users u, lines l 
WHERE u.username IN ('ethan_checker', 'mia_bush', 'cara_view', 'ben_ops') AND l.group_id = 6 AND l.name IN ('South Line', 'Wetland Edge Line', 'North Marsh Line')
ON CONFLICT (operator_id, line_id) DO NOTHING;

-- Group 8 operators (Doria Main Line + Doria Creek Line + Doria Bait Line)
INSERT INTO operator_lines (operator_id, line_id)
SELECT u.user_id, l.line_id FROM users u, lines l 
WHERE u.username IN ('ben_ops', 'olivia_field', 'cara_view') AND l.group_id = 8 AND l.name IN ('Doria Main Line', 'Doria Creek Line', 'Doria Bait Line')
ON CONFLICT (operator_id, line_id) DO NOTHING;


-- =====================================================
-- TRAP CATCHES (Sample data for each group - will be expanded by seed script)
-- Note: This is minimal sample data. Run seed_test_data.py for full data generation.
-- =====================================================

-- Group 1 - Centre Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-15 09:05', s.species_id, 'Male', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for Centre Line', 1
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 1 AND t.code = 'CL03' AND u.username = 'ben_ops' AND s.species_name = 'Possum' AND st.status_name = 'Sprung' AND bt.bait_name = 'Peanut butter'
ON CONFLICT DO NOTHING;

-- Group 1 - North Campus Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-20 10:30', s.species_id, 'Female', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for North Campus Line', 1
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 1 AND t.code = 'NC02' AND u.username = 'olivia_field' AND s.species_name = 'Ship Rat' AND st.status_name = 'Sprung' AND bt.bait_name = 'Nutella'
ON CONFLICT DO NOTHING;

-- Group 2 - East Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-10 08:30', s.species_id, 'Male', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for East Line', 2
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 2 AND t.code = 'EL01' AND u.username = 'liam_ranger' AND s.species_name = 'Stoat' AND st.status_name = 'Sprung' AND bt.bait_name = 'Fresh meat'
ON CONFLICT DO NOTHING;

-- Group 2 - West Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-12 09:15', s.species_id, 'Female', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for West Line', 2
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 2 AND t.code = 'WL03' AND u.username = 'zoe_tracker' AND s.species_name = 'Norway Rat' AND st.status_name = 'Sprung' AND bt.bait_name = 'Cheese'
ON CONFLICT DO NOTHING;

-- Group 3 - West Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-05 07:45', s.species_id, 'Male', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for West Line', 3
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 3 AND t.code = 'WL02' AND u.username = 'noah_patrol' AND s.species_name = 'Possum' AND st.status_name = 'Sprung' AND bt.bait_name = 'Fresh Rabbit'
ON CONFLICT DO NOTHING;

-- Group 3 - North Creek Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-18 11:00', s.species_id, 'Female', 'Juvenile', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for North Creek Line', 3
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 3 AND t.code = 'NC04' AND u.username = 'emma_traps' AND s.species_name = 'Ship Rat' AND st.status_name = 'Sprung' AND bt.bait_name = 'Chocolate'
ON CONFLICT DO NOTHING;

-- Group 4 - North Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-08 09:00', s.species_id, 'Male', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for North Line', 4
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 4 AND t.code = 'NL03' AND u.username = 'jack_outdoor' AND s.species_name = 'Weasel' AND st.status_name = 'Sprung' AND bt.bait_name = 'Fresh meat'
ON CONFLICT DO NOTHING;

-- Group 4 - South Bank Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-22 14:30', s.species_id, 'Female', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for South Bank Line', 4
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 4 AND t.code = 'SB02' AND u.username = 'ava_monitor' AND s.species_name = 'Possum' AND st.status_name = 'Sprung' AND bt.bait_name = 'Salted Possum'
ON CONFLICT DO NOTHING;

-- Group 4 - River Bend Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-25 08:15', s.species_id, 'Male', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for River Bend Line', 4
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 4 AND t.code = 'RB04' AND u.username = 'cara_view' AND s.species_name = 'Kiore Rat' AND st.status_name = 'Sprung' AND bt.bait_name = 'Peanut butter'
ON CONFLICT DO NOTHING;

-- Group 5 - Residential Line A sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-14 10:00', s.species_id, 'Female', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for Residential Line A', 5
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 5 AND t.code = 'RA02' AND u.username = 'ben_ops' AND s.species_name = 'Mouse' AND st.status_name = 'Sprung' AND bt.bait_name = 'Cheese'
ON CONFLICT DO NOTHING;

-- Group 5 - Residential Line B sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-28 09:45', s.species_id, 'Male', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for Residential Line B', 5
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 5 AND t.code = 'RB03' AND u.username = 'cara_view' AND s.species_name = 'Norway Rat' AND st.status_name = 'Sprung' AND bt.bait_name = 'Nutella'
ON CONFLICT DO NOTHING;

-- Group 6 - South Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-11 07:30', s.species_id, 'Female', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for South Line', 6
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 6 AND t.code = 'SL02' AND u.username = 'ethan_checker' AND s.species_name = 'Hedgehog' AND st.status_name = 'Sprung' AND bt.bait_name = 'Fresh Rabbit'
ON CONFLICT DO NOTHING;

-- Group 6 - Wetland Edge Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-19 13:00', s.species_id, 'Male', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for Wetland Edge Line', 6
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 6 AND t.code = 'WE03' AND u.username = 'mia_bush' AND s.species_name = 'Possum' AND st.status_name = 'Sprung' AND bt.bait_name = 'Salted Possum'
ON CONFLICT DO NOTHING;

-- Group 6 - North Marsh Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-26 11:30', s.species_id, 'Female', 'Juvenile', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for North Marsh Line', 6
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 6 AND t.code = 'NM04' AND u.username = 'cara_view' AND s.species_name = 'Ship Rat' AND st.status_name = 'Sprung' AND bt.bait_name = 'Chocolate'
ON CONFLICT DO NOTHING;

-- Group 8 - Doria Main Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-16 09:20', s.species_id, 'Male', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for Doria Main Line', 8
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 8 AND t.code = 'DM02' AND u.username = 'ben_ops' AND s.species_name = 'Possum' AND st.status_name = 'Sprung' AND bt.bait_name = 'Fresh Rabbit'
ON CONFLICT DO NOTHING;

-- Group 8 - Doria Creek Line sample catches
INSERT INTO trap_catches (trap_id, recorded_by, catch_date, species_id, sex, maturity, status_id, rebaited, bait_id, trap_condition, strikes, notes, group_id)
SELECT t.trap_id, u.user_id, '2026-03-29 14:00', s.species_id, 'Female', 'Adult', st.status_id, TRUE, bt.bait_id, 'OK', 1, 'Sample catch for Doria Creek Line', 8
FROM traps t, users u, species s, trap_status st, bait_type bt
WHERE t.group_id = 8 AND t.code = 'DC04' AND u.username = 'olivia_field' AND s.species_name = 'Norway Rat' AND st.status_name = 'Sprung' AND bt.bait_name = 'Nutella'
ON CONFLICT DO NOTHING;


-- =====================================================
-- LOCATION FEATURES (Operational areas for each group)
-- =====================================================
INSERT INTO group_operational_areas (group_id, boundary_geojson, created_by, updated_by)
VALUES
-- Group 1: covers Centre Line traps and North Campus Line
(1, '{"type":"Polygon","coordinates":[[[172.4660,-43.6429],[172.4690,-43.6429],[172.4690,-43.6372],[172.4660,-43.6372],[172.4660,-43.6429]]]}'::jsonb, (SELECT user_id FROM users WHERE username = 'alex332'), (SELECT user_id FROM users WHERE username = 'alex332')),

-- Group 2: covers East Line and West Line
(2, '{"type":"Polygon","coordinates":[[[172.4665,-43.6405],[172.4695,-43.6405],[172.4695,-43.6385],[172.4665,-43.6385],[172.4665,-43.6405]]]}'::jsonb, (SELECT user_id FROM users WHERE username = 'alex332'), (SELECT user_id FROM users WHERE username = 'alex332')),

-- Group 3: covers West Line and North Creek Line
(3, '{"type":"Polygon","coordinates":[[[172.4650,-43.6420],[172.4670,-43.6420],[172.4670,-43.6400],[172.4650,-43.6400],[172.4650,-43.6420]]]}'::jsonb, (SELECT user_id FROM users WHERE username = 'alex332'), (SELECT user_id FROM users WHERE username = 'alex332')),

-- Group 4: covers North Line, South Bank Line, and River Bend Line
(4, '{"type":"Polygon","coordinates":[[[172.4670,-43.6395],[172.4690,-43.6395],[172.4690,-43.6370],[172.4670,-43.6370],[172.4670,-43.6395]]]}'::jsonb, (SELECT user_id FROM users WHERE username = 'alex332'), (SELECT user_id FROM users WHERE username = 'alex332')),

-- Group 5: covers Residential Line A and Residential Line B
(5, '{"type":"Polygon","coordinates":[[[172.4668,-43.6420],[172.4690,-43.6420],[172.4690,-43.6405],[172.4668,-43.6405],[172.4668,-43.6420]]]}'::jsonb, (SELECT user_id FROM users WHERE username = 'alex332'), (SELECT user_id FROM users WHERE username = 'alex332')),

-- Group 6: covers South Line, Wetland Edge Line, and North Marsh Line
(6, '{"type":"Polygon","coordinates":[[[172.4655,-43.6435],[172.4680,-43.6435],[172.4680,-43.6415],[172.4655,-43.6415],[172.4655,-43.6435]]]}'::jsonb, (SELECT user_id FROM users WHERE username = 'alex332'), (SELECT user_id FROM users WHERE username = 'alex332')),

-- Group 8: covers Doria Main Line and Doria Creek Line
(8, '{"type":"Polygon","coordinates":[[[172.4660,-43.6400],[172.4690,-43.6400],[172.4690,-43.6380],[172.4660,-43.6380],[172.4660,-43.6400]]]}'::jsonb, (SELECT user_id FROM users WHERE username = 'alex332'), (SELECT user_id FROM users WHERE username = 'alex332'))
ON CONFLICT (group_id) DO NOTHING;


-- =====================================================
-- GROUP UPDATES & KNOWLEDGE HUB
-- =====================================================
INSERT INTO group_updates (group_id, title, body, status, created_by, published_at)
VALUES
(1, 'March field activity update', 'Operators completed checks across the main trap lines and added new bait station records.', 'Published', (SELECT user_id FROM users WHERE username = 'alex332'), CURRENT_TIMESTAMP),
(2, 'Darfield welcome update', 'Welcome to the Darfield Possum Catch Group. This update demonstrates group-specific announcements.', 'Published', (SELECT user_id FROM users WHERE username = 'alex332'), CURRENT_TIMESTAMP)
ON CONFLICT DO NOTHING;

INSERT INTO group_update_likes (update_id, user_id)
SELECT gu.update_id, u.user_id
FROM group_updates gu, users u
WHERE gu.title = 'March field activity update' AND u.username IN ('ben_ops', 'cara_view')
ON CONFLICT DO NOTHING;

INSERT INTO group_update_comments (update_id, user_id, comment_text)
SELECT gu.update_id, u.user_id, 'Thanks for the update.'
FROM group_updates gu, users u
WHERE gu.title = 'March field activity update' AND u.username = 'cara_view'
ON CONFLICT DO NOTHING;

INSERT INTO knowledge_categories (category_name, description, display_order)
VALUES
('Trap Management', 'Advice about trap setup, checks, and maintenance.', 1),
('Bait Stations', 'Advice about safe and effective bait station management.', 2),
('Seasonal Advice', 'Seasonal predator control tips and reminders.', 3)
ON CONFLICT (category_name) DO NOTHING;

INSERT INTO knowledge_entries (category_id, group_id, title, body, status, is_featured, created_by, approved_by, approved_at)
VALUES
((SELECT category_id FROM knowledge_categories WHERE category_name = 'Bait Stations'), 1, 'Checking bait station bait levels', 'Record bait remaining, bait added, and any signs of pest activity during each check.', 'Published', TRUE, (SELECT user_id FROM users WHERE username = 'ben_ops'), (SELECT user_id FROM users WHERE username = 'alex332'), CURRENT_TIMESTAMP),
((SELECT category_id FROM knowledge_categories WHERE category_name = 'Trap Management'), 1, 'Resetting traps safely', 'Check the trap status, rebait if needed, and record notes before leaving the site.', 'Published', FALSE, (SELECT user_id FROM users WHERE username = 'olivia_field'), (SELECT user_id FROM users WHERE username = 'alex332'), CURRENT_TIMESTAMP)
ON CONFLICT DO NOTHING;

INSERT INTO knowledge_entry_versions (entry_id, version_number, title, body, changed_by)
SELECT entry_id, 1, title, body, created_by FROM knowledge_entries
ON CONFLICT (entry_id, version_number) DO NOTHING;


-- =====================================================
-- DONATIONS & SUPPORT
-- =====================================================
INSERT INTO group_donation_settings (group_id, donations_enabled, donation_description, is_registered_charity, charity_name, charity_registration_number, updated_by)
VALUES
(1, TRUE, 'Donations support trap maintenance and bait station supplies for the default group.', FALSE, NULL, NULL, (SELECT user_id FROM users WHERE username = 'alex332')),
(2, TRUE, 'Donations support local possum control activity in Darfield.', TRUE, 'Darfield Possum Catch Group Charitable Trust', 'CC12345', (SELECT user_id FROM users WHERE username = 'alex332'))
ON CONFLICT (group_id) DO NOTHING;

INSERT INTO donations (donation_type, group_id, donor_user_id, amount, donor_name, contact_email, is_anonymous, message, status)
VALUES
('Group', 1, (SELECT user_id FROM users WHERE username = 'ben_ops'), 25.00, 'Test Supporter', 'supporter@example.com', FALSE, 'Keep up the great work.', 'Completed'),
('Group', 2, (SELECT user_id FROM users WHERE username = 'cara_view'), 50.00, 'Darfield Donor', 'darfield@example.com', FALSE, 'For possum control supplies.', 'Completed'),
('Platform', NULL, NULL, 10.00, NULL, 'anonymous@example.com', TRUE, NULL, 'Completed')
ON CONFLICT DO NOTHING;

INSERT INTO donation_receipts (donation_id, receipt_number, receipt_file_path)
SELECT donation_id, 'RCT-' || donation_id::text, NULL
FROM donations
WHERE is_anonymous = FALSE
ON CONFLICT (donation_id) DO NOTHING;


-- =====================================================
-- ANALYTICS & RECORDS SUPPORT
-- =====================================================
INSERT INTO export_logs (group_id, exported_by, export_type, filters_used)
VALUES
(1, (SELECT user_id FROM users WHERE username = 'alex332'), 'trap_catches', '{"date_range":"2025-2026"}'::jsonb),
(1, (SELECT user_id FROM users WHERE username = 'alex332'), 'bait_station_records', '{"date_range":"2025-2026"}'::jsonb)
ON CONFLICT DO NOTHING;