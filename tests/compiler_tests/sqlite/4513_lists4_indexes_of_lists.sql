WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(1, 2, 3) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      3 AS k,
      JSON_ARRAY(7) AS l
   UNION ALL
  
    SELECT
      4 AS k,
      JSON_ARRAY(5, 5, 9, 1) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  x_4.value AS i
FROM
  t_1_L AS t_0_L, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < JSON_ARRAY_LENGTH(t_0_L.l)) select n from t) where n < JSON_ARRAY_LENGTH(t_0_L.l))) as x_4 ORDER BY k NULLS LAST, i NULLS LAST;