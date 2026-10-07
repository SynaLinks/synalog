WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'red green blue' AS s
   UNION ALL
  
    SELECT
      2 AS id,
      'red red' AS s
   UNION ALL
  
    SELECT
      3 AS id,
      'blue' AS s
   UNION ALL
  
    SELECT
      4 AS id,
      '' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_2 AS w,
  SUM(1) AS n
FROM
  t_1_W AS t_0_W, UNNEST(TRANSFORM(SPLIT(t_0_W.s, ' '), synalog_e -> ROW(synalog_e))) as pushkin(x_2)
WHERE
  (x_2 != '')
GROUP BY 1 ORDER BY w, n;