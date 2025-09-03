-- Enable UUID generator
CREATE EXTENSION IF NOT EXISTS pgcrypto;


-- USERS TABLE

CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR,
    role VARCHAR NOT NULL CHECK (role IN ('guest','host','admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- PROPERTIES TABLE

CREATE TABLE properties (
    property_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    host_id UUID REFERENCES users(user_id),
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR NOT NULL,
    price_per_night DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- BOOKINGS TABLE

CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID REFERENCES properties(property_id),
    user_id UUID REFERENCES users(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR NOT NULL CHECK (status IN ('pending','confirmed','canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- PAYMENTS TABLE

CREATE TABLE payments (
    payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    booking_id UUID REFERENCES bookings(booking_id),
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR NOT NULL CHECK (payment_method IN ('credit_card','paypal','stripe'))
);


-- REVIEWS TABLE

CREATE TABLE reviews (
    review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID REFERENCES properties(property_id),
    user_id UUID REFERENCES users(user_id),
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- MESSAGES TABLE

CREATE TABLE messages (
    message_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender_id UUID REFERENCES users(user_id),
    recipient_id UUID REFERENCES users(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- SAMPLE DATA
--=========================
-- Users
INSERT INTO users (first_name, last_name, email, password_hash, role)
VALUES
('Alice', 'Johnson', 'alice@example.com', 'pw1', 'guest'),
('Bob', 'Smith', 'bob@example.com', 'pw2', 'host'),
('Charlie', 'Brown', 'charlie@example.com', 'pw3', 'guest');

-- Properties
INSERT INTO properties (host_id, name, description, location, price_per_night)
VALUES
((SELECT user_id FROM users WHERE role='host' LIMIT 1), 'Sea View Apartment', 'Apartment with sea view', 'Miami', 120.00),
((SELECT user_id FROM users WHERE role='host' LIMIT 1), 'Mountain Cabin', 'Cozy cabin in the mountains', 'Aspen', 200.00);

-- Bookings
INSERT INTO bookings (property_id, user_id, start_date, end_date, total_price, status)
VALUES
((SELECT property_id FROM properties LIMIT 1), (SELECT user_id FROM users WHERE first_name='Alice'), '2025-09-01', '2025-09-05', 480.00, 'confirmed');

-- Payments
INSERT INTO payments (booking_id, amount, payment_method)
VALUES
((SELECT booking_id FROM bookings LIMIT 1), 480.00, 'credit_card');

-- Reviews
INSERT INTO reviews (property_id, user_id, rating, comment)
VALUES
((SELECT property_id FROM properties LIMIT 1), (SELECT user_id FROM users WHERE first_name='Alice'), 5, 'Amazing stay!');

-- Messages
INSERT INTO messages (sender_id, recipient_id, message_body)
VALUES
((SELECT user_id FROM users WHERE first_name='Alice'), (SELECT user_id FROM users WHERE first_name='Bob'), 'Hi, is the property available next weekend?');
