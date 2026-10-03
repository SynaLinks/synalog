WITH t_0_Friend AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'a' AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3.value AS name
FROM
  JSON_EACH(JSON_ARRAY('a', 'b', 'c')) as x_3
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_6.value)) AS logica_value
  FROM
    t_0_Friend AS Friend, JSON_EACH(JSON_ARRAY(0)) as x_6
  WHERE
    (Friend.a = x_3.value)) IS NULL) ORDER BY name;