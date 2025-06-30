# 📦 Task 5: Booking Table Partitioning Report

## 🎯 Goal

To improve the performance of date-range queries on the `Booking` table by applying **range-based partitioning** on the `start_date` column.

---

## 📚 Partitioning Strategy

We created a new table `Booking_partitioned` and partitioned it using:

```sql
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);
