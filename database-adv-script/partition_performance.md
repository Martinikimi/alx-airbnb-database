# Partitioning Performance Report

## Objective
Optimize query performance on the large `Booking` table by implementing range partitioning based on `start_date`.

## Implementation
- Created a partitioned table `Booking_partitioned` using range partitioning by year.
- Copied existing data into the partitioned table.
- Partitioned table primary key includes `start_date`.

## Test Queries
- Query: Fetch bookings between '2024-01-01' and '2024-03-31'.

## Observations
- Number of rows scanned reduced significantly due to partition pruning.
- Query execution time improved noticeably compared to the unpartitioned table.
- Only relevant partitions were scanned for date-based queries, improving efficiency for historical and future booking queries.

## Conclusion
Partitioning the `Booking` table by `start_date` effectively optimized queries for large datasets, reducing I/O and improving performance for date range searches.

