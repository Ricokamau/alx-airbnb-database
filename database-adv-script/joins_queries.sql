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
    User u ON b.user_id = u.user_id
ORDER BY 
    b.booking_id;

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
    Review r ON p.property_id = r.property_id
ORDER BY 
    p.property_id;

-- 🔁 FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- Note: MySQL does not support FULL OUTER JOIN natively, so we use UNION of LEFT and RIGHT JOINs

-- Part 1: LEFT JOIN (users with or without bookings)
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

-- Part 2: RIGHT JOIN (bookings with or without users)
SELECT 
    u.user_id,
    u.first_name,
    b.booking_id,
    b.property_id,
    b.start_date
FROM 
    Booking b
LEFT JOIN 
    User u ON u.user_id = b.user_id
ORDER BY 
    booking_id;
