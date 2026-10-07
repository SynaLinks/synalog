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

WITH t_3_Price AS (SELECT * FROM VALUES
  ("tea", 4),
  ("cake", 9),
  ("coffee", 6)
AS UNUSED_TABLE_NAME(item, p)),
t_2_Spend AS (SELECT
  Paid.who AS who,
  SUM(((Paid.n) * (Price.p))) AS total
FROM
  logica_test.Paid AS Paid, t_3_Price AS Price
WHERE
  (Price.item = Paid.item)
GROUP BY 1),
t_0_TierCount AS (SELECT
  CASE WHEN (Spend.total >= 40) THEN "gold" WHEN (Spend.total >= 15) THEN "silver" ELSE "bronze" END AS tier,
  SUM(1) AS n
FROM
  t_2_Spend AS Spend
GROUP BY 1)
SELECT
  TierCount.tier AS tier,
  TierCount.n AS n
FROM
  t_0_TierCount AS TierCount ORDER BY tier NULLS LAST, n NULLS LAST;
