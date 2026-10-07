WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      1 AS k
   UNION ALL
  
    SELECT
      'b' AS n,
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.n AS n
FROM
  t_0_P AS P
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_4.value)) AS logica_value
  FROM
    t_0_P AS t_1_P, JSON_EACH(JSON_ARRAY(0)) as x_4
  WHERE
    (P.n = t_1_P.n) AND
    (t_1_P.k = 1)) IS NULL);