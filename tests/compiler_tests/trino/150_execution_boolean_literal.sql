WITH t_0_F AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      true AS ok
   UNION ALL
  
    SELECT
      2 AS x,
      false AS ok
  
) AS UNUSED_TABLE_NAME  )
SELECT
  F.x AS x
FROM
  t_0_F AS F
WHERE
  (F.ok = true);