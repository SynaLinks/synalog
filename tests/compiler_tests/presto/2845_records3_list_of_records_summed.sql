WITH t_1_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[CAST(ROW('a', 1) AS ROW(n varchar, v double)), CAST(ROW('b', 2) AS ROW(n varchar, v double))] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[CAST(ROW('c', 3) AS ROW(n varchar, v double))] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_T.k AS k,
  SUM(x_3.v) AS t
FROM
  t_1_T AS t_0_T, UNNEST(TRANSFORM(t_0_T.l, synalog_e -> ROW(synalog_e))) as pushkin(x_3)
GROUP BY 1 ORDER BY k;