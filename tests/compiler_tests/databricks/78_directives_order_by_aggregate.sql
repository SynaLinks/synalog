WITH t_0_Sale AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("b", 10)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  Sale.k AS k,
  SUM(Sale.v) AS v
FROM
  t_0_Sale AS Sale
GROUP BY 1 ORDER BY v DESC;