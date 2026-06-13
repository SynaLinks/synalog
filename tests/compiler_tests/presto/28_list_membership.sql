WITH t_0_Items AS (SELECT * FROM (
  
    SELECT
      'apple' AS col0,
      'fruit' AS col1,
      1.50 AS col2
   UNION ALL
  
    SELECT
      'banana' AS col0,
      'fruit' AS col1,
      0.75 AS col2
   UNION ALL
  
    SELECT
      'carrot' AS col0,
      'vegetable' AS col1,
      0.50 AS col2
   UNION ALL
  
    SELECT
      'milk' AS col0,
      'dairy' AS col1,
      2.00 AS col2
   UNION ALL
  
    SELECT
      'bread' AS col0,
      'grain' AS col1,
      1.25 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Items.col0 AS name,
  Items.col2 AS price
FROM
  t_0_Items AS Items, UNNEST(ARRAY['fruit', 'vegetable']) as pushkin(x_9)
WHERE
  (Items.col1 = x_9) ORDER BY name;