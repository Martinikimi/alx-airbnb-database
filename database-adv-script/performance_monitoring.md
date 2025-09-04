# Database Performance Monitoring Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

## Step 1: Analyze Query Performance
Used SQL commands like `EXPLAIN`, `EXPLAIN ANALYZE`, and `SHOW PROFILE` to inspect frequently used queries.

### Example Queries Monitored
1. Fetch bookings by date range:
```sql
EXPLAIN ANALYZE
SELECT * FROM Booking_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-03-31';
