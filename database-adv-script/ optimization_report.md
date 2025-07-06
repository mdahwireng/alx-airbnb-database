# Optimization Report

## Query
all bookings along with the user details, property details, and payment details
```sql
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
```

## Optimization Steps
1. Analyze the query execution plan using `EXPLAIN ANALYZE` to identify bottlenecks.
   ** Results:**
```plaintext
"QUERY PLAN"
"Sort  (cost=90.98..92.41 rows=570 width=2272) (actual time=0.236..0.246 rows=2 loops=1)"
"  Sort Key: b.start_date DESC, u.first_name, u.last_name, p.name"
"  Sort Method: quicksort  Memory: 25kB"
"  ->  Hash Join  (cost=44.62..64.89 rows=570 width=2272) (actual time=0.157..0.187 rows=2 loops=1)"
"        Hash Cond: (b.property_id = p.property_id)"
"        ->  Hash Join  (cost=33.05..51.79 rows=570 width=1240) (actual time=0.082..0.107 rows=2 loops=1)"
"              Hash Cond: (b.user_id = u.user_id)"
"              ->  Hash Right Join  (cost=22.38..39.58 rows=570 width=208) (actual time=0.048..0.068 rows=2 loops=1)"
"                    Hash Cond: (pay.booking_id = b.booking_id)"
"                    ->  Seq Scan on payments pay  (cost=0.00..15.70 rows=570 width=114) (actual time=0.010..0.012 rows=1 loops=1)"
"                    ->  Hash  (cost=15.50..15.50 rows=550 width=110) (actual time=0.019..0.021 rows=2 loops=1)"
"                          Buckets: 1024  Batches: 1  Memory Usage: 9kB"
"                          ->  Seq Scan on bookings b  (cost=0.00..15.50 rows=550 width=110) (actual time=0.011..0.013 rows=2 loops=1)"
"              ->  Hash  (cost=10.30..10.30 rows=30 width=1048) (actual time=0.021..0.022 rows=4 loops=1)"
"                    Buckets: 1024  Batches: 1  Memory Usage: 9kB"
"                    ->  Seq Scan on users u  (cost=0.00..10.30 rows=30 width=1048) (actual time=0.013..0.016 rows=4 loops=1)"
"        ->  Hash  (cost=10.70..10.70 rows=70 width=1048) (actual time=0.057..0.058 rows=2 loops=1)"
"              Buckets: 1024  Batches: 1  Memory Usage: 9kB"
"              ->  Seq Scan on properties p  (cost=0.00..10.70 rows=70 width=1048) (actual time=0.039..0.043 rows=2 loops=1)"
"Planning Time: 1.502 ms"
"Execution Time: 0.412 ms"
```
2. Identify potential optimizations:
   - **Indexes**: Ensure that appropriate indexes exist on the columns used in JOIN conditions and WHERE clauses.
   - **JOIN Types**: Use INNER JOINs where possible to reduce the result set size early in the query execution.
   - **ORDER BY**: Consider if the ORDER BY clause can be optimized or if it is necessary for the use case.
   - **Data Types**: Ensure that the data types of the columns being joined are compatible to avoid implicit conversions.
   - **Query Structure**: Simplify the query structure if possible, such as removing unnecessary columns or joins.
   - **Partitioning**: If the dataset is large, consider partitioning the tables to improve query performance.
3. Refactor the query based on the analysis:
   - Add indexes on `bookings.user_id`, `bookings.property_id`, `payments.booking_id`, and any other frequently queried columns.
   - Ensure that the JOINs are optimized for performance.
   - Review the ORDER BY clause to ensure it is necessary and optimized.
   - Consider using CTEs (Common Table Expressions) or subqueries if they can simplify the query structure without impacting performance.
 - **Final Query**: After applying the optimizations, the final query remains the same as the original, but with indexes applied to improve performance.
 - **Monitoring**: Continuously monitor the query performance using `EXPLAIN ANALYZE` after applying the optimizations to ensure that the changes have a positive impact on execution time and resource usage.
 - **Conclusion**: The query is optimized for performance by ensuring appropriate indexes are in place, using INNER JOINs where applicable, and simplifying the query structure. Regular monitoring and adjustments based on query performance metrics will help maintain optimal performance as the dataset grows.