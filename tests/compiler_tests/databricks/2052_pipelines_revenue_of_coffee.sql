DROP TABLE IF EXISTS logica_test.Line;
CREATE TABLE logica_test.Line AS WITH t_1_Order AS (SELECT * FROM VALUES
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
t_2_Price AS (SELECT * FROM VALUES
  ("tea", 4),
  ("cake", 9),
  ("coffee", 6)
AS UNUSED_TABLE_NAME(item, p))
SELECT
  t_0_Order.id AS id,
  t_0_Order.who AS who,
  ((t_0_Order.n) * (Price.p)) AS amount
FROM
  t_1_Order AS t_0_Order, t_2_Price AS Price
WHERE
  (t_0_Order.state = "paid") AND
  (Price.item = t_0_Order.item);

-- Interacting with table logica_test.Line

WITH t_1_Order AS (SELECT * FROM VALUES
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
AS UNUSED_TABLE_NAME(id, who, item, n, state))
SELECT
  SUM(Line.amount) AS r
FROM
  logica_test.Line AS Line, t_1_Order
WHERE
  (Line.id = t_1_Order.id) AND
  ("coffee" = t_1_Order.item);
