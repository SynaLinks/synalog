WITH t_0_Pr AS (SELECT * FROM (
  
    SELECT
      100 AS pid,
      10 AS dept
   UNION ALL
  
    SELECT
      101 AS pid,
      10 AS dept
   UNION ALL
  
    SELECT
      102 AS pid,
      20 AS dept
   UNION ALL
  
    SELECT
      103 AS pid,
      50 AS dept
  
) AS UNUSED_TABLE_NAME  ),
t_1_D AS (SELECT * FROM (
  
    SELECT
      10 AS dept,
      "eng" AS dname,
      "paris" AS city
   UNION ALL
  
    SELECT
      20 AS dept,
      "ops" AS dname,
      "lyon" AS city
   UNION ALL
  
    SELECT
      40 AS dept,
      "hr" AS dname,
      "nice" AS city
   UNION ALL
  
    SELECT
      null AS dept,
      "temp" AS dname,
      "lyon" AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Pr.pid AS pid
FROM
  t_0_Pr AS Pr, t_1_D AS D
WHERE
  (D.dept = Pr.dept) AND
  (D.dname = "temp");