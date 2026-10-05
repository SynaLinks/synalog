WITH t_3_L AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_ARRAY(3, 1, 2) AS l
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      3 AS id,
      JSON_ARRAY(5) AS l
   UNION ALL
  
    SELECT
      4 AS id,
      JSON_ARRAY(7, 7, 8, 9) AS l
  
) AS UNUSED_TABLE_NAME  ),
t_1_All AS (SELECT
  JSON_GROUP_ARRAY(x_2.value) AS xs
FROM
  t_3_L AS t_2_L, JSON_EACH(t_2_L.l) as x_2)
SELECT
  JSON_ARRAY_LENGTH(t_0_All.xs) AS n
FROM
  t_1_All AS t_0_All;
