# 🔍 Task 6: Performance Monitoring and Schema Refinement Report

## 🎯 Goal

Continuously monitor query execution performance and make informed changes to the database schema or indexes to enhance efficiency.

---

## 🔬 Tools Used

| Tool             | Purpose                                              |
|------------------|------------------------------------------------------|
| EXPLAIN          | Visualizes query execution plan                      |
| EXPLAIN ANALYZE  | Shows actual runtime statistics of a query           |
| SHOW PROFILE     | (MySQL) Breaks down query time by operation phase    |
| Query Benchmarks | Execution time and rows scanned for heavy queries    |

---

## 🔎 Queries Monitored

### 1. Get All Bookings in a Date Range

```sql
EXPLAIN ANALYZE
SELECT * 
FROM Booking 
WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
