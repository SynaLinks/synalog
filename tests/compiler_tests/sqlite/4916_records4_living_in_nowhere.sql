WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_OBJECT('name', 'ann', 'home', JSON_OBJECT('city', 'paris'), 'age', 31, 'tags', JSON_ARRAY('a', 'b')) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_OBJECT('name', 'bob', 'home', JSON_OBJECT('city', 'oslo'), 'age', null, 'tags', JSON_ARRAY()) AS r
   UNION ALL
  
    SELECT
      3 AS id,
      JSON_OBJECT('name', 'cid', 'home', JSON_OBJECT('city', 'paris'), 'age', 45, 'tags', JSON_ARRAY('c')) AS r
   UNION ALL
  
    SELECT
      4 AS id,
      JSON_OBJECT('name', 'dee', 'home', JSON_OBJECT('city', null), 'age', 22, 'tags', JSON_ARRAY('a')) AS r
   UNION ALL
  
    SELECT
      5 AS id,
      JSON_OBJECT('name', 'eve', 'home', JSON_OBJECT('city', 'rome'), 'age', 38, 'tags', JSON_ARRAY('b', 'c', 'd')) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JSON_EXTRACT(P.r, "$.name") AS n
FROM
  t_0_P AS P
WHERE
  (JSON_EXTRACT(JSON_EXTRACT(P.r, "$.home"), "$.city") = 'nowhere') ORDER BY n;