WITH t_0_Rate AS (SELECT * FROM (
  
    SELECT
      "ab" AS s,
      2 AS r
   UNION ALL
  
    SELECT
      "hello" AS s,
      5 AS r
   UNION ALL
  
    SELECT
      "x" AS s,
      10 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Rate.r AS v
FROM
  t_0_Rate AS Rate
WHERE
  ("ab" = Rate.s);