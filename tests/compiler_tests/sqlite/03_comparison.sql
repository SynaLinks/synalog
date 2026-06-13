SELECT * FROM (
  
    SELECT
      'equal' AS test_name,
      5 AS x
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_5
    WHERE
      (5 = x_5.value)
   UNION ALL
  
    SELECT
      'not_equal' AS test_name,
      x_5.value AS x
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_5
    WHERE
      (x_5.value != 5)
   UNION ALL
  
    SELECT
      'less_than' AS test_name,
      x_5.value AS x
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_5
    WHERE
      (x_5.value < 5)
   UNION ALL
  
    SELECT
      'in_range' AS test_name,
      x_5.value AS x
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_5
    WHERE
      (x_5.value >= 3) AND
      (x_5.value <= 7)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;