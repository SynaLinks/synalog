WITH t_4_Order AS (SELECT * FROM VALUES
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
t_2_Any_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_3_Order.id AS id,
      t_3_Order.who AS who
    FROM
      t_4_Order AS t_3_Order
    WHERE
      (t_3_Order.state = "paid")
   UNION ALL
  
    SELECT
      t_5_Order.id AS id,
      t_5_Order.who AS who
    FROM
      t_4_Order AS t_5_Order
    WHERE
      (t_5_Order.state != "paid")
  
) AS UNUSED_TABLE_NAME  ),
t_1_Any AS (SELECT
  Any_MultBodyAggAux.id AS id,
  Any_MultBodyAggAux.who AS who
FROM
  t_2_Any_MultBodyAggAux AS Any_MultBodyAggAux
GROUP BY 1, 2)
SELECT
  SUM(1) AS n
FROM
  t_1_Any AS t_0_Any
WHERE
  (t_0_Any.who = "dee");
