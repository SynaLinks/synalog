WITH t_1_Number AS (SELECT * FROM (
  
    SELECT
      x_6 AS col0
    FROM
      UNNEST(GENERATE_ARRAY(0, 5 - 1)) as x_6
   UNION ALL
  
    SELECT
      x_8 AS col0
    FROM
      UNNEST(ARRAY[10, 11, 12, 13, 14]) as x_8
  
) AS UNUSED_TABLE_NAME  ),
t_0_Stats_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      "all" AS col0,
      1 AS count
    FROM
      t_1_Number AS Number
   UNION ALL
  
    SELECT
      "even" AS col0,
      1 AS count
    FROM
      t_1_Number AS t_2_Number
    WHERE
      ((MOD(t_2_Number.col0, 2)) = 0)
   UNION ALL
  
    SELECT
      "odd" AS col0,
      1 AS count
    FROM
      t_1_Number AS t_3_Number
    WHERE
      ((MOD(t_3_Number.col0, 2)) != 0)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Stats_MultBodyAggAux.col0 AS col0,
  SUM(Stats_MultBodyAggAux.count) AS count
FROM
  t_0_Stats_MultBodyAggAux AS Stats_MultBodyAggAux
GROUP BY col0;