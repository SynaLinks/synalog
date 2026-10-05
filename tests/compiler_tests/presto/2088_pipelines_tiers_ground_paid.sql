DROP TABLE IF EXISTS logica_test.Paid;
CREATE TABLE logica_test.Paid AS WITH t_1_Order AS (SELECT * FROM (
  
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

-- Interacting with table logica_test.Paid

WITH t_3_Price AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_2_Spend AS (SELECT
  Paid.who AS who,
  SUM(((Paid.n) * (Price.p))) AS total
FROM
  logica_test.Paid AS Paid, t_3_Price AS Price
WHERE
  (Price.item = Paid.item)
GROUP BY 1),
t_0_TierCount AS (SELECT
  CASE WHEN (Spend.total >= 40) THEN 'gold' WHEN (Spend.total >= 15) THEN 'silver' ELSE 'bronze' END AS tier,
  SUM(1) AS n
FROM
  t_2_Spend AS Spend
GROUP BY 1)
SELECT
  TierCount.tier AS tier,
  TierCount.n AS n
FROM
  t_0_TierCount AS TierCount ORDER BY tier, n;
