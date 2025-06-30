-- Task 5: Partitioning the Booking Table based on start_date

-- 🛑 STEP 0: Drop partitioned table if it exists (for reruns during testing)
DROP TABLE IF EXISTS Booking_partitioned;

-- ✅ STEP 1: Create partitioned table (MySQL-style RANGE partitioning)
CREATE TABLE Booking_partitioned (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);

-- ✅ STEP 2: Copy data from original Booking table
INSERT INTO Booking_partitioned (
    booking_id, user_id, property_id, start_date, end_date, created_at
)
SELECT
    booking_id, user_id, property_id, start_date, end_date, created_at
FROM Booking;

-- ✅ STEP 3: Run test query on partitioned table
EXPLAIN ANALYZE
SELECT * 
FROM Booking_partitioned
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';

-- ✅ STEP 4 (Optional): Compare with original table
EXPLAIN ANALYZE
SELECT * 
FROM Booking
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
