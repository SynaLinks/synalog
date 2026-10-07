WITH t_3_N AS (SELECT * FROM (
  
    SELECT
      1 AS n
   UNION ALL
  
    SELECT
      2 AS n
   UNION ALL
  
    SELECT
      3 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS k
FROM
  t_3_N AS t_0_N, t_3_N AS t_1_N, t_3_N AS t_2_N
WHERE
  (((t_0_N.n) + (t_1_N.n)) = t_2_N.n);