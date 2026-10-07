WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      "north" AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      "north" AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      "north" AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      "north" AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      "north" AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      "south" AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      "south" AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      "south" AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      "south" AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      "east" AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      "east" AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      "east" AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      "east" AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      "east" AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(S.v) AS t
FROM
  t_0_S AS S
WHERE
  (S.d <= 1) AND
  (S.r = "south");