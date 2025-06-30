-- Task 3: Index Creation Scripts for Airbnb Database

-- 👤 User Table Indexes
-- Purpose: Improve lookups during authentication and filtering
CREATE INDEX idx_user_email ON User(email); -- Speeds up WHERE email = ?
CREATE INDEX idx_user_role ON User(role);   -- Useful for admin/user filtering

-- 🏠 Property Table Indexes
-- Purpose: Enhance performance for listings filtered by location or host
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_host_id ON Property(host_id);

-- 📅 Booking Table Indexes
-- Purpose: Optimize frequent JOINs and range queries
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- 💳 Payment Table Indexes
-- Purpose: Speed up payment reports and filtering
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
CREATE INDEX idx_payment_method ON Payment(payment_method);

-- ⭐ Review Table Indexes
-- Purpose: Improve JOINs and aggregation by property
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);


