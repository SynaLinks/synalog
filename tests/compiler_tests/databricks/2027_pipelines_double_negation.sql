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
t_8_Price AS (SELECT * FROM VALUES
  ("tea", 4),
  ("cake", 9),
  ("coffee", 6)
AS UNUSED_TABLE_NAME(item, p)),
t_6_Spend AS (SELECT
  t_7_Order.who AS who,
  SUM(((t_7_Order.n) * (Price.p))) AS total
FROM
  t_2_Order AS t_7_Order, t_8_Price AS Price
WHERE
  (t_7_Order.state = "paid") AND
  (Price.item = t_7_Order.item)
GROUP BY 1),
t_3_Never AS (SELECT
  t_4_Person.who AS who
FROM
  t_0_Person AS t_4_Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_6_Spend AS Spend
  WHERE
    (Spend.who = t_4_Person.who)) IS NULL))
SELECT
  Person.who AS who
FROM
  t_0_Person AS Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_Never AS Never
  WHERE
    (Never.who = Person.who)) IS NULL) ORDER BY who NULLS LAST;
