# Airbnb Database Seed Data

## Overview

This file (`seed.sql`) contains SQL `INSERT` statements to populate the Airbnb-style relational database with **sample data** for development and testing. The data reflects realistic usage patterns including:

- Multiple users (guests and hosts)
- Listed properties
- Active bookings
- Completed payments
- User-submitted reviews
- Private messages between users

---

## Contents

The script inserts data into the following tables:

| Table      | Description                               |
|------------|-------------------------------------------|
| `User`     | 3 sample users (1 host, 2 guests)         |
| `Property` | 2 properties listed by the host           |
| `Booking`  | 2 bookings: 1 confirmed, 1 pending        |
| `Payment`  | Payment record for a confirmed booking    |
| `Review`   | Guest reviews with ratings and comments   |
| `Message`  | Sample messages between users             |

---

## Usage

To populate your database with the sample data:

1. Ensure the database schema is already created using `schema.sql`.
2. Run the `seed.sql` script in your database CLI or client.

Example using PostgreSQL:

```bash
psql -U your_user -d your_database -f seed.sql
