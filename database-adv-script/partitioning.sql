-- Step 1: Backup existing Booking table (if needed)
CREATE TABLE bookings_backup AS TABLE bookings;

-- Step 2: Drop existing Booking table if it exists
DROP TABLE IF EXISTS bookings CASCADE;

-- Step 3: Create partitioned table structure
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
) PARTITION BY RANGE (start_date);

-- Step 4: Create partitions (by quarter for year 2024 as example)
CREATE TABLE bookings_2024_q1 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

CREATE TABLE bookings_2024_q2 PARTITION OF bookings
    FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

CREATE TABLE bookings_2024_q3 PARTITION OF bookings
    FOR VALUES FROM ('2024-07-01') TO ('2024-10-01');

CREATE TABLE bookings_2024_q4 PARTITION OF bookings
    FOR VALUES FROM ('2024-10-01') TO ('2025-01-01');

-- Step 5: Index critical columns in each partition
CREATE INDEX idx_bookings_q1_user_id ON bookings_2024_q1(user_id);
CREATE INDEX idx_bookings_q2_user_id ON bookings_2024_q2(user_id);
CREATE INDEX idx_bookings_q3_user_id ON bookings_2024_q3(user_id);
CREATE INDEX idx_bookings_q4_user_id ON bookings_2024_q4(user_id);

-- Step 6: Insert sample data (if migrating from backup)
-- INSERT INTO bookings (...) SELECT ... FROM bookings_backup WHERE ...;

-- Step 7: Test query for performance
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-04-01' AND '2024-06-30';
