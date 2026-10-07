WITH t_3_Order AS (SELECT * FROM VALUES
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
t_1_Trouble_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_2_Order.who AS who
    FROM
      t_3_Order AS t_2_Order
    WHERE
      (t_2_Order.state = "refunded")
   UNION ALL
  
    SELECT
      t_4_Order.who AS who
    FROM
      t_3_Order AS t_4_Order
    WHERE
      (t_4_Order.state = "pending")
  
) AS UNUSED_TABLE_NAME  ),
t_0_Trouble AS (SELECT
  Trouble_MultBodyAggAux.who AS who
FROM
  t_1_Trouble_MultBodyAggAux AS Trouble_MultBodyAggAux
GROUP BY 1),
t_7_Price AS (SELECT * FROM VALUES
  ("tea", 4),
  ("cake", 9),
  ("coffee", 6)
AS UNUSED_TABLE_NAME(item, p)),
t_5_Spend AS (SELECT
  t_6_Order.who AS who,
  SUM(((t_6_Order.n) * (Price.p))) AS total
FROM
  t_3_Order AS t_6_Order, t_7_Price AS Price
WHERE
  (t_6_Order.state = "paid") AND
  (Price.item = t_6_Order.item)
GROUP BY 1)
SELECT
  Trouble.who AS who
FROM
  t_0_Trouble AS Trouble
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_5_Spend AS Spend
  WHERE
    (Spend.who = Trouble.who)) IS NULL);
