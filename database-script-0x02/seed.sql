-- Airbnb Database Sample Data

-- USERS
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(UUID(), 'Alice', 'Johnson', 'alice@example.com', 'hash1', '1234567890', 'guest'),
(UUID(), 'Bob', 'Smith', 'bob@example.com', 'hash2', '2345678901', 'host'),
(UUID(), 'Charlie', 'Lee', 'charlie@example.com', 'hash3', '3456789012', 'guest'),
(UUID(), 'Diana', 'Brown', 'diana@example.com', 'hash4', '4567890123', 'host');

-- PROPERTIES
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
(UUID(), (SELECT user_id FROM User WHERE first_name='Bob'), 'Cozy Apartment', '2-bedroom apartment', 'New York', 120.00),
(UUID(), (SELECT user_id FROM User WHERE first_name='Diana'), 'Beach House', '3-bedroom house with ocean view', 'California', 250.00);

-- BOOKINGS
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(UUID(), (SELECT property_id FROM Property WHERE name='Cozy Apartment'), (SELECT user_id FROM User WHERE first_name='Alice'), '2025-09-01', '2025-09-05', 480.00, 'confirmed'),
(UUID(), (SELECT property_id FROM Property WHERE name='Beach House'), (SELECT user_id FROM User WHERE first_name='Charlie'), '2025-10-10', '2025-10-15', 1250.00, 'pending');

-- PAYMENTS
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
(UUID(), (SELECT booking_id FROM Booking WHERE total_price=480.00), 480.00, 'credit_card'),
(UUID(), (SELECT booking_id FROM Booking WHERE total_price=1250.00), 1250.00, 'paypal');

-- REVIEWS
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
(UUID(), (SELECT property_id FROM Property WHERE name='Cozy Apartment'), (SELECT user_id FROM User WHERE first_name='Alice'), 5, 'Great stay! Very clean.'),
(UUID(), (SELECT property_id FROM Property WHERE name='Beach House'), (SELECT user_id FROM User WHERE first_name='Charlie'), 4, 'Beautiful view, nice host.');

-- MESSAGES
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
(UUID(), (SELECT user_id FROM User WHERE first_name='Alice'), (SELECT user_id FROM User WHERE first_name='Bob'), 'Hi, looking forward to my stay!'),
(UUID(), (SELECT user_id FROM User WHERE first_name='Charlie'), (SELECT user_id FROM User WHERE first_name='Diana'), 'Hello! Can we confirm my booking?');
