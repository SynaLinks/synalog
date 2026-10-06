WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY["a", "b"] AS l
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
  S.k AS k
FROM
  t_0_S AS S, UNNEST(S.l) as x_3
WHERE
  ("a" = x_3);