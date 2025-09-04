
-- 📌 Indexes for Airbnb Clone Database

-- Index on user_id in Bookings table to speed up joins with Users
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on property_id in Bookings table to speed up joins with Properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on location in Properties table to optimize location-based searches
CREATE INDEX idx_properties_location ON properties(location);

-- Index on email in Users table to speed up user lookups
CREATE INDEX idx_users_email ON users(email);

-- Performance Measurement Queries (before and after indexing)

-- Query 1: Total bookings per user
EXPLAIN ANALYZE
SELECT u.user_id, u.username, COUNT(b.booking_id)
FROM users u
JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.username;

-- Query 2: Total bookings per property
EXPLAIN ANALYZE
SELECT p.property_id, p.title, COUNT(b.booking_id)
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.title;
