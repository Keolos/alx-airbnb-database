# Query Optimization Report

## Objective

The objective of this optimization was to refactor an initial SQL query that retrieves all bookings along with the respective user details, property details, and payment details. The goal was to improve the query performance using techniques such as indexing, query refactoring, and filtering, followed by performance analysis using `EXPLAIN` and query optimization strategies.

---

## Initial Query

The initial query retrieved all bookings along with user, property, and payment details using `INNER JOIN`:

```sql
SELECT 
    b.id AS booking_id,
    u.id AS user_id,
    u.email AS user_email,
    p.id AS property_id,
    p.location AS property_location,
    p.price AS property_price,
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
