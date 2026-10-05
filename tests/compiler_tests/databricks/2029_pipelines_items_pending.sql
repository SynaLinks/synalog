WITH t_2_Order AS (SELECT * FROM VALUES
  (1, "ann", "tea", 3, "paid"),
  (2, "bob", "cake", 1, "paid"),
  (3, "ann", "cake", 2, "refunded"),
  (4, "cy", "tea", 5, "paid"),
  (5, "dee", "coffee", 2, "pending"),
  (6, "bob", "tea", 1, "paid"),
  (7, "cy", "coffee", 4, "paid"),
  (8, "ann", "coffee", 1, "pending"),
  (9, "eve", "cake", 6, "paid"),
  (10, "eve", "tea", 2, "refunded")
AS UNUSED_TABLE_NAME(id, who, item, n, state)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      "tea" AS item
    FROM
      t_2_Order AS t_1_Order
    WHERE
      (t_1_Order.item = "tea") AND
      (t_1_Order.state = "pending")
   UNION ALL
  
    SELECT
      "cake" AS item
    FROM
      t_2_Order AS t_3_Order
    WHERE
      (t_3_Order.item = "cake") AND
      (t_3_Order.state = "pending")
   UNION ALL
  
    SELECT
      "coffee" AS item
    FROM
      t_2_Order AS t_4_Order
    WHERE
      (t_4_Order.item = "coffee") AND
      (t_4_Order.state = "pending")
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.item AS item
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1;
