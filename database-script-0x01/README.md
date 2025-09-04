
# Database Schema (DDL)

This folder contains the **SQL Data Definition Language (DDL)** script for the Airbnb database.

## Files
- **schema.sql** → Contains `CREATE TABLE` statements for all entities (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`).
- **README.md** → This file, explaining the purpose.

## Features
- Primary keys on all entities.
- Foreign key constraints to enforce relationships.
- ENUM constraints for roles, booking status, and payment methods.
- CHECK constraint on review rating (1–5).
- Indexes on frequently queried columns for performance optimization.
