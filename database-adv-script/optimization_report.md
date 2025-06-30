# 📊 Task 4: Query Optimization Report

## 🎯 Objective

Optimize a complex query involving multiple JOINs across the Booking system to reduce response time and improve scalability.

---

## 🔴 Initial Query Analysis (Unoptimized)

### ❌ Problem Areas

| Issue                  | Details                                                      |
|------------------------|--------------------------------------------------------------|
| SELECT *               | Pulls all columns (many unused)                              |
| No WHERE clause        | Retrieves all bookings, even irrelevant ones                 |
| Full Table Scans       | No indexes used during JOINs                                 |
| High Memory Usage      | Due to excessive column loading                              |

### 📋 EXPLAIN ANALYZE Output (Before)

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking 
JOIN User ON Booking.user_id = User.user_id
JOIN Property ON Booking.property_id = Property.property_id
JOIN Payment ON Booking.booking_id = Payment.booking_id;
