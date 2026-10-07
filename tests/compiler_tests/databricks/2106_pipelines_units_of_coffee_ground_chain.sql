DROP TABLE IF EXISTS logica_test.Paid;
CREATE TABLE logica_test.Paid AS WITH t_1_Order AS (SELECT * FROM VALUES
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
  t_0_Order.id AS id,
  t_0_Order.who AS who,
  t_0_Order.item AS item,
  t_0_Order.n AS n
FROM
  t_1_Order AS t_0_Order
WHERE
  (t_0_Order.state = "paid");

-- Interacting with table logica_test.Paid

DROP TABLE IF EXISTS logica_test.Units;
CREATE TABLE logica_test.Units AS SELECT
  Paid.item AS item,
  SUM(Paid.n) AS u
FROM
  logica_test.Paid AS Paid
GROUP BY 1;

-- Interacting with table logica_test.Units

SELECT
  Units.u AS u
FROM
  logica_test.Units AS Units
WHERE
  (Units.item = "coffee");
