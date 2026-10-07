WITH t_4_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_Prev AS (SELECT
  t_2_S.d AS d,
  MAX(t_3_S.d) AS p
FROM
  t_4_S AS t_2_S, t_4_S AS t_3_S
WHERE
  (t_3_S.d < t_2_S.d) AND
  (t_2_S.r = 'north') AND
  (t_3_S.r = 'north')
GROUP BY 1)
SELECT
  Prev.d AS d,
  ((S.v) - (t_0_S.v)) AS delta
FROM
  t_1_Prev AS Prev, t_4_S AS S, t_4_S AS t_0_S
WHERE
  (S.r = 'north') AND
  (S.d = Prev.d) AND
  (t_0_S.r = 'north') AND
  (t_0_S.d = Prev.p) ORDER BY d, delta;