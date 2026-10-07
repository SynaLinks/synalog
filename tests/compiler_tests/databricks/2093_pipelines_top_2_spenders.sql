DROP TABLE IF EXISTS logica_test.Spend;
CREATE TABLE logica_test.Spend AS WITH t_1_Order AS (SELECT * FROM VALUES
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
  t_0_Order.who AS who,
  SUM(((t_0_Order.n) * (Price.p))) AS total
FROM
  t_1_Order AS t_0_Order, t_2_Price AS Price
WHERE
  (t_0_Order.state = "paid") AND
  (Price.item = t_0_Order.item)
GROUP BY 1;

-- Interacting with table logica_test.Spend

SELECT
  Spend.who AS who,
  Spend.total AS total
FROM
  logica_test.Spend AS Spend ORDER BY total desc, who NULLS LAST LIMIT 2;
