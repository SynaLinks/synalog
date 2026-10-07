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
t_0_Person AS (SELECT
  t_1_Order.who AS who
FROM
  t_2_Order AS t_1_Order
GROUP BY 1),
t_5_Price AS (SELECT * FROM VALUES
  ("tea", 4),
  ("cake", 9),
  ("coffee", 6)
AS UNUSED_TABLE_NAME(item, p)),
t_3_Spend AS (SELECT
  t_4_Order.who AS who,
  SUM(((t_4_Order.n) * (Price.p))) AS total
FROM
  t_2_Order AS t_4_Order, t_5_Price AS Price
WHERE
  (t_4_Order.state = "paid") AND
  (Price.item = t_4_Order.item)
GROUP BY 1)
SELECT
  Person.who AS who
FROM
  t_0_Person AS Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_Spend AS Spend
  WHERE
    (Spend.who = Person.who)) IS NULL);
