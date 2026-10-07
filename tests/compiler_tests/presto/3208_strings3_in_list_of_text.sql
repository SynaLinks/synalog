WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'b' AS w
   UNION ALL
  
    SELECT
      'B' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.w AS w
FROM
  t_0_V AS V, UNNEST(TRANSFORM(ARRAY['a', 'b'], synalog_e -> ROW(synalog_e))) as pushkin(x_2)
WHERE
  (V.w = x_2);