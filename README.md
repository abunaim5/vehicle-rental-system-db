# Vehicle Rental System – Database Design & SQL Queries

## Overview

This project focuses on designing and querying a simplified **Vehicle Rental System** database. The objective is to demonstrate a clear understanding of relational database design, entity relationships, and practical SQL querying techniques used in real-world systems.

The repository contains structured SQL queries that solve common business problems such as retrieving booking details, identifying unused vehicles, filtering available inventory, and analyzing booking frequency.

This project is suitable for academic evaluation and database fundamentals practice.

## Objectives

* Design a relational database structure for a vehicle rental system
* Apply SQL concepts including JOIN, EXISTS, WHERE, GROUP BY, and HAVING
* Write clean, readable, and optimized SQL queries
* Solve real-world data retrieval and analysis problems

## Database Context

The system is based on the following core entities:

* **Users**: Customers who rent vehicles
* **Vehicles**: Vehicles available for rent
* **Bookings**: Records that associate users with vehicles over a rental period

Relationships:

* A user can have multiple bookings
* A vehicle can be booked multiple times
* Each booking is associated with one user and one vehicle

## SQL Queries and Solutions

This section documents all required SQL queries along with their complete solutions. Each query addresses a specific business requirement of the Vehicle Rental System database.

### Query 1: Retrieve booking information along with Customer name and Vehicle name

**Purpose:**
Retrieve booking records along with the corresponding customer name and vehicle name.

**SQL Concepts Used:**
INNER JOIN

**Solution:**

```sql
SELECT
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  start_date,
  end_date,
  b.status
FROM
  bookings AS b
  INNER JOIN users AS u ON b.user_id = u.user_id
  INNER JOIN vehicles AS v ON b.vehicle_id = v.vehicle_id;
```

### Query 2: Find all vehicles that have never been booked

**Purpose:**
Identify vehicles that do not appear in any booking record.

**SQL Concepts Used:**
NOT EXISTS

**Solution:**

```sql
SELECT
  *
FROM
  vehicles AS v
WHERE
  NOT EXISTS (
    SELECT
      vehicle_id
    FROM
      bookings
    WHERE
      vehicle_id = v.vehicle_id
  );
```

### Query 3: Retrieve all available vehicles of a specific type

**Purpose:**
Retrieve all vehicles that are currently available and belong to a specific type such as cars.

**SQL Concepts Used:**
SELECT, WHERE

**Solution:**

```sql
SELECT
  *
FROM
  vehicles
WHERE
  type = 'car'
  AND status = 'available';
```

### Query 4: Find vehicles with more than two bookings

**Purpose:**
Find the total number of bookings for each vehicle and display only those vehicles that have been booked more than two times.

**SQL Concepts Used:**
GROUP BY, HAVING, COUNT

**Solution:**

```sql
SELECT
  v.name AS vehicle_name,
  COUNT(*) AS total_bookings
FROM
  bookings AS b
  INNER JOIN vehicles AS v ON b.vehicle_id = v.vehicle_id
GROUP BY
  b.vehicle_id,
  v.name
HAVING
  COUNT(*) > 2;
```

## How to Use

1. Create the required database tables based on the schema
2. Insert sample data into `users`, `vehicles`, and `bookings` tables
3. Execute the queries using a PostgreSQL-compatible client
4. Review the results to verify query behavior

## Conclusion

This project demonstrates fundamental database skills including relational design and effective SQL querying. It reflects common data access patterns used in backend systems and provides a solid foundation for more advanced database-driven applications.
