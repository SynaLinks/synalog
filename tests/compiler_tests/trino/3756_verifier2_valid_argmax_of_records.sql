WITH t_4_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_1_A AS (SELECT
  (ARRAY_AGG(CAST(ROW(t_2_N.n, t_2_N.s) AS ROW(n double, s varchar)) order by t_2_N.n desc))[1] AS best
FROM
  t_4_N AS t_2_N)
SELECT
  t_0_A.best.s AS s
FROM
  t_1_A AS t_0_A;