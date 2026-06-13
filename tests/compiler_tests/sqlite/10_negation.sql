WITH t_0_Prime AS (SELECT * FROM (
  
    SELECT
      2 AS col0
   UNION ALL
  
    SELECT
      3 AS col0
   UNION ALL
  
    SELECT
      5 AS col0
   UNION ALL
  
    SELECT
      7 AS col0
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      'odd' AS test_name,
      x_5.value AS x
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_5
    WHERE
      ((SELECT
        MIN(MagicalEntangle(1, x_8.value)) AS logica_value
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_12, JSON_EACH(JSON_ARRAY(0)) as x_8
      WHERE
        (((x_5.value) % (2)) = 0) AND
        (x_5.value = x_12.value)) IS NULL)
   UNION ALL
  
    SELECT
      'not_prime' AS test_name,
      x_5.value AS x
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_5
    WHERE
      (x_5.value > 1) AND
      ((SELECT
        MIN(MagicalEntangle(1, x_8.value)) AS logica_value
      FROM
        t_0_Prime AS Prime, JSON_EACH(JSON_ARRAY(0)) as x_8
      WHERE
        (Prime.col0 = x_5.value)) IS NULL)
   UNION ALL
  
    SELECT
      'even_not_prime' AS test_name,
      x_7.value AS x
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_7
    WHERE
      ((SELECT
        MIN(MagicalEntangle(1, x_10.value)) AS logica_value
      FROM
        t_0_Prime AS Prime, JSON_EACH(JSON_ARRAY(0)) as x_10
      WHERE
        (Prime.col0 = x_7.value)) IS NULL) AND
      (((x_7.value) % (2)) = 0)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;