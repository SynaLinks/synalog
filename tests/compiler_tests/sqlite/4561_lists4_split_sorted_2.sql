WITH t_2_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a,b,c' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      'abc' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      ',,' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      'x,' AS s
   UNION ALL
  
    SELECT
      6 AS k,
      null AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ArgMin(x_4.value, x_4.value, null) AS a
FROM
  t_2_T AS T, JSON_EACH(SPLIT(T.s, ',')) as x_4
WHERE
  (T.k = 2);