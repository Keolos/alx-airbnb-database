# 📊 Optimization Report: Booking System Query

## 📌 Objective

To identify performance bottlenecks in a complex SQL query that retrieves all booking data along with related user, property, and payment details, analyze it using `EXPLAIN ANALYZE`, and implement optimizations to improve query performance and scalability.

---

## 🧾 Initial Query

The original query retrieves all booking information, including details from the `users`, `properties`, and `payments` tables.

```sql
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.payment_date,
    pay.status AS payment_status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
ORDER BY b.start_date DESC;
