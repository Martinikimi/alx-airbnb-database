
-- 📌 Indexes for Airbnb Clone Database

-- Index on user_id in Bookings table to speed up joins with Users
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on property_id in Bookings table to speed up joins with Properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on location in Properties table to optimize location-based searches
CREATE INDEX idx_properties_location ON properties(location);

-- Index on email in Users table to speed up user lookups
CREATE INDEX idx_users_email ON users(email);
