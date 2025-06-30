# 🧠 Task 3: Indexing Performance Report

## 📌 Overview

Indexes were created on frequently accessed columns across multiple tables to enhance query speed and reduce full-table scans.

---

## 🛠 Indexes Implemented

| Table     | Column           | Index Name               |
|-----------|------------------|--------------------------|
| User      | email            | idx_user_email           |
| User      | role             | idx_user_role            |
| Property  | location         | idx_property_location    |
| Property  | host_id          | idx_property_host_id     |
| Booking   | user_id          | idx_booking_user_id      |
| Booking   | property_id      | idx_booking_property_id  |
| Booking   | start_date       | idx_booking_start_date   |
| Booking   | created_at       | idx_booking_created_at   |
| Payment   | booking_id       | idx_payment_booking_id   |
| Payment   | payment_method   | idx_payment_method       |
| Review    | property_id      | idx_review_property_id   |
| Review    | user_id          | idx_review_user_id       |

---

## ⚡️ Benchmark Example: Before vs After Indexing

### 🎯 Query
```sql
SELECT * 
FROM Booking 
WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';
