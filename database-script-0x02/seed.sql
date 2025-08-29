-- Airbnb Database Sample Data (Customized Names)

-- USERS
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(UUID(), 'Tsega', 'Ephrem', 'tsega.ephrem@example.com', 'hash1', '1112223333', 'guest'),
(UUID(), 'Tselot', 'Million', 'tselot.million@example.com', 'hash2', '2223334444', 'host'),
(UUID(), 'Tsion', 'Mengist', 'tsion.mengist@example.com', 'hash3', '3334445555', 'guest'),
(UUID(), 'Eden', 'Altaye', 'eden.altaye@example.com', 'hash4', '4445556666', 'host');

-- PROPERTIES
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
(UUID(), (SELECT user_id FROM User WHERE first_name='Tselot'), 'Downtown Loft', 'Modern loft in the city center', 'Addis Ababa', 150.00),
(UUID(), (SELECT user_id FROM User WHERE first_name='Eden'), 'Mountain Cabin', 'Cozy cabin with mountain view', 'Bahir Dar', 200.00);

-- BOOKINGS
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(UUID(), (SELECT property_id FROM Property WHERE name='Downtown Loft'), (SELECT user_id FROM User WHERE first_name='Tsega'), '2025-09-15', '2025-09-20', 750.00, 'confirmed'),
(UUID(), (SELECT property_id FROM Property WHERE name='Mountain Cabin'), (SELECT user_id FROM User WHERE first_name='Tsion'), '2025-10-05', '2025-10-10', 1000.00, 'pending');

-- PAYMENTS
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
(UUID(), (SELECT booking_id FROM Booking WHERE total_price=750.00), 750.00, 'stripe'),
(UUID(), (SELECT booking_id FROM Booking WHERE total_price=1000.00), 1000.00, 'paypal');

-- REVIEWS
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
(UUID(), (SELECT property_id FROM Property WHERE name='Downtown Loft'), (SELECT user_id FROM User WHERE first_name='Tsega'), 5, 'Amazing loft! Very convenient location.'),
(UUID(), (SELECT property_id FROM Property WHERE name='Mountain Cabin'), (SELECT user_id FROM User WHERE first_name='Tsion'), 4, 'Beautiful cabin, very peaceful.');

-- MESSAGES
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
(UUID(), (SELECT user_id FROM User WHERE first_name='Tsega'), (SELECT user_id FROM User WHERE first_name='Tselot'), 'Hello! Excited for my stay!'),
(UUID(), (SELECT user_id FROM User WHERE first_name='Tsion'), (SELECT user_id FROM User WHERE first_name='Eden'), 'Hi, can we confirm my booking?');
