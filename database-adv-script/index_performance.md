# Indexing for Optimization

This file contains SQL commands for creating indexes on high-usage columns and performance notes.

## Index Creation (SQL)

```sql
-- Create index on users.user_id (frequently used in JOINs and GROUP BY)
CREATE INDEX idx_users_user_id ON users(user_id);

-- Create index on bookings.user_id (used in JOINs and filtering)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on bookings.property_id (used in JOINs with properties)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create index on properties.property_id (used in JOINs and ranking queries)
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Create index on reviews.property_id (used in subqueries for average ratings)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

