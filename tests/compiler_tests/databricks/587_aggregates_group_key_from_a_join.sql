WITH t_0_Sale AS (SELECT * FROM VALUES
  ("fr", 10),
  ("de", 20),
  ("ca", 5)
AS UNUSED_TABLE_NAME(c, x)),
t_1_Region AS (SELECT * FROM VALUES
  ("fr", "eu"),
  ("de", "eu"),
  ("ca", "us")
AS UNUSED_TABLE_NAME(c, r))
SELECT
  Region.r AS r,
  SUM(Sale.x) AS t
FROM
  t_0_Sale AS Sale, t_1_Region AS Region
WHERE
  (Region.c = Sale.c)
GROUP BY 1 ORDER BY r NULLS LAST;