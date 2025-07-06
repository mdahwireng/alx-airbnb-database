# Performance monitoring

## Objective:
- Continuously monitor the performance of the database to ensure optimal query execution and resource utilization.
- Identify and address performance bottlenecks in real-time.
- Implement strategies for ongoing performance tuning and optimization.
## Procedure:
- Identification of most used queries:
  - Use database monitoring tools to track query execution times, resource usage, and frequency of execution.
  - Identify queries that are frequently executed and have high resource consumption.
  - Focus on queries that impact user experience or system performance.
  - Analyze query execution plans to identify potential bottlenecks, such as slow joins, missing indexes, or inefficient subqueries.
- Implementation of performance monitoring tools:
  - Use tools like `pg_stat_statements` in PostgreSQL or similar features in other databases to track query performance metrics.
  - Set up alerts for queries that exceed predefined thresholds for execution time or resource usage.
  - Regularly review query performance reports to identify trends and areas for improvement.