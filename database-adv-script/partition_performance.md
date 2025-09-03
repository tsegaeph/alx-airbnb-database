# Partition Performance Report

## 1. Partitioning Implementation

- The `bookings_partitioned` table was created using **RANGE partitioning** on the `start_date` column.  
- Child tables were created for each year (e.g., `bookings_2025`, `bookings_2026`).  
- Existing data from `bookings` table was migrated to the partitioned table.  
- SQL commands used for partitioning are in `partitioning.sql`.

## 2. Query Performance

### Before Partitioning
- Query fetching bookings by date had to scan the entire `bookings` table.  
- Execution time: [Insert time from EXPLAIN ANALYZE]

### After Partitioning
- Queries only scan relevant partition(s) based on date range.  
- Example queries:
  - Fetch bookings in January 2025
  - Join bookings with users and properties filtered by start_date  
- Execution time improved: [Insert time from EXPLAIN ANALYZE]

## 3. Notes
- Partitioning is effective for large tables where queries filter by the partitioned column (`start_date`).  
- Reduces I/O and improves query performance for date-based queries.  
- Always monitor partitions and create new ones as dataset grows.
