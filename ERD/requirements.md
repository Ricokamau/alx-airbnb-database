# Entity-Relationship Diagram for Airbnb Database

## Overview

This document explains the design of the Entity-Relationship Diagram (ERD) for an Airbnb-like platform. The system includes six main entities: User, Property, Booking, Payment, Review, and Message. The ERD models how these entities interact in a real-world rental service.

## Entities and Attributes

### 1. User
- `user_id` (UUID, PK)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin)
- `created_at` (TIMESTAMP, default)

### 2. Property
- `property_id` (UUID, PK)
- `host_id` (UUID, FK → User)
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `pricepernight` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

### 3. Booking
- `booking_id` (UUID, PK)
- `property_id` (UUID, FK → Property)
- `user_id` (UUID, FK → User)
- `start_date` (DATE)
- `end_date` (DATE)
- `total_price` (DECIMAL)
- `status` (ENUM: pending, confirmed, canceled)
- `created_at` (TIMESTAMP)

### 4. Payment
- `payment_id` (UUID, PK)
- `booking_id` (UUID, FK → Booking)
- `amount` (DECIMAL)
- `payment_date` (TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe)

### 5. Review
- `review_id` (UUID, PK)
- `property_id` (UUID, FK → Property)
- `user_id` (UUID, FK → User)
- `rating` (INTEGER, 1–5)
- `comment` (TEXT)
- `created_at` (TIMESTAMP)

### 6. Message
- `message_id` (UUID, PK)
- `sender_id` (UUID, FK → User)
- `recipient_id` (UUID, FK → User)
- `message_body` (TEXT)
- `sent_at` (TIMESTAMP)

## Relationships

- A **User** can be a **guest**, **host**, or **admin**.
- A **Host (User)** can own many **Properties**.
- A **Guest (User)** can make multiple **Bookings**.
- A **Booking** belongs to one **User** and one **Property**.
- A **Booking** can have one **Payment**.
- A **User** can leave many **Reviews** on Properties.
- A **User** can send many **Messages** to other users.

## Design Decisions

- We used `UUID` for all primary keys to ensure uniqueness across distributed systems.
- Timestamps are included to support future features like auditing and filtering by date.
- ENUMs are used for `role`, `status`, and `payment_method` to restrict values and simplify validation.

## ER Diagram

![ER Diagram](your-exported-image.png)
