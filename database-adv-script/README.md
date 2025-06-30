# Task 0: JOIN Queries - Airbnb Database

## 🎯 Objective

Demonstrate mastery of SQL joins by writing and executing different types of join queries: `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`.

---

## 🔍 JOIN Types and Use Cases

### 1. INNER JOIN
- Combines rows that have matching values in both tables.
- Use Case: Retrieve bookings along with users who made them.

### 2. LEFT JOIN
- Returns all records from the left table and matched records from the right table.
- Use Case: List all properties and their reviews, even if some properties don't have reviews.

### 3. FULL OUTER JOIN
- Returns all records when there is a match in either left or right table.
- Use Case: Get all users and bookings, whether linked or not.

---

## 🗃 Data Tables Involved

- `User`: Contains user info (guests, hosts, admins)
- `Booking`: Tracks all bookings
- `Property`: Airbnb listings
- `Review`: Feedback and ratings by users

---

## 📌 Notes

- MySQL lacks native `FULL OUTER JOIN`. A workaround using `UNION` of `LEFT JOIN` and `RIGHT JOIN` is used.
- All queries were executed and tested for correctness using realistic sample data.

