-- Initial Query: Fetch all booking details with associated user, property, and payment information

-- ❗ This query may be slow if indexes are missing or the tables are large

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

-- Performance Analysis: Use EXPLAIN ANALYZE to understand execution plan

EXPLAIN ANALYZE
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

-- Inefficiencies Identified:
-- 1. Full table scans due to missing indexes on booking.user_id, booking.property_id, payment.booking_id
-- 2. No filter conditions (e.g., on date or status), causing a scan of the entire dataset
-- 3. Inefficient ORDER BY on unindexed column (b.start_date)

-- ✅ Suggested Indexes to Improve Performance

CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings(start_date);

-- ✅ Refactored Optimized Query (e.g., retrieve recent year and confirmed bookings)

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.title AS property_title,
    pay.id AS payment_id,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE b.status = 'confirmed'
AND b.start_date >= CURRENT_DATE - INTERVAL '1 year'
ORDER BY b.start_date DESC
LIMIT 100;
