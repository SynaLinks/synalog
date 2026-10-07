DROP TABLE IF EXISTS logica_test.Tier;
CREATE TABLE logica_test.Tier AS WITH t_2_Order AS (SELECT * FROM VALUES
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
AS UNUSED_TABLE_NAME(item, p)),
t_0_Spend AS (SELECT
  t_1_Order.who AS who,
  SUM(((t_1_Order.n) * (Price.p))) AS total
FROM
  t_2_Order AS t_1_Order, t_2_Price AS Price
WHERE
  (t_1_Order.state = "paid") AND
  (Price.item = t_1_Order.item)
GROUP BY 1)
SELECT
  Spend.who AS who,
  CASE WHEN (Spend.total >= 40) THEN "gold" WHEN (Spend.total >= 15) THEN "silver" ELSE "bronze" END AS tier
FROM
  t_0_Spend AS Spend;

-- Interacting with table logica_test.Tier

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
t_3_NoTier AS (SELECT
  t_4_Person.who AS who
FROM
  t_0_Person AS t_4_Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Tier AS t_6_Tier
  WHERE
    (t_6_Tier.who = t_4_Person.who)) IS NULL))
SELECT
  1 AS ok
FROM
  t_0_Person AS Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_NoTier AS NoTier
  WHERE
    (NoTier.who = "cy")) IS NULL) AND
  (Person.who = "cy");
