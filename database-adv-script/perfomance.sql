-- performance.sql

-- Initial Query: Retrieving all bookings along with user, property, and payment details
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

-- Refactored Query: With possible optimizations (indexing, LEFT JOIN, WHERE clause for filtering)
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
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.date >= '2024-01-01';  -- Example filter to limit bookings by date
