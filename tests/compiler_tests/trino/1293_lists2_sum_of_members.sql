WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ARRAY[3, 1, 2] AS l
   UNION ALL
  
    SELECT
      2 AS id,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      3 AS id,
      ARRAY[5] AS l
   UNION ALL
  
    SELECT
      4 AS id,
      ARRAY[7, 7, 8, 9] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.id AS id,
  SUM(x_3) AS s
FROM
  t_1_L AS t_0_L, UNNEST(TRANSFORM(t_0_L.l, synalog_e -> ROW(synalog_e))) as pushkin(x_3)
GROUP BY 1 ORDER BY id, s;