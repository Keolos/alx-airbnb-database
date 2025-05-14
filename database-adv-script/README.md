# SQL JOIN Queries – ALX Airbnb Database Module

This file contains SQL queries demonstrating the use of various types of JOINs, written as part of the ALX Airbnb Database Module. These queries showcase how to retrieve and analyze data across related tables such as users, bookings, properties, and reviews.

## 📌 Objectives

- Master SQL JOIN operations.
- Retrieve meaningful relationships between entities in the Airbnb schema.
- Understand how to handle missing data using LEFT and FULL OUTER JOINs.

## 🧠 Queries Included

1. **INNER JOIN: Bookings and Users**
   - Retrieves all bookings along with the users who made them.
   - Ensures only bookings with an associated user are included.

2. **LEFT JOIN: Properties and Reviews**
   - Retrieves all properties and any related reviews.
   - Includes properties that do not have any reviews.

3. **FULL OUTER JOIN: Users and Bookings**
   - Retrieves all users and all bookings, including:
     - Users without bookings.
     - Bookings not linked to a user.
   - Note: A workaround using `UNION` is provided for MySQL.

## 🛠️ File

- `joins_queries.sql`: Contains all the SQL JOIN statements.

## 🧪 Usage

To run the queries:
1. Load your Airbnb database.
2. Execute the queries using your SQL client or CLI (e.g., `psql`, `mysql`, or a GUI like DBeaver or pgAdmin).

## 💡 Notes

- Replace table or column names if your schema differs.
- FULL OUTER JOIN requires PostgreSQL. If using MySQL, use the provided UNION workaround.

