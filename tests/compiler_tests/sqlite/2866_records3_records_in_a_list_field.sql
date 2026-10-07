WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      JSON_OBJECT('name', 'a', 'items', JSON_ARRAY(JSON_OBJECT('n', 'p'), JSON_OBJECT('n', 'q'))) AS r
   UNION ALL
  
    SELECT
      JSON_OBJECT('name', 'b', 'items', JSON_ARRAY(JSON_OBJECT('n', 'r'))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JSON_EXTRACT(T.r, "$.name") AS name,
  JSON_EXTRACT(x_1.value, "$.n") AS item
FROM
  t_0_T AS T, JSON_EACH(JSON_EXTRACT(T.r, "$.items")) as x_1 ORDER BY name, item;