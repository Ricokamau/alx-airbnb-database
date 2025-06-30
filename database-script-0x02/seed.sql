-- =============================
-- USERS
-- =============================
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('uuid-guest-1', 'Alice', 'Wanjiku', 'alice@guest.com', 'hash_pwd1', '0712345678', 'guest', CURRENT_TIMESTAMP),
  ('uuid-guest-2', 'Brian', 'Otieno', 'brian@guest.com', 'hash_pwd2', '0722334455', 'guest', CURRENT_TIMESTAMP),
  ('uuid-host-1', 'Cynthia', 'Njoroge', 'cynthia@host.com', 'hash_pwd3', '0700000001', 'host', CURRENT_TIMESTAMP),
  ('uuid-host-2', 'Daniel', 'Mwangi', 'daniel@host.com', 'hash_pwd4', '0733111222', 'host', CURRENT_TIMESTAMP),
  ('uuid-admin-1', 'Eva', 'Kamau', 'eva@admin.com', 'hash_pwd5', '0755555555', 'admin', CURRENT_TIMESTAMP),
  ('uuid-guest-3', 'Faith', 'Kiptoo', 'faith@guest.com', 'hash_pwd6', '0766666666', 'guest', CURRENT_TIMESTAMP),
  ('uuid-host-3', 'George', 'Mutua', 'george@host.com', 'hash_pwd7', '0799999999', 'host', CURRENT_TIMESTAMP);

-- =============================
-- PROPERTIES
-- =============================
INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  ('prop-001', 'uuid-host-1', 'Urban Studio', 'Modern apartment in Nairobi CBD', 'Nairobi, Kenya', 4500.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('prop-002', 'uuid-host-2', 'Beachside Retreat', 'Cozy house near Diani Beach', 'Mombasa, Kenya', 8500.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('prop-003', 'uuid-host-1', 'Karen Cottage', 'Luxury cottage in Karen suburb', 'Karen, Nairobi', 6500.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('prop-004', 'uuid-host-3', 'Mountain View BnB', 'Charming home near Mount Kenya', 'Nanyuki, Kenya', 5500.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- =============================
-- BOOKINGS
-- =============================
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('book-001', 'prop-001', 'uuid-guest-1', '2025-07-01', '2025-07-05', 18000.00, 'confirmed', CURRENT_TIMESTAMP),
  ('book-002', 'prop-002', 'uuid-guest-2', '2025-07-10', '2025-07-13', 25500.00, 'confirmed', CURRENT_TIMESTAMP),
  ('book-003', 'prop-003', 'uuid-guest-3', '2025-08-01', '2025-08-04', 19500.00, 'pending', CURRENT_TIMESTAMP),
  ('book-004', 'prop-004', 'uuid-guest-1', '2025-07-20', '2025-07-23', 16500.00, 'confirmed', CURRENT_TIMESTAMP);

-- =============================
-- PAYMENTS
-- =============================
INSERT INTO Payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('pay-001', 'book-001', 18000.00, CURRENT_TIMESTAMP, 'credit_card'),
  ('pay-002', 'book-002', 25500.00, CURRENT_TIMESTAMP, 'paypal'),
  ('pay-003', 'book-004', 16500.00, CURRENT_TIMESTAMP, 'stripe');

-- =============================
-- REVIEWS
-- =============================
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('rev-001', 'prop-001', 'uuid-guest-1', 5, 'Fantastic location and clean space.', CURRENT_TIMESTAMP),
  ('rev-002', 'prop-002', 'uuid-guest-2', 4, 'Great view but noisy neighbors.', CURRENT_TIMESTAMP),
  ('rev-003', 'prop-004', 'uuid-guest-1', 3, 'Decent stay, could improve WiFi.', CURRENT_TIMESTAMP);

-- =============================
-- MESSAGES
-- =============================
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('msg-001', 'uuid-guest-1', 'uuid-host-1', 'Hi! Can I check in early?', CURRENT_TIMESTAMP),
  ('msg-002', 'uuid-host-1', 'uuid-guest-1', 'Sure! Early check-in is okay.', CURRENT_TIMESTAMP),
  ('msg-003', 'uuid-guest-2', 'uuid-host-2', 'Do you allow pets?', CURRENT_TIMESTAMP),
  ('msg-004', 'uuid-host-2', 'uuid-guest-2', 'Yes, pets are allowed with extra fee.', CURRENT_TIMESTAMP),
  ('msg-005', 'uuid-guest-3', 'uuid-admin-1', 'How do I reset my password?', CURRENT_TIMESTAMP);
