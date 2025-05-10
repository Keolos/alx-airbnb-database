# Entities and Attributes
  ## User
    Primary Key: user_id
    Attributes: first_name, last_name, email (unique, indexed), password_hash, phone_number, role (ENUM), created_at
  ## Property
    Primary Key: property_id
    Foreign Key: host_id → User(user_id)
    Attributes: name, description, location, pricepernight, created_at, updated_at
  ## Booking
    Primary Key: booking_id
    Foreign Keys:
      property_id → Property(property_id)
      user_id → User(user_id)
    Attributes: start_date, end_date, total_price, status (ENUM), created_at
  ## Payment
    Primary Key: payment_id
    Foreign Key: booking_id → Booking(booking_id)
    Attributes: amount, payment_date, payment_method (ENUM)
  ## Review
    Primary Key: review_id
    Foreign Keys:
    property_id → Property(property_id)
    user_id → User(user_id)
    Attributes: rating (1–5), comment, created_at
 ## Message
    Primary Key: message_id
    Foreign Keys:
    sender_id → User(user_id)
    recipient_id → User(user_id)
    Attributes: message_body, sent_at

    
# Relationships and Cardinalities
  ## User to Property:
    One user (host) can have many properties → 1:N
    User.user_id → Property.host_id

  ## User to Booking:
    One user (guest) can make many bookings → 1:N
    User.user_id → Booking.user_id

  ## User to Review:
    One user can write many reviews → 1:N
    User.user_id → Review.user_id

  ## User to Message (self-referencing):
    One user can send/receive many messages → 1:N, N:1
    User.user_id → Message.sender_id, Message.recipient_id

  ## Property to Booking:
    One property can have many bookings → 1:N
    Property.property_id → Booking.property_id

  ## Property to Review:
    One property can have many reviews → 1:N
    Property.property_id → Review.property_id

  ## Booking to Payment:
    One booking has one payment → 1:1
    Booking.booking_id → Payment.booking_id

