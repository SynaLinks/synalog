WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_OBJECT('name', 'a', 'xs', JSON_ARRAY(1, 2, 3)) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_OBJECT('name', 'b', 'xs', JSON_ARRAY(4)) AS r
   UNION ALL
  
    SELECT
      3 AS k,
      JSON_OBJECT('name', 'c', 'xs', JSON_ARRAY()) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JSON_EXTRACT(S.r, "$.name") AS name,
  SUM(x_1.value) AS t
FROM
  t_0_S AS S, JSON_EACH(JSON_EXTRACT(S.r, "$.xs")) as x_1
GROUP BY JSON_EXTRACT(S.r, "$.name") ORDER BY name;