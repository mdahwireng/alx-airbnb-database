# Airbnb Sample Data Population

## 📌 Objective

This script populates the Airbnb database with realistic sample data for testing and development purposes. The sample data spans across all major entities — including users, properties, bookings, payments, reviews, and messages — simulating common real-world interactions in a vacation rental platform.

---

## 🧱 Entities Covered

| Table      | Description |
|------------|-------------|
| `users`      | Registered guests and hosts |
| `properties` | Listings added by hosts |
| `bookings`   | Reservations made by guests |
| `payments`   | Payments associated with bookings |
| `reviews`    | User feedback for properties |
| `messages`   | Communication between users |

---

## 🧪 Sample Data Overview

- 4 users: 2 hosts and 2 guests
- 2 property listings
- 2 bookings (1 confirmed, 1 pending)
- 1 payment for a confirmed booking
- 2 reviews (1 per property)
- 2 message exchanges between a guest and a host

---

## ⚙️ Usage Instructions

1. Ensure the Airbnb database schema has already been created using the provided `schema.sql`.
2. Open your SQL client or terminal.
3. Execute the `sample_data.sql` file to insert data:

```bash
psql -U your_username -d your_database -f sample_data.sql
