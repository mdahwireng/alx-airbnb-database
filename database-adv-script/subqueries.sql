--==============================================================================================
-- a query to find all properties where the average rating is greater than 4.0 using a subquery.
--==============================================================================================

SELECT  
	p.property_id, 
    p.name, 
    p.location,
	g_rating.rating
FROM 
    properties as p
INNER JOIN 
(SELECT 
    property_id,
	AVG (rating) AS rating
FROM
	reviews
GROUP BY
	property_id
HAVING 
	AVG (rating) > 4
) AS g_rating
ON 
	p.property_id = g_rating.property_id;


--========================================================================
-- a correlated subquery to find users who have made more than 3 bookings.
--========================================================================

SELECT  
	u.first_name, 
    u.last_name,
	(SELECT 
	COUNT(*) AS booking_counts
FROM
	bookings AS b
WHERE u.user_id = b.user_id
) 
FROM 
    users as u
WHERE 
	(SELECT 
	COUNT(*) AS booking_counts
FROM
	bookings AS b
WHERE u.user_id = b.user_id
) > 3
ORDER BY
	booking_counts DESC,
	first_name ASC;
	