WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      'ann' AS u,
      31 AS age
   UNION ALL
  
    SELECT
      'bob' AS u,
      25 AS age
   UNION ALL
  
    SELECT
      'cid' AS u,
      40 AS age
   UNION ALL
  
    SELECT
      'dee' AS u,
      19 AS age
   UNION ALL
  
    SELECT
      'eve' AS u,
      52 AS age
   UNION ALL
  
    SELECT
      'fay' AS u,
      28 AS age
   UNION ALL
  
    SELECT
      'gus' AS u,
      35 AS age
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_U.u AS u
FROM
  t_1_U AS t_0_U
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_4.value)) AS logica_value
  FROM
    t_1_U AS t_3_U, JSON_EACH(JSON_ARRAY(0)) as x_4
  WHERE
    (t_3_U.age >= 0) AND
    (t_3_U.age <= 100) AND
    (t_0_U.u = t_3_U.u)) IS NULL) ORDER BY u NULLS LAST;