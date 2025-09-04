# Database Advanced Script — Joins examples

This directory contains SQL examples required for the "Unleashing Advanced Querying Power" project.

Files:
- `joins_queries.sql` — INNER JOIN, LEFT JOIN (including an aggregated JSON example), and FULL OUTER JOIN examples (PostgreSQL). A MySQL-compatible FULL OUTER JOIN alternative using UNION is included.

## How to use
1. **Target DB engine:** these examples assume PostgreSQL. Most queries will work on other SQL engines, but FULL OUTER JOIN is engine-specific (see MySQL note in the SQL file).

2. **Run with psql (Postgres)**
   ```bash
   psql -h <host> -U <user> -d <database> -f database-adv-script/joins_queries.sql
# Database Advanced Script – Index Optimization

## 📌 Task
This task demonstrates how to optimize database queries using indexes.  
We create indexes on frequently queried columns and measure performance before and after indexing.

## 📂 Files
- `index_performance.md` → contains:
  - SQL `CREATE INDEX` statements
  - `EXPLAIN ANALYZE` queries
  - Before vs After performance comparison
  - Conclusion on optimization

## 🚀 How to Test
1. Run the provided `CREATE INDEX` SQL commands on your database.
2. Execute the queries with `EXPLAIN ANALYZE` before and after indexing.
3. Compare execution plans:
   - **Before indexing** → sequential scans
   - **After indexing** → index scans with lower cost

# Database Advanced Scripts

This folder contains advanced SQL scripts and documentation for optimizing the **Airbnb Clone database**.

## Contents

1. **aggregations_and_window_functions.sql**  
   - Demonstrates use of SQL aggregations and window functions.  
   - Includes `ROW_NUMBER()` to rank properties based on total bookings.  

2. **database_index.sql**  
   - Contains `CREATE INDEX` commands to optimize queries on high-usage columns in the User, Booking, and Property tables.  

3. **index_performance.md**  
   - Documents query performance before and after indexing.  
   - Uses `EXPLAIN` and `ANALYZE` to show the impact of indexes.  


