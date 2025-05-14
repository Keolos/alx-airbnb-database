# 📊 Airbnb Database Performance Monitoring and Optimization Report

## 🧠 Objective

Continuously monitor and refine the database performance of the Airbnb system by analyzing query execution plans, identifying bottlenecks, and applying schema optimizations to improve speed, scalability, and resource efficiency.

---

## 🗃️ Monitored Queries

### 1. User Booking History with Property Details

```sql
EXPLAIN ANALYZE
SELECT u.id AS user_id, u.name, b.id AS booking_id, p.title AS property_title, b.start_date, b.end_date
FROM users u
JOIN bookings b ON u.id = b.user_id
JOIN properties p ON b.property_id = p.id
WHERE b.status = 'confirmed'
ORDER BY b.start_date DESC;
