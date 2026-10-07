WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      'alpha' AS w
   UNION ALL
  
    SELECT
      'beta' AS w
   UNION ALL
  
    SELECT
      'gamma' AS w
   UNION ALL
  
    SELECT
      'delta' AS w
   UNION ALL
  
    SELECT
      'epsilon' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.w AS w,
  LENGTH(t_0_W.w) AS n
FROM
  t_1_W AS t_0_W ORDER BY w;