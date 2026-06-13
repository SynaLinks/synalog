WITH t_0_AllSquares AS (SELECT * FROM (
  
    SELECT
      x_15.value AS x,
      ((x_15.value) * (x_15.value)) AS sq,
      'even' AS type
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_15
    WHERE
      (((x_15.value) % (2)) = 0)
   UNION ALL
  
    SELECT
      x_25.value AS x,
      ((x_25.value) * (x_25.value)) AS sq,
      'odd' AS type
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_25
    WHERE
      (((x_25.value) % (2)) = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AllSquares.x AS x,
  AllSquares.sq AS sq,
  AllSquares.type AS type
FROM
  t_0_AllSquares AS AllSquares ORDER BY x;