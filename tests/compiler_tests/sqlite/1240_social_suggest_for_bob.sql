WITH t_1_Follows AS (SELECT * FROM (
  
    SELECT
      'ann' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'ann' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'cat' AS a,
      'dan' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'eve' AS b
   UNION ALL
  
    SELECT
      'fay' AS a,
      'cat' AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_Follows.b AS c
FROM
  t_1_Follows AS Follows, t_1_Follows AS t_0_Follows
WHERE
  (t_0_Follows.b != 'bob') AND
  ((SELECT
    MIN(MagicalEntangle(1, x_8.value)) AS logica_value
  FROM
    t_1_Follows AS t_2_Follows, JSON_EACH(JSON_ARRAY(0)) as x_8
  WHERE
    (t_2_Follows.a = 'bob') AND
    (t_2_Follows.b = t_0_Follows.b)) IS NULL) AND
  (Follows.a = 'bob') AND
  (t_0_Follows.a = Follows.b)
GROUP BY t_0_Follows.b;