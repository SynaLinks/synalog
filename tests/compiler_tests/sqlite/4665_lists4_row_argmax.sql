WITH t_2_L AS (SELECT * FROM (
  
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
   UNION ALL
  
    SELECT
      5 AS k,
      null AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  (SELECT
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(ArgMax(JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', x_7.value, 'value', (CASE WHEN x_7.value < 0 THEN NULL ELSE JSON_EXTRACT(t_0_L.l, '$[' || x_7.value || ']') END)), x_8.value), "$.arg"), JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', x_7.value, 'value', (CASE WHEN x_7.value < 0 THEN NULL ELSE JSON_EXTRACT(t_0_L.l, '$[' || x_7.value || ']') END)), x_8.value), "$.value"), 1), '$[' || 0 || ']') END) AS logica_value
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < JSON_ARRAY_LENGTH(t_0_L.l)) select n from t) where n < JSON_ARRAY_LENGTH(t_0_L.l))) as x_7, JSON_EACH(JSON_ARRAY(0)) as x_8) AS v
FROM
  t_2_L AS t_0_L ORDER BY k NULLS LAST;