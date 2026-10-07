WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      JSON_OBJECT('name', 'a', 'xs', JSON_ARRAY(JSON_OBJECT('v', 1), JSON_OBJECT('v', 2))) AS r
   UNION ALL
  
    SELECT
      JSON_OBJECT('name', 'b', 'xs', JSON_ARRAY(JSON_OBJECT('v', 5))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JSON_EXTRACT(t_0_R.r, "$.name") AS name,
  JSON_EXTRACT(x_1.value, "$.v") AS v
FROM
  t_1_R AS t_0_R, JSON_EACH(JSON_EXTRACT(t_0_R.r, "$.xs")) as x_1 ORDER BY name NULLS LAST, v NULLS LAST;