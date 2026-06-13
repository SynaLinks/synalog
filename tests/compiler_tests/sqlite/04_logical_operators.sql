SELECT * FROM (
  
    SELECT
      'and' AS test_name,
      x_5.value AS x
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_5
    WHERE
      ((x_5.value > 2) AND (x_5.value < 7))
   UNION ALL
  
    SELECT
      'complex' AS test_name,
      x_5.value AS x
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_5
    WHERE
      (((x_5.value > 2) AND (x_5.value < 4)) OR ((x_5.value > 6) AND (x_5.value < 9)))
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;