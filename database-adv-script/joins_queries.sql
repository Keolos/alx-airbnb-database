
-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name,
    users.email
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

-- LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    properties.id AS property_id,
    properties.title,
    properties.location,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

-- FULL OUTER JOIN (PostgreSQL): Retrieve all users and all bookings
SELECT 
    users.id AS user_id,
    users.name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;

-- FULL OUTER JOIN (MySQL workaround using UNION)
SELECT 
    users.id AS user_id,
    users.name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id

UNION

SELECT 
    users.id AS user_id,
    users.name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM bookings
LEFT JOIN users ON users.id = bookings.user_id
    
-- LEFT JOIN: Retrieve all properties and their reviews, including properties without reviews
SELECT 
    properties.id AS property_id,
    properties.title,
    properties.location,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

    
    ;
