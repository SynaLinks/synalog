WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      3 AS s
   UNION ALL
  
    SELECT
      'b' AS n,
      9 AS s
   UNION ALL
  
    SELECT
      'c' AS n,
      1 AS s
   UNION ALL
  
    SELECT
      'd' AS n,
      5 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (SELECT
  MIN(MagicalEntangle(V.s, x_4.value)) AS logica_value
FROM
  t_0_V AS V, JSON_EACH(JSON_ARRAY(0)) as x_4
WHERE
  (V.s > 1)) AS t;