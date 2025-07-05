#  Implement Indexes for Optimization

**Objective:**
Implement indexes on the Airbnb database to optimize query performance, particularly for frequently queried columns.

**Procedure:**
1. **Identify Key Columns:**
   - Analyze query patterns to determine which columns are frequently used in WHERE clauses, JOIN conditions, and ORDER BY clauses.
   - Common candidates include:
     - `users.email`
     - `bookings.user_id`
     - `bookings.property_id`
     - `bookings.created_at`
     - `properties.host_id`
     - `properties.name`
     - `properties.location`
     - `reviews.property_id`
     - `reviews.user_id`
  
2. **Create Indexes:**
    - Use the `CREATE INDEX` statement to create indexes on the identified columns.
    - Ensure that indexes are created on columns that will significantly improve query performance without incurring excessive overhead.
    - Consider the trade-off between read performance and write performance, as indexes can slow down insert, update, and delete operations.

3. **Monitor Performance:**
   - After implementing indexes, monitor query performance using tools like `EXPLAIN` or `ANALYZE` to analyze query plans.
   - Adjust or remove indexes based on their effectiveness and impact on overall database performance.
   - Regularly review and maintain indexes to ensure they remain relevant as the database schema and query patterns evolve.