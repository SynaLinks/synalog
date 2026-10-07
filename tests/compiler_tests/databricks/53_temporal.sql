WITH t_1_Orders AS (SELECT * FROM VALUES
  (1, "2024-01-15 10:30:00"),
  (2, "2024-01-20 14:00:00"),
  (3, "2024-02-05 09:15:00")
AS UNUSED_TABLE_NAME(id, created_at)),
t_0_MonthlyCount AS (SELECT
  SUBSTR(CAST(Orders.created_at AS STRING), 1, 7) AS month,
  SUM(1) AS count
FROM
  t_1_Orders AS Orders
GROUP BY 1 ORDER BY month NULLS LAST)
SELECT
  MonthlyCount.month AS month,
  MonthlyCount.count AS count
FROM
  t_0_MonthlyCount AS MonthlyCount ORDER BY month NULLS LAST;