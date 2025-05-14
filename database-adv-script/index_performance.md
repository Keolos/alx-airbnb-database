# Index Optimization and Performance Analysis

## Objective

This document explains the process of identifying high-usage columns within the `User`, `Booking`, and `Property` tables in the Airbnb database. It includes the creation of indexes on these columns and the measurement of query performance before and after indexing. The goal is to improve query performance by reducing table scans and speeding up joins and sorting operations.

## High-Usage Columns Identified

### User Table
- **id**: Used in JOIN operations and filtering.
- **email**: Frequently used in filtering during login or registration.

### Booking Table
- **user_id**: Commonly used in JOIN operations and filtering.
- **property_id**: Frequently used in JOIN operations and filtering.
- **date**: Used for sorting and filtering based on date ranges.

### Property Table
- **id**: Frequently used in JOIN operations.
- **location**: Used for filtering and sorting properties based on location.
- **price**: Used in filtering and sorting properties by price.

## SQL Index Creation

The following indexes have been created for the high-usage columns:

```sql
-- Create an index on the 'id' column in the 'users' table
CREATE INDEX idx_users_id ON users(id);

-- Create an index on the 'email' column in the 'users' table
CREATE INDEX idx_users_email ON users(email);

-- Create an index on the 'user_id' column in the 'bookings' table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create an index on the 'property_id' column in the 'bookings' table
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create an index on the 'date' column in the 'bookings' table for faster sorting and range queries
CREATE INDEX idx_bookings_date ON bookings(date);

-- Create an index on the 'id' column in the 'properties' table
CREATE INDEX idx_properties_id ON properties(id);

-- Create an index on the 'location' column in the 'properties' table
CREATE INDEX idx_properties_location ON properties(location);

-- Create an index on the 'price' column in the 'properties' table for sorting and filtering
CREATE INDEX idx_properties_price ON properties(price);
