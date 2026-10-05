WITH t_1_Number AS (SELECT * FROM (
  
    SELECT
      x_8 AS col0
    FROM
      UNNEST(FILTER(SEQUENCE(0, 5), x -> x < 5)) as pushkin(x_8)
   UNION ALL
  
    SELECT
      x_10 AS col0
    FROM
      UNNEST(ARRAY[10, 11, 12, 13, 14]) as pushkin(x_10)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Category AS (SELECT * FROM (
  
    SELECT
      Number.col0 AS col0,
      'small' AS col1
    FROM
      t_1_Number AS Number
    WHERE
      (Number.col0 < 5)
   UNION ALL
  
    SELECT
      t_2_Number.col0 AS col0,
      'medium' AS col1
    FROM
      t_1_Number AS t_2_Number
    WHERE
      (t_2_Number.col0 >= 5) AND
      (t_2_Number.col0 < 10)
   UNION ALL
  
    SELECT
      t_3_Number.col0 AS col0,
      'large' AS col1
    FROM
      t_1_Number AS t_3_Number
    WHERE
      (t_3_Number.col0 >= 10)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Category.col0 AS col0,
  Category.col1 AS col1
FROM
  t_0_Category AS Category ORDER BY col0;