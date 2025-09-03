-- Create Indexes

-- Users table: email is often used in WHERE clauses
CREATE INDEX idx_users_email ON users(email);

-- Bookings table: used in JOINs and filtering
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Properties table: used in JOINs with bookings or reviews
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- Measure Performance Using EXPLAIN ANALYZE

-- Example query before/after indexes
EXPLAIN ANALYZE
SELECT *
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
WHERE b.start_date >= '2025-01-01';

EXPLAIN ANALYZE
SELECT *
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
WHERE p.host_id IS NOT NULL;
