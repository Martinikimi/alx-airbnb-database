-- 📌 Initial Query (Unoptimized)
-- Retrieves all bookings with user, property, and payment details (with filtering)
EXPLAIN
SELECT b.booking_id, b.start_date, b.end_date,
       u.user_id, u.username, u.email,
       p.property_id, p.title, p.location,
       pay.payment_id, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01' AND b.end_date <= '2025-12-31';

-- 📌 Optimized Query (Refactored)
-- Uses fewer columns, assumes indexes exist on user_id, property_id, booking_id
EXPLAIN
SELECT b.booking_id, b.start_date, b.end_date,
       u.username, p.title, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01' AND b.end_date <= '2025-12-31';


