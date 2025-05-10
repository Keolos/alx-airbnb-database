# Airbnb-Style Database Schema

## Overview

This project defines a relational database schema for an Airbnb-style platform, supporting users (guests, hosts, admins), properties, bookings, payments, reviews, and user messaging. The schema is designed to ensure data integrity, scalability, and normalization up to the **Third Normal Form (3NF)**.

## Features

- **Users** can be guests, hosts, or admins.
- **Hosts** can list properties.
- **Guests** can book properties and make payments.
- **Guests** can leave reviews on properties.
- **Users** can exchange messages with each other.

---

## Database Entities

### 1. `User`
Stores user account details including authentication and roles.

| Column         | Type     | Constraints                    |
|----------------|----------|--------------------------------|
| user_id        | UUID     | Primary Key                   |
| first_name     | VARCHAR  | NOT NULL                      |
| last_name      | VARCHAR  | NOT NULL                      |
| email          | VARCHAR  | UNIQUE, NOT NULL              |
| password_hash  | VARCHAR  | NOT NULL                      |
| phone_number   | VARCHAR  | NULL                          |
| role           | ENUM     | guest, host, admin - NOT NULL |
| created_at     | TIMESTAMP| Default current timestamp     |

> 🔒 Email is indexed and must be unique.

---

### 2. `Property`
Details of listings created by hosts.

| Column         | Type      | Constraints                   |
|----------------|-----------|-------------------------------|
| property_id    | UUID      | Primary Key                   |
| host_id        | UUID      | Foreign Key → User(user_id)   |
| name           | VARCHAR   | NOT NULL                      |
| description    | TEXT      | NOT NULL                      |
| location       | VARCHAR   | NOT NULL                      |
| pricepernight  | DECIMAL   | NOT NULL                      |
| created_at     | TIMESTAMP | Default current timestamp     |
| updated_at     | TIMESTAMP | Updates on modification       |

---

### 3. `Booking`
Represents a guest's reservation of a property.

| Column       | Type     | Constraints                           |
|--------------|----------|----------------------------------------|
| booking_id   | UUID     | Primary Key                           |
| property_id  | UUID     | Foreign Key → Property(property_id)    |
| user_id      | UUID     | Foreign Key → User(user_id)           |
| start_date   | DATE     | NOT NULL                              |
| end_date     | DATE     | NOT NULL                              |
| total_price  | DECIMAL  | NOT NULL                              |
| status       | ENUM     | pending, confirmed, canceled - NOT NULL |
| created_at   | TIMESTAMP| Default current timestamp              |

---

### 4. `Payment`
Tracks payments linked to bookings.

| Column        | Type     | Constraints                         |
|---------------|----------|--------------------------------------|
| payment_id    | UUID     | Primary Key                         |
| booking_id    | UUID     | Foreign Key → Booking(booking_id)   |
| amount        | DECIMAL  | NOT NULL                            |
| payment_date  | TIMESTAMP| Default current timestamp           |
| payment_method| ENUM     | credit_card, paypal, stripe - NOT NULL |

---

### 5. `Review`
User-submitted feedback on properties.

| Column     | Type     | Constraints                            |
|------------|----------|-----------------------------------------|
| review_id  | UUID     | Primary Key                            |
| property_id| UUID     | Foreign Key → Property(property_id)     |
| user_id    | UUID     | Foreign Key → User(user_id)            |
| rating     | INTEGER  | CHECK (1 <= rating <= 5), NOT NULL     |
| comment    | TEXT     | NOT NULL                               |
| created_at | TIMESTAMP| Default current timestamp              |

---

### 6. `Message`
Private messages between users.

| Column        | Type     | Constraints                         |
|---------------|----------|--------------------------------------|
| message_id    | UUID     | Primary Key                         |
| sender_id     | UUID     | Foreign Key → User(user_id)         |
| recipient_id  | UUID     | Foreign Key → User(user_id)         |
| message_body  | TEXT     | NOT NULL                            |
| sent_at       | TIMESTAMP| Default current timestamp           |

---

## Indexes

- ✅ `User.email` — For quick lookup and login verification.
- ✅ `Booking.property_id`, `Booking.user_id` — Optimized for join operations.
- ✅ `Payment.booking_id` — For join and lookup efficiency.

---

## Getting Started

1. Clone the repository or copy the SQL file.
2. Run the `schema.sql` script in your preferred SQL engine (PostgreSQL, MySQL with compatible ENUM support, etc.)
3. Populate tables with your application data or use dummy data for testing.

```bash
psql -U your_user -d your_db -f schema.sql
