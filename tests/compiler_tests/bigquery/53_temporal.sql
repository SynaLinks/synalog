WITH t_1_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "2024-01-15 10:30:00" AS created_at
   UNION ALL
  
    SELECT
      2 AS id,
      "2024-01-20 14:00:00" AS created_at
   UNION ALL
  
    SELECT
      3 AS id,
      "2024-02-05 09:15:00" AS created_at
  
) AS UNUSED_TABLE_NAME  ),
t_0_MonthlyCount AS (SELECT
  SUBSTR(CAST(Orders.created_at AS STRING), 1, 7) AS month,
  SUM(1) AS count
FROM
  t_1_Orders AS Orders
GROUP BY month ORDER BY month)
SELECT
  MonthlyCount.month AS month,
  MonthlyCount.count AS count
FROM
  t_0_MonthlyCount AS MonthlyCount ORDER BY month;