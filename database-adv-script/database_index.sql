-- Task 3: Create Indexes for Frequently Queried Columns

-- 👤 User table index on email for faster lookup during login or verification
CREATE INDEX idx_user_email ON User(email);

-- 📅 Booking table indexes for JOINs and WHERE filters
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- 🏠 Property table index for name searches and filtering
CREATE INDEX idx_property_location ON Property(location);

-- ⭐ Review table index for filtering and grouping
CREATE INDEX idx_review_property_id ON Review(property_id);

