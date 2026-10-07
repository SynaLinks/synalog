WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_OBJECT('xs', JSON_ARRAY(1, 2), 'm', 2.0) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_OBJECT('xs', JSON_ARRAY(), 'm', null) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.id AS id,
  JSON_ARRAY_LENGTH(JSON_EXTRACT(t_0_R.r, "$.xs")) AS n,
  JSON_EXTRACT(t_0_R.r, "$.m") AS m
FROM
  t_1_R AS t_0_R ORDER BY id NULLS LAST;