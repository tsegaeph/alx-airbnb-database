# Query Optimization Report

## 1. Initial Query

- Retrieves all bookings along with user, property, and payment details.
- Uses multiple joins including INNER JOIN and LEFT JOIN.
- Query execution analyzed using `EXPLAIN ANALYZE`.

## 2. Performance Analysis

- Initial query shows sequential scans on `bookings` and `users` tables.
- Nested loops were observed on joins, which can be slow for large datasets.
- Execution time: [Insert time from EXPLAIN ANALYZE]

## 3. Optimizations Applied

- Added indexes on `bookings.user_id`, `bookings.property_id`, `bookings.booking_id` (from `database_index.sql`).  
- Removed unnecessary columns to reduce data load.  
- Ensured proper joins and order of operations for efficient access.  

## 4. Refactored Query

- Optimized query selects only necessary columns.  
- Uses indexes for fast joins.  
- Execution time improved: [Insert time from EXPLAIN ANALYZE after optimization]

## 5. Notes

- Always measure performance before and after optimization.  
- Indexing high-usage columns significantly reduces query execution time.  
- Filtering early and selecting only needed columns reduces memory and I/O usage