WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      1 AS x
   UNION ALL
  
    SELECT
      'b' AS k,
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_T AS (SELECT
  SUM(t_3_V.x) AS t
FROM
  t_1_V AS t_3_V)
SELECT
  V.k AS k,
  ROUND(((100) * ((CAST(V.x AS REAL) / (t_0_T.t)))), 2) AS pct
FROM
  t_1_V AS V, t_2_T AS t_0_T ORDER BY k NULLS LAST;
