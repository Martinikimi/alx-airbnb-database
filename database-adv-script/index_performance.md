# Index Performance Analysis

This document measures the query performance before and after adding indexes.

---

## 1. Before Adding Indexes
Example query on `Booking` table:

```sql
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE user_id = 42;

