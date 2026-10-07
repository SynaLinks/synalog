WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_OBJECT('name', 'a', 'tags', JSON_ARRAY('x'), 'score', 1.5) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_OBJECT('name', 'b', 'tags', JSON_ARRAY(), 'score', null) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.id AS id,
  JSON_EXTRACT(P.r, "$.name") AS name,
  JSON_ARRAY_LENGTH(JSON_EXTRACT(P.r, "$.tags")) AS n,
  JSON_EXTRACT(P.r, "$.score") AS s
FROM
  t_0_P AS P ORDER BY id;