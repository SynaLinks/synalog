WITH t_0_F AS (SELECT * FROM (
  
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
  F.a AS a,
  F.b AS b
FROM
  t_0_F AS F
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_7.value)) AS logica_value
  FROM
    t_0_F AS t_1_F, JSON_EACH(JSON_ARRAY(0)) as x_7
  WHERE
    (t_1_F.a = F.b) AND
    (t_1_F.b = F.a)) IS NULL) ORDER BY a, b;