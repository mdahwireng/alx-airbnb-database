-- ===========================
-- Sample Data: Users
-- ===========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Walker', 'alice@example.com', 'hashed_pw1', '1234567890', 'host'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw2', '2345678901', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Lee', 'charlie@example.com', 'hashed_pw3', '3456789012', 'guest'),
('44444444-4444-4444-4444-444444444444', 'Diana', 'Smith', 'diana@example.com', 'hashed_pw4', '4567890123', 'host');

-- ===========================
-- Sample Data: Properties
-- ===========================
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 'Modern Loft in LA', 'A cozy and modern loft in the heart of Los Angeles.', 'Los Angeles, CA', 120.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', 'Beachfront Bungalow', 'Relax in this quiet and beautiful beachfront property.', 'Miami, FL', 200.00);

-- ===========================
-- Sample Data: Bookings
-- ===========================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', '2025-07-01', '2025-07-05', 480.00, 'confirmed'),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', '2025-08-10', '2025-08-12', 400.00, 'pending');

-- ===========================
-- Sample Data: Payments
-- ===========================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 480.00, 'credit_card');

-- ===========================
-- Sample Data: Reviews
-- ===========================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('ddddddd1-dddd-dddd-dddd-ddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 5, 'Amazing loft! Very clean and well-located.'),
('ddddddd2-dddd-dddd-dddd-ddddddddddd2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 4, 'Beautiful view but a bit noisy at night.');

-- ===========================
-- Sample Data: Messages
-- ===========================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi, is your property available in July?'),
('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Yes, it is available from July 1st to 5th.');
