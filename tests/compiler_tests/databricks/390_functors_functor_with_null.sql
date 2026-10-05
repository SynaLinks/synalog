WITH t_0_WithNull AS (SELECT * FROM VALUES
  (null),
  (1)
AS UNUSED_TABLE_NAME(x))
SELECT
  SUM(1) AS n
FROM
  t_0_WithNull AS WithNull
WHERE
  (WithNull.x IS null);