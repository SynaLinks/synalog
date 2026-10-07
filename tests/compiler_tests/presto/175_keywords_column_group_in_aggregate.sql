WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      'a' AS "group",
      1 AS v
   UNION ALL
  
    SELECT
      'a' AS "group",
      2 AS v
   UNION ALL
  
    SELECT
      'b' AS "group",
      4 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R."group" AS "group",
  SUM(R.v) AS total
FROM
  t_0_R AS R
GROUP BY 1 ORDER BY "group";