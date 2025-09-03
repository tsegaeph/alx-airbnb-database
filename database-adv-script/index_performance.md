# Index Performance Report

This document describes the indexes created to improve query performance on the Airbnb database.

> All the indexing commands were implemented in the file `database_index.sql`.

## 1. Indexes Created

| Table      | Column            | Index Name                 | Reason |
|----------- |-----------------|---------------------------|--------|
| users      | email            | idx_users_email           | Frequently used in WHERE clauses for user lookups |
| bookings   | user_id          | idx_bookings_user_id      | Used in JOINs with users table |
| bookings   | property_id      | idx_bookings_property_id  | Used in JOINs with properties table |
| bookings   | start_date       | idx_bookings_start_date   | Used in filtering by date range |
| properties | host_id          | idx_properties_host_id    | Used in JOINs with bookings or reviews |

## 2. Query Performance

### Example Query Before Index:
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
WHERE b.start_date >= '2025-01-01';
