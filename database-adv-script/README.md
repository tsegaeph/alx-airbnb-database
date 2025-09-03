# Joins Queries

This project contains SQL queries demonstrating different types of joins using the Airbnb database schema.

## Files
- `joins_queries.sql`: Contains queries for INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
- `setup_airbnb.sql`: (Optional) Creates tables and inserts sample data for testing.

## Queries
1. **INNER JOIN** → Get all bookings and the users who made them.  
2. **LEFT JOIN** → Get all properties and their reviews, including properties without reviews.  
3. **FULL OUTER JOIN** → Get all users and all bookings, even if a user has no booking or a booking is not linked to a user.

## How to Run
```bash
psql -U postgres -d airbnb_db -f joins_queries.sql
