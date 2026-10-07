WITH t_5_Order AS (SELECT * FROM VALUES
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
t_6_Price AS (SELECT * FROM VALUES
  ("tea", 4),
  ("cake", 9),
  ("coffee", 6)
AS UNUSED_TABLE_NAME(item, p)),
t_3_Spend AS (SELECT
  t_4_Order.who AS who,
  SUM(((t_4_Order.n) * (Price.p))) AS total
FROM
  t_5_Order AS t_4_Order, t_6_Price AS Price
WHERE
  (t_4_Order.state = "paid") AND
  (Price.item = t_4_Order.item)
GROUP BY 1),
t_0_S AS (SELECT
  Spend.who AS w0,
  t_1_Spend.who AS w1,
  t_2_Spend.who AS w2
FROM
  t_3_Spend AS Spend, t_3_Spend AS t_1_Spend, t_3_Spend AS t_2_Spend
WHERE
  (Spend.who < t_1_Spend.who) AND
  (t_1_Spend.who < t_2_Spend.who)
GROUP BY 1, 2, 3)
SELECT
  SUM(1) AS n
FROM
  t_0_S AS S;
