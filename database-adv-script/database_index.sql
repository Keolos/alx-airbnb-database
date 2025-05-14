-- database_index.sql

-- Create indexes on high-usage columns

-- Create an index on the 'id' column in the 'users' table
CREATE INDEX idx_users_id ON users(id);

-- Create an index on the 'email' column in the 'users' table
CREATE INDEX idx_users_email ON users(email);

-- Create an index on the 'user_id' column in the 'bookings' table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create an index on the 'property_id' column in the 'bookings' table
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create an index on the 'date' column in the 'bookings' table for faster sorting and range queries
CREATE INDEX idx_bookings_date ON bookings(date);

-- Create an index on the 'id' column in the 'properties' table
CREATE INDEX idx_properties_id ON properties(id);

-- Create an index on the 'location' column in the 'properties' table
CREATE INDEX idx_properties_location ON properties(location);

-- Create an index on the 'price' column in the 'properties' table for sorting and filtering
CREATE INDEX idx_properties_price ON properties(price);

-- EXPLAIN ANALYZE queries to measure performance before and after indexing
EXPLAIN ANALYZE
SELECT u.id, u.email, b.property_id, p.location, b.date
FROM users u
JOIN bookings b ON u.id = b.user_id
JOIN properties p ON b.property_id = p.id
WHERE u.email = 'user@example.com'
ORDER BY p.location, b.date;
