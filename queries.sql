-- Retrieve booking information along with Customer name and Vehicle name.
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

-- Find all vehicles that have never been booked.
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

-- Retrieve all available vehicles of a specific type (e.g. cars).
SELECT
  *
FROM
  vehicles
WHERE
  type = 'car'
  AND status = 'available';

-- Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.
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