-- Task 1: Subqueries for Airbnb Database

-- 🧠 Non-Correlated Subquery: Find all properties where the average rating is greater than 4.0
SELECT 
    property_id,
    name,
    location
FROM 
    Property
WHERE 
    property_id IN (
        SELECT 
            property_id
        FROM 
            Review
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    );

-- 🧠 Correlated Subquery: Find users who have made more than 3 bookings
SELECT 
    user_id,
    first_name,
    last_name
FROM 
    User u
WHERE 
    (
        SELECT COUNT(*)
        FROM Booking b
        WHERE b.user_id = u.user_id
    ) > 3;
