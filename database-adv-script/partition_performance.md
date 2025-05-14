# Partitioning Report: Optimizing Large Booking Table Queries

## Objective
The objective of this task was to improve query performance on a large `Booking` table by implementing table partitioning. Since frequent queries rely on `start_date` (e.g., for date range filtering), we used **RANGE partitioning** on the `start_date` column.

---

## Strategy Used

1. **Partitioning Type**: `RANGE`
2. **Partition Key**: `start_date`
3. **Partition Intervals**: Quarterly partitions for the year 2024:
   - `bookings_2024_q1`: Jan–Mar
   - `bookings_2024_q2`: Apr–Jun
   - `bookings_2024_q3`: Jul–Sep
   - `bookings_2024_q4`: Oct–Dec
4. **Indexing**: Indexes were applied on `user_id` within each partition to speed up user-based filtering.

---

## Query Tested

```sql
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-04-01' AND '2024-06-30';

