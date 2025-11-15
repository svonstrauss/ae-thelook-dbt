## Query guide

Use these sample queries in BigQuery (or the dbt VS Code extension) to inspect the project outputs. Replace `gold-yen-476203-m8` with your own project id if needed.

### 1. Inspect datasets and tables
```sql
SELECT schema_name
FROM `gold-yen-476203-m8`.INFORMATION_SCHEMA.SCHEMATA
ORDER BY schema_name;
```
```sql
SELECT table_name
FROM `gold-yen-476203-m8.thelook_dev_marts`.INFORMATION_SCHEMA.TABLES
ORDER BY table_name;
```

### 2. Row counts & freshness
```sql
SELECT
  COUNT(*) AS staging_orders,
  MAX(order_date) AS latest_order
FROM `gold-yen-476203-m8.thelook_dev_staging.stg_thelook__orders`;
```
```sql
SELECT
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M', MAX(order_date)) AS fact_latest
FROM `gold-yen-476203-m8.thelook_dev_marts.fct_order_items`;
```

### 3. Revenue over time (partition-pruned)
```sql
SELECT
  DATE(order_date) AS d,
  ROUND(SUM(sale_price), 2) AS revenue
FROM `gold-yen-476203-m8.thelook_dev_marts.fct_order_items`
WHERE order_date BETWEEN '2024-09-01' AND '2024-09-30'
GROUP BY d
ORDER BY d;
```

### 4. Product performance
```sql
SELECT
  product_category,
  ROUND(SUM(sale_price), 2) AS revenue,
  COUNT(*) AS items
FROM `gold-yen-476203-m8.thelook_dev_marts.fct_order_items`
GROUP BY product_category
ORDER BY revenue DESC
LIMIT 15;
```

### 5. Customer lifecycle snapshot
```sql
SELECT
  customer_type,
  COUNT(*) AS customers,
  ROUND(AVG(orders_count), 2) AS avg_orders
FROM `gold-yen-476203-m8.thelook_dev_marts.dim_users`
GROUP BY customer_type
ORDER BY customers DESC;
```

### 6. Orders snapshot history (SCD2)
```sql
SELECT
  order_id,
  status,
  dbt_valid_from,
  dbt_valid_to
FROM `gold-yen-476203-m8.thelook_dev_snapshots.orders_snapshot`
WHERE order_id = '123456'
ORDER BY dbt_valid_from;
```

### 7. Metric sanity check (AOV)
```sql
SELECT
  FORMAT_DATE('%Y-%m', order_date) AS month,
  ROUND(SUM(sale_price), 2) AS revenue,
  COUNT(DISTINCT order_id) AS orders,
  ROUND(SUM(sale_price)/COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM `gold-yen-476203-m8.thelook_dev_marts.fct_order_items`
WHERE order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
GROUP BY month
ORDER BY month DESC;
```

### 8. Domain validation (useful for accepted_values tests)
```sql
SELECT DISTINCT order_status
FROM `gold-yen-476203-m8.thelook_dev_marts.fct_order_items`
ORDER BY order_status;
```

Feel free to add more queries that illustrate insights or validate assumptions; this file is meant to help reviewers explore the dataset quickly.
