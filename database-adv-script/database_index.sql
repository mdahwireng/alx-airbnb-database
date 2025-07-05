--=======================================================
--SQL CREATE INDEX commands to create appropriate indexes
--=======================================================

-- analyze before running this script to ensure the database is optimized for performance

EXPLAIN ANALYZE
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

-- Indexes for 'users' table
CREATE INDEX idx_users_email ON users(email);

-- Indexes for 'bookings' table
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_created_at ON bookings (created_at);

-- Indexes for 'properties' table
CREATE INDEX idx_properties_name ON properties (name);
CREATE INDEX idx_properties_location ON properties (location);
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- Indexes for 'reviews' table
CREATE INDEX idx_reviews_property_id ON reviews (property_id);
CREATE INDEX idx_reviews_rating ON reviews (rating);
CREATE INDEX idx_reviews_created_at ON reviews (created_at DESC);
CREATE INDEX idx_reviews_prop_id_created_at ON reviews (property_id, created_at DESC);


-- analyze after running this script to ensure the database is optimized for performance

EXPLAIN ANALYZE
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