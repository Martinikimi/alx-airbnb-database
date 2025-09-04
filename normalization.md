# Normalization of Airbnb Database Design

This document explains how the database schema achieves **Third Normal Form (3NF)**.

---

## Step 1 — First Normal Form (1NF)
- All attributes are atomic (no repeating groups, no multi-valued fields).
- Example: `User` table stores single values for `first_name`, `last_name`, etc.
✅ Passed.

---

## Step 2 — Second Normal Form (2NF)
- No partial dependencies since all primary keys are simple (UUIDs).
- Example: In `Booking`, every attribute depends entirely on `booking_id`.
✅ Passed.

---

## Step 3 — Third Normal Form (3NF)
- Remove transitive dependencies (no attribute depends on another non-key attribute).

### Findings:
1. **Booking.total_price**  
   - This can be calculated as `pricepernight × number_of_nights`.  
   - Keeping it may seem redundant, but we keep it as a **snapshot** for auditing and reporting.  
   - ✅ Justified denormalization.

2. **Review table**  
   - Current design links `Review` directly to `User` and `Property`.  
   - Alternative: link `Review` to `Booking` instead (since each review comes from a booking).  
   - ✅ Either design is acceptable. Current spec is in 3NF, but note possible improvement.

3. No transitive dependencies found in other tables.

---

## Final Normalized Design
- **User(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)**
- **Property(property_id, host_id, name, description, location, pricepernight, created_at, updated_at)**
- **Booking(booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)**
- **Payment(payment_id, booking_id, amount, payment_date, payment_method)**
- **Review(review_id, property_id, user_id, rating, comment, created_at)**  
  (Option: connect to booking_id instead)
- **Message(message_id, sender_id, recipient_id, message_body, sent_at)**

✅ The database schema is in **3NF**.

