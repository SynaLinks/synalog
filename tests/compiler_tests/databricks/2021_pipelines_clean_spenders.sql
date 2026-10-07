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
t_3_Price AS (SELECT * FROM VALUES
  ("tea", 4),
  ("cake", 9),
  ("coffee", 6)
AS UNUSED_TABLE_NAME(item, p)),
t_0_Spend AS (SELECT
  t_1_Order.who AS who,
  SUM(((t_1_Order.n) * (Price.p))) AS total
FROM
  t_2_Order AS t_1_Order, t_3_Price AS Price
WHERE
  (t_1_Order.state = "paid") AND
  (Price.item = t_1_Order.item)
GROUP BY 1),
t_5_Trouble_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_6_Order.who AS who
    FROM
      t_2_Order AS t_6_Order
    WHERE
      (t_6_Order.state = "refunded")
   UNION ALL
  
    SELECT
      t_7_Order.who AS who
    FROM
      t_2_Order AS t_7_Order
    WHERE
      (t_7_Order.state = "pending")
  
) AS UNUSED_TABLE_NAME  ),
t_4_Trouble AS (SELECT
  Trouble_MultBodyAggAux.who AS who
FROM
  t_5_Trouble_MultBodyAggAux AS Trouble_MultBodyAggAux
GROUP BY 1)
SELECT
  Spend.who AS who
FROM
  t_0_Spend AS Spend
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_4_Trouble AS Trouble
  WHERE
    (Trouble.who = Spend.who)) IS NULL) ORDER BY who NULLS LAST;
