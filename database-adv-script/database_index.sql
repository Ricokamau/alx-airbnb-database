-- Task 3: Index Creation Scripts for Airbnb Database

-- STEP 1: EXPLAIN ANALYZE before indexing (to measure current performance)
-- Example: Analyze performance of booking queries by date
EXPLAIN ANALYZE
SELECT * 
FROM Booking 
WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';

-- STEP 2: Create indexes on high-usage columns

-- 👤 User Table
CREATE INDEX idx_user_email ON User(email);         -- For login and user lookup
CREATE INDEX idx_user_role ON User(role);           -- For admin/host filtering

-- 🏠 Property Table
CREATE INDEX idx_property_location ON Property(location); -- For filtering by location
CREATE INDEX idx_property_host_id ON Property(host_id);   -- For retrieving host properties

-- 📅 Booking Table
CREATE INDEX idx_booking_user_id ON Booking(user_id);         -- JOINs with User
CREATE INDEX idx_booking_property_id ON Booking(property_id); -- JOINs with Property
CREATE INDEX idx_booking_start_date ON Booking(start_date);   -- For date range filters
CREATE INDEX idx_booking_created_at ON Booking(created_at);   -- Sorting/booked-at analysis

-- 💳 Payment Table
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);       -- JOINs with Booking
CREATE INDEX idx_payment_method ON Payment(payment_method);       -- Filtering by method

-- ⭐ Review Table
CREATE INDEX idx_review_property_id ON Review(property_id);       -- Aggregation per property
CREATE INDEX idx_review_user_id ON Review(user_id);               -- Filtering reviews per user

-- STEP 3: Re-run EXPLAIN ANALYZE after indexing (to compare performance)
EXPLAIN ANALYZE
SELECT * 
FROM Booking 
WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';


