# joins_queries.sql

This file contains SQL queries demonstrating different types of joins using the Airbnb database schema.

## Files
- `joins_queries.sql`: Contains queries for INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
- `setup_airbnb.sql`: (Optional) I used this to create tables and insert sample data for testing.

## Queries
1. **INNER JOIN** → Get all bookings and the users who made them.  
2. **LEFT JOIN** → Get all properties and their reviews, including properties without reviews.  
3. **FULL OUTER JOIN** → Get all users and all bookings, even if a user has no booking or a booking is not linked to a user.


# Subqueries.sql

This file contains two subqueries demonstrating:

1. Non-correlated subquery: Properties with average rating > 4.0  
2. Correlated subquery: Users with more than 3 bookings

# aggregations_and_window_functions.sql

This file contains two queries demonstrating:

1. Aggregation: Total bookings made by each user using COUNT and GROUP BY.  
2. Window function: Rank properties based on total bookings using RANK.



