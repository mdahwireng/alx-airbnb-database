--==============================================================================
--partitioning on the Booking table based on the start_date column
--==============================================================================

-- alter table bookings

ALTER TABLE bookings RENAME TO bookings_old;

CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_bookings_property
        FOREIGN KEY (property_id) REFERENCES properties(property_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_bookings_user
        FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
) PARTITION BY RANGE (start_date);

-- Create partitions for each year
CREATE TABLE bookings_2023 PARTITION OF bookings FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
CREATE TABLE bookings_2024 PARTITION OF bookings FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE bookings_2025 PARTITION OF bookings FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Insert existing data into the new partitioned table
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
SELECT booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
FROM bookings_old;

-- Explain anlyze query from old table and compare with new partitioned table


-- from new table

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
WHERE
    b.status IN ('confirmed', 'completed', 'pending', 'canceled') AND
    p.name IS NOT NULL
ORDER BY
    b.start_date DESC,
    u.first_name ASC,
    u.last_name ASC,
    p.name ASC;


-- old table
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
    bookings_old AS b   
INNER JOIN
    users AS u ON b.user_id = u.user_id
INNER JOIN
    properties AS p ON b.property_id = p.property_id
LEFT JOIN
    payments AS pay ON b.booking_id = pay.booking_id
WHERE
    b.status IN ('confirmed', 'completed', 'pending', 'canceled') AND
    p.name IS NOT NULL
ORDER BY
    b.start_date DESC,
    u.first_name ASC,
    u.last_name ASC,
    p.name ASC;


-- Drop the old table after migration
DROP TABLE bookings_old;
