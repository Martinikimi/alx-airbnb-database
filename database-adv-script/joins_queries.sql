/*
 joins_queries.sql
 ALX - Advanced Querying: joins examples
 - Location: database-adv-script/joins_queries.sql
 - Purpose: demonstrate INNER JOIN, LEFT JOIN (with aggregated example) and FULL OUTER JOIN
 - Assumes common table names: users, bookings, properties, reviews
 - PostgreSQL syntax is used; MySQL alternatives noted below.
*/

/* 1) INNER JOIN
   Retrieve all bookings and the user who made each booking.
   (Only bookings that are linked to a valid user will appear.)
*/
-- PostgreSQL example:
SELECT
  b.id                      AS booking_id,
  b.property_id,
  b.user_id                 AS booking_user_id,
  b.check_in,
  b.check_out,
  b.status                  AS booking_status,
  u.id                      AS user_id,
  u.name                    AS user_name,
  u.email                   AS user_email
FROM bookings b
INNER JOIN users u
  ON b.user_id = u.id
ORDER BY b.check_in DESC;

/* 2) LEFT JOIN
   Retrieve all properties and their reviews; properties with no reviews will still appear.
   First: simple row-level LEFT JOIN (one row per review or NULLs when none).
*/
SELECT
  p.id            AS property_id,
  p.title,
  p.location,
  r.id            AS review_id,
  r.user_id       AS reviewer_id,
  r.rating,
  r.comment
FROM properties p
LEFT JOIN reviews r
  ON p.id = r.property_id
ORDER BY p.id;

/* 2b) LEFT JOIN - Aggregated (PostgreSQL)
   Group reviews into a JSON array per property. Properties with no reviews get an empty array.
*/
SELECT
  p.id            AS property_id,
  p.title,
  p.location,
  COALESCE(
    json_agg(r) FILTER (WHERE r.id IS NOT NULL),
    '[]'::json
  )                AS reviews
FROM properties p
LEFT JOIN reviews r
  ON p.id = r.property_id
GROUP BY p.id, p.title, p.location
ORDER BY p.id;


/* 3) FULL OUTER JOIN
   Retrieve all users and all bookings, even when a booking has no user or a user has no booking.
   PostgreSQL supports FULL OUTER JOIN directly.
*/
-- PostgreSQL example:
SELECT
  u.id            AS user_id,
  u.name          AS user_name,
  b.id            AS booking_id,
  b.property_id,
  b.check_in,
  b.check_out,
  b.status        AS booking_status
FROM users u
FULL OUTER JOIN bookings b
  ON u.id = b.user_id
ORDER BY COALESCE(b.check_in, '1900-01-01') DESC NULLS LAST;

/*
 MySQL note: MySQL (pre-8/depending on engine) does NOT support FULL OUTER JOIN directly.
 Alternative using UNION of LEFT + RIGHT (removes duplicates with UNION):
*/
-- MySQL-compatible alternative:
SELECT
  u.id            AS user_id,
  u.name          AS user_name,
  b.id            AS booking_id,
  b.property_id,
  b.check_in,
  b.check_out,
  b.status        AS booking_status
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
UNION
SELECT
  u.id            AS user_id,
  u.name          AS user_name,
  b.id            AS booking_id,
  b.property_id,
  b.check_in,
  b.check_out,
  b.status        AS booking_status
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id;

