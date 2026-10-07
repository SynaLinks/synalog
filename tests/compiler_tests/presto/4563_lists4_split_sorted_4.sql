WITH t_2_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a,b,c' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      'abc' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      ',,' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      'x,' AS s
   UNION ALL
  
    SELECT
      6 AS k,
      null AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_AGG(x_4 order by x_4) AS a
FROM
  t_2_T AS T, UNNEST(TRANSFORM(SPLIT(T.s, ','), synalog_e -> ROW(synalog_e))) as pushkin(x_4)
WHERE
  (T.k = 4);