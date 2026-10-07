WITH t_4_Order AS (SELECT * FROM VALUES
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
t_5_Price AS (SELECT * FROM VALUES
  ("tea", 4),
  ("cake", 9),
  ("coffee", 6)
AS UNUSED_TABLE_NAME(item, p)),
t_2_Spend AS (SELECT
  t_3_Order.who AS who,
  SUM(((t_3_Order.n) * (Price.p))) AS total
FROM
  t_4_Order AS t_3_Order, t_5_Price AS Price
WHERE
  (t_3_Order.state = "paid") AND
  (Price.item = t_3_Order.item)
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
