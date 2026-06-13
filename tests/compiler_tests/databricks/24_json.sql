WITH t_0_JsonData AS (SELECT * FROM (
  
    SELECT
      "Alice" AS col0,
      30 AS col1
   UNION ALL
  
    SELECT
      "Bob" AS col0,
      25 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JsonData.col0 AS col0,
  JsonData.col1 AS col1
FROM
  t_0_JsonData AS JsonData ORDER BY col0;