# Airbnb Database Normalization Report

## Objective
Ensure that the Airbnb database schema complies with the principles of **Third Normal Form (3NF)** to eliminate redundancy and promote data integrity.

---

## Step 1: First Normal Form (1NF)

### Rules:
- Atomic values only (no multivalued or composite attributes).
- Each record must be unique and identified by a primary key.

### Compliance:
✅ All tables have primary keys (UUIDs) and attributes contain atomic values.  
✅ No repeating groups or arrays.

**Conclusion:** The schema satisfies **1NF**.

---

## Step 2: Second Normal Form (2NF)

### Rules:
- Be in 1NF.
- No partial dependency on a **composite primary key** (i.e., all non-key attributes depend on the entire key).

### Compliance:
✅ All tables use **single-attribute primary keys (UUIDs)**.  
✅ All non-key attributes are fully functionally dependent on the primary key.

**Conclusion:** The schema satisfies **2NF**.

---

## Step 3: Third Normal Form (3NF)

### Rules:
- Be in 2NF.
- No **transitive dependencies** (non-key attributes should not depend on other non-key attributes).

---

### Table-by-Table Review

#### **User**
- All attributes depend only on `user_id`.
- `role` is stored as an ENUM to avoid a lookup table unless roles expand in complexity (e.g., permissions).

✅ Complies with 3NF.

---

#### **Property**
- Each property belongs to a host (`host_id`) who is a `User`.
- All other attributes (`name`, `description`, etc.) depend only on `property_id`.

✅ Complies with 3NF.

---

#### **Booking**
- Each booking references a user and a property.
- `total_price` is derived but stored likely for historical pricing.
- `status` is atomic and relates directly to the booking.

🟡 *Note:* If `total_price` is always calculated from `pricepernight` × nights, then it could be considered redundant. If prices change over time or discounts apply, storing `total_price` is justified.

✅ Acceptable in 3NF with justification.

---

#### **Payment**
- Payment depends only on `booking_id`.
- `amount` and `payment_method` are atomic and relevant to the payment only.

✅ Complies with 3NF.

---

#### **Review**
- Reviews are associated with both `property_id` and `user_id`.
- `rating` and `comment` relate only to the `review_id`.

✅ Complies with 3NF.

---

#### **Message**
- Each message has a sender and recipient (`sender_id`, `recipient_id`).
- `message_body` is atomic and tied to `message_id`.

✅ Complies with 3NF.

---