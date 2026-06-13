WITH t_0_Classification AS (SELECT * FROM (
  
    SELECT
      x_8.value AS col0,
      'small' AS col1
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_8
    WHERE
      (x_8.value < 3)
   UNION ALL
  
    SELECT
      x_13.value AS col0,
      'medium' AS col1
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_13
    WHERE
      (x_13.value >= 3) AND
      (x_13.value < 7)
   UNION ALL
  
    SELECT
      x_18.value AS col0,
      'large' AS col1
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_18
    WHERE
      (x_18.value >= 7)
  
) AS UNUSED_TABLE_NAME  ORDER BY col0 )
SELECT
  Classification.col0 AS col0,
  Classification.col1 AS col1
FROM
  t_0_Classification AS Classification ORDER BY col0;