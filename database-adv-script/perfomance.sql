
-- Initial Query (Unoptimized)

-- Retrieves all bookings along with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
ORDER BY b.booking_id;

-- Analyze Initial Query Performance
-- Use EXPLAIN ANALYZE to check query efficiency
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
ORDER BY b.booking_id;

-- Optimized Query

-- Removes unnecessary columns and leverages indexes for faster joins
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount AS payment_amount,
    pay.payment_method
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
ORDER BY b.booking_id;

--Analyze Optimized Query Performance
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount AS payment_amount,
    pay.payment_method
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
ORDER BY b.booking_id;
