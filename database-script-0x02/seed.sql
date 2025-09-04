
-- Airbnb Database Seed Data
-- Task 3: DML Script (Insert Sample Data)

-- ===========================
-- Users
-- ===========================
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '0712345678', 'guest', NOW()),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '0723456789', 'host', NOW()),
('33333333-3333-3333-3333-333333333333', 'Clara', 'Davis', 'clara@example.com', 'hashed_pw3', '0734567890', 'admin', NOW());

-- ===========================
-- Properties
-- ===========================
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
('44444444-4444-4444-4444-444444444444', '22222222-2222-2222-2222-222222222222', 'Cozy Apartment', '2 bedroom apartment in Nairobi CBD', 'Nairobi, Kenya', 5000.00, NOW(), NOW()),
('55555555-5555-5555-5555-555555555555', '22222222-2222-2222-2222-222222222222', 'Beach House', 'Luxury beach house with ocean view', 'Mombasa, Kenya', 15000.00, NOW(), NOW());

-- ===========================
-- Bookings
-- ===========================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
('66666666-6666-6666-6666-666666666666', '44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', '2025-09-10', '2025-09-15', 25000.00, 'confirmed', NOW()),
('77777777-7777-7777-7777-777777777777', '55555555-5555-5555-5555-555555555555', '11111111-1111-1111-1111-111111111111', '2025-12-20', '2025-12-25', 75000.00, 'pending', NOW());

-- ===========================
-- Payments
-- ===========================
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
('88888888-8888-8888-8888-888888888888', '66666666-6666-6666-6666-666666666666', 25000.00, NOW(), 'credit_card');

-- ===========================
-- Reviews
-- ===========================
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
('99999999-9999-9999-9999-999999999999', '44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay! Very clean and central.', NOW());

-- ===========================
-- Messages
-- ===========================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, I loved staying at your apartment!', NOW());
