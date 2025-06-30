-- Task 0: JOIN Queries for Airbnb Database

-- 🔁 INNER JOIN: Retrieve all bookings and the respective users who made them
SELECT 
    b.booking_id,
    u.user_id,
    u.first_name,
    u.last_name,
    b.property_id,
    b.start_date,
    b.end_date
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id;

-- 🔁 LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id;

-- 🔁 FULL OUTER JOIN: Retrieve all users and all bookings, even if not linked
-- Note: FULL OUTER JOIN is not supported in some databases like MySQL.
-- Use UNION of LEFT and RIGHT JOIN as workaround.
SELECT 
    u.user_id,
    u.first_name,
    b.booking_id,
    b.property_id,
    b.start_date
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    b.booking_id,
    b.property_id,
    b.start_date
FROM 
    Booking b
LEFT JOIN 
    User u ON u.user_id = b.user_id;
