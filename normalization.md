# Airbnb Database Normalization to 3NF

## Objective
Apply normalization principles to ensure the Airbnb database schema is in Third Normal Form (3NF), removing redundancy and improving data integrity.

---

## 1. First Normal Form (1NF)

**Definition:** Eliminate repeating groups and ensure atomicity (each field contains only one value).

### ✅ Compliance:
- All attributes are atomic (e.g., one email per user, one phone number per record).
- No repeating groups in any table.
- Each table has a primary key.

---

## 2. Second Normal Form (2NF)

**Definition:** Meet 1NF and remove partial dependencies (non-key attributes should depend on the whole primary key).

### ✅ Compliance:
- All tables with composite keys (none here) would be checked for partial dependencies.
- Every non-key attribute in each table depends entirely on the primary key:
  - `Booking`: `total_price`, `start_date`, etc., depend on `booking_id`.
  - `Property`: `description`, `location`, etc., depend on `property_id`.

---

## 3. Third Normal Form (3NF)

**Definition:** Meet 2NF and remove transitive dependencies (non-key attributes must depend only on the primary key, not on other non-key attributes).

### 🎯 Review of Potential Issues:

#### ✅ User Table:
- `email`, `role`, and `phone_number` are not derived from any other non-key.
- No transitive dependencies.

#### ✅ Property Table:
- `host_id` is a foreign key, not a transitive dependency.
- All attributes are specific to a property (`location`, `pricepernight`, etc.).

#### ✅ Booking Table:
- `user_id` and `property_id` are foreign keys.
- `total_price` is derived, but acceptable to store for historical pricing; no normalization issue if pricing can change over time.

#### ✅ Payment Table:
- Fully dependent on `booking_id`, no transitive dependency.
- `payment_method` is atomic (ENUM), so normalized.

#### ✅ Review Table:
- `rating`, `comment` depend directly on the primary key `review_id`.

#### ✅ Message Table:
- Self-referencing foreign keys are legitimate.
- No transitive dependencies.

---

## Conclusion

The database schema is already in **Third Normal Form (3NF)**:
- All tables have primary keys.
- All attributes are atomic and fully functionally dependent on the whole key.
- There are no transitive dependencies.

No changes are necessary to achieve 3NF.

---

## Notes
If performance or historical tracking needs dictate, denormalized fields (e.g., storing `total_price` or `host_name`) may be acceptable but should be documented clearly.
