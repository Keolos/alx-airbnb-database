-- Find the total number of bookings made by each user and rank properties based on the number of bookings

-- Total Bookings by Users
WITH UserBookings AS (
    SELECT 
        u.id AS user_id,
        u.name,
        COUNT(b.id) AS total_bookings
    FROM users u
    LEFT JOIN bookings b ON u.id = b.user_id
    GROUP BY u.id
    HAVING COUNT(b.id) > 3  -- Only show users with more than 3 bookings
),

-- Ranking Properties by Bookings
PropertyRankings AS (
    SELECT 
        p.id AS property_id,
        p.title,
        p.location,
        COUNT(b.id) AS total_bookings,
        RANK() OVER (PARTITION BY p.location ORDER BY COUNT(b.id) DESC) AS booking_rank,
        ROW_NUMBER() OVER (PARTITION BY p.location ORDER BY COUNT(b.id) DESC) AS row_number_rank
    FROM properties p
    LEFT JOIN bookings b ON p.id = b.property_id
    GROUP BY p.id, p.location
)

-- Final Output: Select from both the UserBookings and PropertyRankings CTEs
SELECT 
    ub.user_id,
    ub.name AS user_name,
    ub.total_bookings AS user_total_bookings,
    pr.property_id,
    pr.title AS property_title,
    pr.location AS property_location,
    pr.total_bookings AS property_total_bookings,
    pr.booking_rank,
    pr.row_number_rank
FROM UserBookings ub
CROSS JOIN PropertyRankings pr
ORDER BY ub.user_total_bookings DESC, pr.booking_rank;
