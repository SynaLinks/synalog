WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY['a', 'b'] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      3 AS k,
      null AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_S.k AS k,
  ARRAY_JOIN(t_0_S.l, '+') AS s
FROM
  t_1_S AS t_0_S ORDER BY k;