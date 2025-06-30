# Database Normalization

This document outlines the steps taken to normalize the Airbnb database schema into Third Normal Form (3NF).

---

## 1. First Normal Form (1NF)
- All attributes are atomic (e.g., no multiple values stored in a single field like `phone1, phone2`).
- Each column contains only one value per record.
- Each record is unique and identified by a primary key (e.g., `user_id`, `property_id`).

## 2. Second Normal Form (2NF)
- The schema is already in 1NF.
- All non-key attributes are fully functionally dependent on the entire primary key.
- None of the tables have composite primary keys, so partial dependencies are not an issue.

## 3. Third Normal Form (3NF)
- All transitive dependencies are removed.
- Each non-key attribute is dependent only on the primary key.
  - For example:
    - In `User`, email is not dependent on `first_name`, only on `user_id`.
    - In `Booking`, `total_price` depends only on `booking_id`, not `property_id`.

---

## Entity Justification Summary

### User Table
- Atomic fields, no derived or repeated data.
- email is unique.
- Fully normalized to 3NF.

### Property Table
- No transitive dependencies.
- host_id is a FK referencing User.
- Fully normalized.

### Booking Table
- Each booking references a user and property.
- status is an ENUM.
- Fully normalized.

### Payment Table
- Depends only on booking_id.
- No redundant or derived data.
- Normalized.

### Review Table
- Relates user to property with rating and comment.
- Fields are atomic and fully dependent on the PK.

### Message Table
- sender_id and recipient_id relate to User.
- message_body and sent_at are independent and atomic.

---

## Conclusion

All entities have been reviewed and structured to meet 3NF, ensuring a scalable, reliable, and redundant-free database schema.
