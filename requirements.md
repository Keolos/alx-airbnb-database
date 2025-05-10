# 🧱 Entities and Attributes
1. User
Primary Key: user_id (UUID)

Attributes:

first_name, last_name, email, password_hash, phone_number

role (ENUM: guest, host, admin)

created_at

2. Property
Primary Key: property_id (UUID)

Foreign Key: host_id → User(user_id)

Attributes:

name, description, location, pricepernight

created_at, updated_at

3. Booking
Primary Key: booking_id (UUID)

Foreign Keys:

property_id → Property(property_id)

user_id → User(user_id)

Attributes:

start_date, end_date, total_price, status

created_at

4. Payment
Primary Key: payment_id (UUID)

Foreign Key: booking_id → Booking(booking_id)

Attributes:

amount, payment_date, payment_method

5. Review
Primary Key: review_id (UUID)

Foreign Keys:

property_id → Property(property_id)

user_id → User(user_id)

Attributes:

rating (1–5, with constraint), comment, created_at

6. Message
Primary Key: message_id (UUID)

Foreign Keys:

sender_id → User(user_id)

recipient_id → User(user_id)

Attributes:

message_body, sent_at

# 🔁 Relationships
User 1:N Property (one host can own many properties)

User 1:N Booking (one guest can have many bookings)

Property 1:N Booking (one property can be booked multiple times)

Booking 1:1 Payment (each booking has one payment)

Property 1:N Review

User 1:N Review (as reviewer)

User 1:N Message (as sender)

User 1:N Message (as recipient)
