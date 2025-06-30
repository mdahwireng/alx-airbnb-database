# Airbnb Database Schema Definition

## 📌 Objective
This project defines a relational database schema for an Airbnb-like platform. The goal is to implement a normalized and efficient data structure using SQL `CREATE TABLE` statements, incorporating appropriate constraints, indexes, and relationships to support core features such as user management, property listings, bookings, reviews, messaging, and payments.

---

## 📐 Entities and Relationships

The database consists of the following main entities:

| Entity   | Description |
|----------|-------------|
| `users`      | Stores all registered users (guests, hosts, and admins). |
| `properties` | Listings added by hosts, available for booking. |
| `bookings`   | Reservations made by users on properties. |
| `payments`   | Payment information for bookings. |
| `reviews`    | User-submitted reviews on properties. |
| `messages`   | Communication between users. |

---

## 🧩 Schema Highlights

- **UUIDs** used for all primary keys to ensure global uniqueness.
- **Foreign keys** with `ON DELETE CASCADE` for referential integrity.
- **CHECK constraints** to enforce valid ENUM-like fields (e.g., `status`, `role`, `rating`).
- **Indexes** created on:
  - `email` (for quick user lookup)
  - Foreign key columns (`host_id`, `property_id`, `booking_id`, etc.)

---

## 🗃️ Normalization

The schema adheres to **Third Normal Form (3NF)**:
- All attributes contain atomic values (1NF).
- No partial dependencies on composite keys (2NF).
- No transitive dependencies between non-key attributes (3NF).

Refer to the [Normalization Report](#) (add link if applicable) for detailed justification.

---

## 📄 Files

| File | Description |
|------|-------------|
| `schema.sql` | SQL script to create all tables and constraints. |
| `README.md` | This documentation file. |
---

## 🛠️ Usage

1. Open your preferred SQL environment (PostgreSQL, MySQL, etc.).
2. Run the `schema.sql` file to initialize the database schema.
3. Connect your backend or ORM to start using the tables.

---


