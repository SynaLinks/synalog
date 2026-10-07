WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      1 AS n
   UNION ALL
  
    SELECT
      'x' AS g,
      2 AS n
   UNION ALL
  
    SELECT
      'y' AS g,
      3 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_C AS (SELECT
  V.g AS g,
  ARRAY_AGG(CAST(ROW(V.n) AS ROW(n double))) AS l
FROM
  t_2_V AS V
GROUP BY 1)
SELECT
  t_0_C.g AS g,
  SUM(1) AS c
FROM
  t_1_C AS t_0_C, UNNEST(TRANSFORM(t_0_C.l, synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3.n > 0)
GROUP BY 1 ORDER BY g;