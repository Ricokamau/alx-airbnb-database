-- Enable UUID extension if using PostgreSQL
-- Uncomment the line below if you're using PostgreSQL
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =============================
-- 1. USERS TABLE
-- =============================
CREATE TABLE Users (
  user_id UUID PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20),
  role VARCHAR(10) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON Users(email);

-- =============================
-- 2. PROPERTY TABLE
-- =============================
CREATE TABLE Properties (
  property_id UUID PRIMARY KEY,
  host_id UUID NOT NULL,
  name VARCHAR(150) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR(255) NOT NULL,
  pricepernight DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT fk_host FOREIGN KEY (host_id)
    REFERENCES Users(user_id)
    ON DELETE CASCADE
);

CREATE INDEX idx_property_host ON Properties(host_id);
CREATE INDEX idx_property_location ON Properties(location);

-- =============================
-- 3. BOOKING TABLE
-- =============================
CREATE TABLE Bookings (
  booking_id UUID PRIMARY KEY,
  property_id UUID NOT NULL,
  user_id UUID NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT fk_booking_property FOREIGN KEY (property_id)
    REFERENCES Properties(property_id)
    ON DELETE CASCADE,

  CONSTRAINT fk_booking_user FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
    ON DELETE CASCADE
);

CREATE INDEX idx_booking_property ON Bookings(property_id);
CREATE INDEX idx_booking_user ON Bookings(user_id);

-- =============================
-- 4. PAYMENT TABLE
-- =============================
CREATE TABLE Payments (
  payment_id UUID PRIMARY KEY,
  booking_id UUID NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),

  CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id)
    REFERENCES Bookings(booking_id)
    ON DELETE CASCADE
);

CREATE INDEX idx_payment_booking ON Payments(booking_id);

-- =============================
-- 5. REVIEW TABLE
-- =============================
CREATE TABLE Reviews (
  review_id UUID PRIMARY KEY,
  property_id UUID NOT NULL,
  user_id UUID NOT NULL,
  rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT fk_review_property FOREIGN KEY (property_id)
    REFERENCES Properties(property_id)
    ON DELETE CASCADE,

  CONSTRAINT fk_review_user FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
    ON DELETE CASCADE
);

CREATE INDEX idx_review_property ON Reviews(property_id);
CREATE INDEX idx_review_user ON Reviews(user_id);

-- =============================
-- 6. MESSAGE TABLE
-- =============================
CREATE TABLE Messages (
  message_id UUID PRIMARY KEY,
  sender_id UUID NOT NULL,
  recipient_id UUID NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT fk_message_sender FOREIGN KEY (sender_id)
    REFERENCES Users(user_id)
    ON DELETE CASCADE,

  CONSTRAINT fk_message_recipient FOREIGN KEY (recipient_id)
    REFERENCES Users(user_id)
    ON DELETE CASCADE
);

CREATE INDEX idx_message_sender ON Messages(sender_id);
CREATE INDEX idx_message_recipient ON Messages(recipient_id);
