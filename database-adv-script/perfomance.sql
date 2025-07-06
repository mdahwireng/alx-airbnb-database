--==================================================================================================
-- query that retrieves all bookings along with the user details, property details, and payment details
--==================================================================================================

SELECT
    b.booking_id,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM
    bookings AS b
INNER JOIN
    users AS u ON b.user_id = u.user_id
INNER JOIN
    properties AS p ON b.property_id = p.property_id
LEFT JOIN       
    payments AS pay ON b.booking_id = pay.booking_id
ORDER BY
    b.start_date DESC,
    u.first_name ASC,
    u.last_name ASC,
    p.name ASC;         

--================================
-- Explain the query
--================================

EXPLAIN ANALYZE
SELECT
    b.booking_id,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM
    bookings AS b
INNER JOIN
    users AS u ON b.user_id = u.user_id
INNER JOIN
    properties AS p ON b.property_id = p.property_id
LEFT JOIN       
    payments AS pay ON b.booking_id = pay.booking_id
ORDER BY
    b.start_date DESC,
    u.first_name ASC,
    u.last_name ASC,
    p.name ASC;         

