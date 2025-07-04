--======================================================================================================
-- query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
--======================================================================================================

SELECT 
    b.booking_id,  
    u.first_name, 
    u.last_name, 
    b.property_id, 
    b.start_date,
    b.end_date, 
    b.total_price, 
    b.status
FROM 
    bookings AS b
INNER JOIN 
    users AS u 
ON
    b.user_id = u.user_id
ORDER BY 
    b.start_date DESC;


--==================================================================================================================
-- a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
--==================================================================================================================

SELECT 
    p.property_id, 
    p.name, 
    p.location, 
    r.rating,
    r.comment,
    r.created_at
FROM 
    properties as p
LEFT JOIN 
    reviews as r
ON 
    p.property_id = r.property_id
ORDER BY 
    r.created_at DESC,
    p.name ASC;



--==================================================================================================================
-- a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking 
-- is not linked to a user.
--==================================================================================================================

SELECT
    b.booking_id,  
    u.first_name, 
    u.last_name, 
    b.property_id, 
    b.start_date,
    b.end_date, 
    b.total_price, 
    b.status,
    b.created_at
FROM
    bookings AS b
FULL OUTER JOIN 
    users AS u
ON 
    b.user_id = u.user_id
ORDER BY
    b.start_date DESC, 
    u.first_name ASC;