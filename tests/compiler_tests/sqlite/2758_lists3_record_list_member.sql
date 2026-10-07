WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_OBJECT('name', 'a', 'tags', JSON_ARRAY('x', 'y')) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_OBJECT('name', 'b', 'tags', JSON_ARRAY()) AS r
   UNION ALL
  
    SELECT
      3 AS id,
      JSON_OBJECT('name', 'c', 'tags', JSON_ARRAY('y')) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.id AS id
FROM
  t_1_R AS t_0_R, JSON_EACH(JSON_EXTRACT(t_0_R.r, "$.tags")) as x_3
WHERE
  ('y' = x_3.value) ORDER BY id NULLS LAST;