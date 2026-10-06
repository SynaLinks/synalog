WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[CAST(ROW('a', 1) AS ROW(n varchar, v double)), CAST(ROW('b', 2) AS ROW(n varchar, v double))] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[CAST(ROW('c', 3) AS ROW(n varchar, v double))] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  x_3.n AS n,
  x_3.v AS v
FROM
  t_0_T AS T, UNNEST(TRANSFORM(T.l, synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY k, n;