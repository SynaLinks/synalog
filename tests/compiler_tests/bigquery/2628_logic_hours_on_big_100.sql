WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      10 AS pid,
      8 AS hours
   UNION ALL
  
    SELECT
      1 AS id,
      11 AS pid,
      4 AS hours
   UNION ALL
  
    SELECT
      2 AS id,
      10 AS pid,
      12 AS hours
   UNION ALL
  
    SELECT
      3 AS id,
      12 AS pid,
      20 AS hours
   UNION ALL
  
    SELECT
      3 AS id,
      14 AS pid,
      2 AS hours
   UNION ALL
  
    SELECT
      4 AS id,
      12 AS pid,
      6 AS hours
   UNION ALL
  
    SELECT
      6 AS id,
      11 AS pid,
      15 AS hours
   UNION ALL
  
    SELECT
      5 AS id,
      13 AS pid,
      1 AS hours
  
) AS UNUSED_TABLE_NAME  ),
t_1_Proj AS (SELECT * FROM (
  
    SELECT
      10 AS pid,
      "red" AS team,
      300 AS budget
   UNION ALL
  
    SELECT
      11 AS pid,
      "red" AS team,
      1200 AS budget
   UNION ALL
  
    SELECT
      12 AS pid,
      "blue" AS team,
      800 AS budget
   UNION ALL
  
    SELECT
      13 AS pid,
      "green" AS team,
      50 AS budget
   UNION ALL
  
    SELECT
      14 AS pid,
      "blue" AS team,
      90 AS budget
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.id AS id,
  SUM(CASE WHEN (Proj.budget > 100) THEN A.hours ELSE 0 END) AS h
FROM
  t_0_A AS A, t_1_Proj AS Proj
WHERE
  (Proj.pid = A.pid)
GROUP BY id ORDER BY id, h;