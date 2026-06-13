WITH t_1_Number AS (SELECT * FROM (
  
    SELECT
      x_6.value AS col0
    FROM
      JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 5) select n from t) where n < 5)) as x_6
   UNION ALL
  
    SELECT
      x_8.value AS col0
    FROM
      JSON_EACH(JSON_ARRAY(10, 11, 12, 13, 14)) as x_8
  
) AS UNUSED_TABLE_NAME  ),
t_0_Stats_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      'all' AS col0,
      1 AS count
    FROM
      t_1_Number AS Number
   UNION ALL
  
    SELECT
      'even' AS col0,
      1 AS count
    FROM
      t_1_Number AS t_2_Number
    WHERE
      (((t_2_Number.col0) % (2)) = 0)
   UNION ALL
  
    SELECT
      'odd' AS col0,
      1 AS count
    FROM
      t_1_Number AS t_3_Number
    WHERE
      (((t_3_Number.col0) % (2)) != 0)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Stats_MultBodyAggAux.col0 AS col0,
  SUM(Stats_MultBodyAggAux.count) AS count
FROM
  t_0_Stats_MultBodyAggAux AS Stats_MultBodyAggAux
GROUP BY Stats_MultBodyAggAux.col0;