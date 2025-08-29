# Airbnb Database Normalization

## Introduction
Normalization is the process of organizing a database to reduce redundancy and improve data integrity.  
The goal is to ensure that the Airbnb database schema is in **Third Normal Form (3NF)**.

---

## First Normal Form (1NF)
- Ensure all tables have a primary key.
- Ensure each attribute contains only atomic (indivisible) values.

**Check:**
- All tables (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) have **UUID primary keys**.
- All attributes are atomic; no repeating groups or arrays.  

✅ The schema satisfies 1NF.

---

## Second Normal Form (2NF)
- Must be in 1NF.
- Remove partial dependencies: non-key attributes must depend on the **whole primary key**.

**Check:**
- All tables have **single-column primary keys**, so no partial dependencies exist.
- Example: In `Property`, `name`, `description`, `location`, and `pricepernight` depend fully on `property_id`.  

✅ The schema satisfies 2NF.

---

## Third Normal Form (3NF)
- Must be in 2NF.
- Remove transitive dependencies: non-key attributes must depend only on the primary key.

**Check:**
- `User` → all attributes depend only on `user_id`.  
- `Property` → all attributes depend only on `property_id`.  
- `Booking` → all attributes depend only on `booking_id`.  
  - `total_price` depends on `start_date`, `end_date`, and `pricepernight` from `Property`.  
    - **Optional note:** `total_price` could be computed dynamically to fully eliminate redundancy, but storing it is common for performance.  
- `Payment`, `Review`, `Message` → all attributes depend only on their primary key.  

✅ The schema satisfies 3NF.

---

## Summary of Adjustments
- All tables are already normalized to 3NF.  
- No additional tables or changes are strictly required.  
- Foreign keys correctly maintain relationships between tables.  
- Optional optimization: compute `total_price` dynamically in `Booking` instead of storing it.
