-- Indexes for Optimization

-- Users table: email is often used in WHERE clauses
CREATE INDEX idx_users_email ON users(email);

-- Bookings table: used in JOINs and filtering
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Properties table: used in JOINs with bookings or reviews
CREATE INDEX idx_properties_host_id ON properties(host_id);
