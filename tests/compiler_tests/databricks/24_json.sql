WITH t_0_JsonData AS (SELECT * FROM VALUES
  ("Alice", 30),
  ("Bob", 25)
AS UNUSED_TABLE_NAME(col0, col1))
SELECT
  JsonData.col0 AS col0,
  JsonData.col1 AS col1
FROM
  t_0_JsonData AS JsonData ORDER BY col0 NULLS LAST;