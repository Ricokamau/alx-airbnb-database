-- Task 4: Performance Query (Unoptimized vs Optimized)

-- 🔴 UNOPTIMIZED QUERY
-- Problem: SELECT *, no WHERE clause, non-indexed joins
EXPLAIN ANALYZE
SELECT *
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id;

-- ✅ OPTIMIZED QUERY
-- Improvements: Explicit fields, WHERE filter, indexed JOINs
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date BETWEEN '2025-06-01' AND '2025-06-30';
