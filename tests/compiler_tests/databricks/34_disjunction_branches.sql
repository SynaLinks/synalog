WITH t_1_Products AS (SELECT * FROM VALUES
  ("laptop", 1000, "electronics"),
  ("phone", 500, "electronics"),
  ("book", 20, "media"),
  ("headphones", 150, "electronics")
AS UNUSED_TABLE_NAME(col0, col1, col2)),
t_0_SpecialProducts AS (SELECT * FROM (
  
    SELECT
      Products.col0 AS col0,
      "expensive" AS col1
    FROM
      t_1_Products AS Products
    WHERE
      (Products.col1 > 800)
   UNION ALL
  
    SELECT
      t_2_Products.col0 AS col0,
      "media_item" AS col1
    FROM
      t_1_Products AS t_2_Products
    WHERE
      (t_2_Products.col2 = "media")
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SpecialProducts.col0 AS name,
  SpecialProducts.col1 AS reason
FROM
  t_0_SpecialProducts AS SpecialProducts
GROUP BY 1, 2 ORDER BY name NULLS LAST;