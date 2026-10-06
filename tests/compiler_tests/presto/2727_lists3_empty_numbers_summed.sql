WITH t_0_F AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[3, 4] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      3 AS k,
      ARRAY[5] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  F.k AS k,
  SUM(x_3) AS t
FROM
  t_0_F AS F, UNNEST(TRANSFORM(F.l, synalog_e -> ROW(synalog_e))) as pushkin(x_3)
GROUP BY 1 ORDER BY k;