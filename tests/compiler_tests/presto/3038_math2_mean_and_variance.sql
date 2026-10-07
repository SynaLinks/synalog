WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      7 AS x
   UNION ALL
  
    SELECT
      2 AS id,
      -7 AS x
   UNION ALL
  
    SELECT
      3 AS id,
      2.5E0 AS x
   UNION ALL
  
    SELECT
      4 AS id,
      -2.5E0 AS x
   UNION ALL
  
    SELECT
      5 AS id,
      0 AS x
   UNION ALL
  
    SELECT
      6 AS id,
      3 AS x
   UNION ALL
  
    SELECT
      7 AS id,
      0.125E0 AS x
   UNION ALL
  
    SELECT
      8 AS id,
      1000000 AS x
   UNION ALL
  
    SELECT
      9 AS id,
      -0.75E0 AS x
   UNION ALL
  
    SELECT
      10 AS id,
      12.345E0 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_M AS (SELECT
  AVG(V.x) AS m,
  AVG(((V.x) * (V.x))) AS m2
FROM
  t_2_V AS V)
SELECT
  t_0_M.m AS mean,
  ((t_0_M.m2) - ((POW(t_0_M.m, 2)))) AS var
FROM
  t_1_M AS t_0_M;