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
t_4_Price AS (SELECT * FROM VALUES
  ("tea", 4),
  ("cake", 9),
  ("coffee", 6)
AS UNUSED_TABLE_NAME(item, p)),
t_1_Spend AS (SELECT
  t_2_Order.who AS who,
  SUM(((t_2_Order.n) * (Price.p))) AS total
FROM
  t_3_Order AS t_2_Order, t_4_Price AS Price
WHERE
  (t_2_Order.state = "paid") AND
  (Price.item = t_2_Order.item)
GROUP BY 1)
SELECT
  Spend.who AS a,
  t_0_Spend.who AS b
FROM
  t_1_Spend AS Spend, t_1_Spend AS t_0_Spend
WHERE
  (Spend.who < t_0_Spend.who) AND
  (((Spend.total) - (t_0_Spend.total)) <= 10) AND
  (((t_0_Spend.total) - (Spend.total)) <= 10) ORDER BY a NULLS LAST, b NULLS LAST;
