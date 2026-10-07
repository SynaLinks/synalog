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
t_2_F AS (SELECT * FROM (
  
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
  t_0_U.u AS v
FROM
  t_1_U AS t_0_U
WHERE
  (t_0_U.u != 'bob') AND
  ((SELECT
    MIN(MagicalEntangle(1, x_5.value)) AS logica_value
  FROM
    t_2_F AS F, JSON_EACH(JSON_ARRAY(0)) as x_5
  WHERE
    (F.a = 'bob') AND
    (F.b = t_0_U.u)) IS NULL) AND
  ((SELECT
    MIN(MagicalEntangle(1, x_9.value)) AS logica_value
  FROM
    t_2_F AS t_3_F, JSON_EACH(JSON_ARRAY(0)) as x_9
  WHERE
    (t_3_F.a = t_0_U.u) AND
    (t_3_F.b = 'bob')) IS NULL) ORDER BY v NULLS LAST;