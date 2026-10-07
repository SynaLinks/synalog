WITH t_1_S AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_0_Day AS (SELECT
  S.d AS d
FROM
  t_1_S AS S
GROUP BY d),
t_5_Region AS (SELECT
  t_6_S.r AS r
FROM
  t_1_S AS t_6_S
GROUP BY r),
t_2_Missing AS (SELECT
  t_3_Day.d AS d
FROM
  t_0_Day AS t_3_Day, t_5_Region AS Region
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_S AS t_7_S
  WHERE
    (t_7_S.r = Region.r) AND
    (t_7_S.d = t_3_Day.d)) IS NULL)
GROUP BY d)
SELECT
  Day.d AS d
FROM
  t_0_Day AS Day
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_Missing AS Missing
  WHERE
    (Missing.d = Day.d)) IS NULL) ORDER BY d;