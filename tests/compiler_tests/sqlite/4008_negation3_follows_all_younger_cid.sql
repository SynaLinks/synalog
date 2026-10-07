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
  
) AS UNUSED_TABLE_NAME  ),
t_3_F AS (SELECT * FROM (
  
    SELECT
      'ann' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'cid' AS b
   UNION ALL
  
    SELECT
      'cid' AS a,
      'dee' AS b
   UNION ALL
  
    SELECT
      'dee' AS a,
      'cid' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'fay' AS a,
      'fay' AS b
   UNION ALL
  
    SELECT
      'ann' AS a,
      'cid' AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS x
FROM
  t_1_U AS t_0_U
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_7.value)) AS logica_value
  FROM
    t_1_U AS t_2_U, JSON_EACH(JSON_ARRAY(0)) as x_7
  WHERE
    (t_2_U.age < t_0_U.age) AND
    ((SELECT
      MIN(MagicalEntangle(1, x_11.value)) AS logica_value
    FROM
      t_3_F AS F, JSON_EACH(JSON_ARRAY(0)) as x_11
    WHERE
      (F.a = 'cid') AND
      (F.b = t_2_U.u)) IS NULL)) IS NULL) AND
  (t_0_U.u = 'cid');