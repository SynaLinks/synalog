DROP TABLE IF EXISTS synalog_home.Paid;
CREATE TABLE synalog_home.Paid AS WITH t_1_Order AS (SELECT * FROM VALUES
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

-- Interacting with table synalog_home.Paid

DROP TABLE IF EXISTS synalog_home.Line;
CREATE TABLE synalog_home.Line AS WITH t_0_Price AS (SELECT * FROM VALUES
  ("tea", 4),
  ("cake", 9),
  ("coffee", 6)
AS UNUSED_TABLE_NAME(item, p))
SELECT
  Paid.id AS id,
  Paid.who AS who,
  ((Paid.n) * (Price.p)) AS amount
FROM
  synalog_home.Paid AS Paid, t_0_Price AS Price
WHERE
  (Price.item = Paid.item);

-- Interacting with table synalog_home.Line

DROP TABLE IF EXISTS synalog_home.Spend;
CREATE TABLE synalog_home.Spend AS SELECT
  Line.who AS who,
  SUM(Line.amount) AS total
FROM
  synalog_home.Line AS Line
GROUP BY 1;

-- Interacting with table synalog_home.Spend

DROP TABLE IF EXISTS synalog_home.Tier;
CREATE TABLE synalog_home.Tier AS SELECT
  Spend.who AS who,
  CASE WHEN (Spend.total >= 40) THEN "gold" WHEN (Spend.total >= 15) THEN "silver" ELSE "bronze" END AS tier
FROM
  synalog_home.Spend AS Spend;

-- Interacting with table synalog_home.Tier

DROP TABLE IF EXISTS synalog_home.TierCount;
CREATE TABLE synalog_home.TierCount AS SELECT
  Tier.tier AS tier,
  SUM(1) AS n
FROM
  synalog_home.Tier AS Tier
GROUP BY 1;

-- Interacting with table synalog_home.TierCount

SELECT
  TierCount.tier AS tier,
  TierCount.n AS n
FROM
  synalog_home.TierCount AS TierCount ORDER BY tier NULLS LAST, n NULLS LAST;
