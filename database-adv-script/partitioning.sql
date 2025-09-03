
-- Create partitioned parent table
CREATE TABLE bookings_partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Create child partitions
CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_2026 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- Add more partitions as needed

-- Migrate existing data
INSERT INTO bookings_partitioned (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
SELECT booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
FROM bookings;

-- Test queries on partitioned table

-- Fetch all confirmed bookings in January 2025
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date >= '2025-01-01'
  AND start_date < '2025-02-01'
  AND status = 'confirmed';

-- Join with users and properties
EXPLAIN ANALYZE
SELECT b.booking_id, u.first_name, u.last_name, p.name AS property_name
FROM bookings_partitioned b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
WHERE b.start_date >= '2025-01-01'
  AND b.start_date < '2025-02-01'
  AND b.status = 'confirmed';
