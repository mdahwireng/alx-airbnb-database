--=============================================================================================================
--a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
--=============================================================================================================

SELECT
    u.first_name,
    u.last_name,
    (CASE 
        WHEN b.total_bookings IS NULL THEN 0
        ELSE b.total_bookings
    END) AS total_bookings
FROM
    users AS u
LEFT JOIN
    (SELECT
        user_id,
        COUNT(*) AS total_bookings
    FROM
        bookings
    GROUP BY
        user_id) AS b 
    ON 
        u.user_id = b.user_id
ORDER BY
    total_bookings DESC,
    u.first_name ASC,
    u.last_name ASC;

--==================================================================================================================
-- a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
--==================================================================================================================

SELECT
    p.property_id,
    p.name,
    p.location,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_num,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank
FROM
    properties AS p
LEFT JOIN
    bookings AS b ON p.property_id = b.property_id
GROUP BY
    p.property_id, p.name, p.location
ORDER BY
    COUNT(b.booking_id) DESC,
    total_bookings DESC,
    p.name ASC;