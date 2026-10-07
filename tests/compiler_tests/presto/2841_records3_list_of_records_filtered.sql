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
  x_1.n AS n
FROM
  t_0_T AS T, UNNEST(TRANSFORM(T.l, synalog_e -> ROW(synalog_e))) as pushkin(x_1)
WHERE
  (x_1.v > 1) ORDER BY n;