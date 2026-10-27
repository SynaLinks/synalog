ATTACH DATABASE ':memory:' AS synalog_test;

DROP TABLE IF EXISTS synalog_test.Paid;
CREATE TABLE synalog_test.Paid AS WITH t_1_Order AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS who,
      'tea' AS item,
      3 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS who,
      'cake' AS item,
      1 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      3 AS id,
      'ann' AS who,
      'cake' AS item,
      2 AS n,
      'refunded' AS state
   UNION ALL
  
    SELECT
      4 AS id,
      'cy' AS who,
      'tea' AS item,
      5 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      5 AS id,
      'dee' AS who,
      'coffee' AS item,
      2 AS n,
      'pending' AS state
   UNION ALL
  
    SELECT
      6 AS id,
      'bob' AS who,
      'tea' AS item,
      1 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      7 AS id,
      'cy' AS who,
      'coffee' AS item,
      4 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      8 AS id,
      'ann' AS who,
      'coffee' AS item,
      1 AS n,
      'pending' AS state
   UNION ALL
  
    SELECT
      9 AS id,
      'eve' AS who,
      'cake' AS item,
      6 AS n,
      'paid' AS state
   UNION ALL
  
    SELECT
      10 AS id,
      'eve' AS who,
      'tea' AS item,
      2 AS n,
      'refunded' AS state
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_Order.id AS id,
  t_0_Order.who AS who,
  t_0_Order.item AS item,
  t_0_Order.n AS n
FROM
  t_1_Order AS t_0_Order
WHERE
  (t_0_Order.state = 'paid');

-- Interacting with table synalog_test.Paid

DROP TABLE IF EXISTS synalog_test.Line;
CREATE TABLE synalog_test.Line AS WITH t_0_Price AS (SELECT * FROM (
  
    SELECT
      'tea' AS item,
      4 AS p
   UNION ALL
  
    SELECT
      'cake' AS item,
      9 AS p
   UNION ALL
  
    SELECT
      'coffee' AS item,
      6 AS p
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Paid.id AS id,
  Paid.who AS who,
  ((Paid.n) * (Price.p)) AS amount
FROM
  synalog_test.Paid AS Paid, t_0_Price AS Price
WHERE
  (Price.item IS Paid.item);

-- Interacting with table synalog_test.Line

DROP TABLE IF EXISTS synalog_test.Spend;
CREATE TABLE synalog_test.Spend AS SELECT
  Line.who AS who,
  SUM(Line.amount) AS total
FROM
  synalog_test.Line AS Line
GROUP BY Line.who;

-- Interacting with table synalog_test.Spend

DROP TABLE IF EXISTS synalog_test.Tier;
CREATE TABLE synalog_test.Tier AS SELECT
  Spend.who AS who,
  CASE WHEN (Spend.total >= 40) THEN 'gold' WHEN (Spend.total >= 15) THEN 'silver' ELSE 'bronze' END AS tier
FROM
  synalog_test.Spend AS Spend;

-- Interacting with table synalog_test.Tier

DROP TABLE IF EXISTS synalog_test.TierCount;
CREATE TABLE synalog_test.TierCount AS SELECT
  Tier.tier AS tier,
  SUM(1) AS n
FROM
  synalog_test.Tier AS Tier
GROUP BY Tier.tier;

-- Interacting with table synalog_test.TierCount

SELECT
  TierCount.tier AS tier,
  TierCount.n AS n
FROM
  synalog_test.TierCount AS TierCount ORDER BY tier NULLS LAST, n NULLS LAST;
