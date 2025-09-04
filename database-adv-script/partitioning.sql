-- Step 1: Create a partitioned Booking table
CREATE TABLE Booking_partitioned (
    booking_id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20),
    amount DECIMAL(10,2),
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Step 2: Copy data from old Booking table
INSERT INTO Booking_partitioned (booking_id, user_id, property_id, start_date, end_date, status, amount)
SELECT booking_id, user_id, property_id, start_date, end_date, status, amount
FROM Booking;

-- Step 3: (Optional) Drop old table and rename new one
-- DROP TABLE Booking;
-- RENAME TABLE Booking_partitioned TO Booking;

