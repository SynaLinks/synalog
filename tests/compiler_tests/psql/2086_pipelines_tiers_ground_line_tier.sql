-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.Line CASCADE;
CREATE TABLE logica_home.Line AS WITH t_1_Order AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_2_Price AS (SELECT * FROM (
  
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
  t_0_Order.id AS id,
  t_0_Order.who AS who,
  ((t_0_Order.n) * (Price.p)) AS amount
FROM
  t_1_Order AS t_0_Order, t_2_Price AS Price
WHERE
  (t_0_Order.state = 'paid') AND
  (Price.item = t_0_Order.item);

-- Interacting with table logica_home.Line

DROP TABLE IF EXISTS logica_home.Tier CASCADE;
CREATE TABLE logica_home.Tier AS WITH t_0_Spend AS (SELECT
  Line.who AS who,
  SUM(Line.amount) AS total
FROM
  logica_home.Line AS Line
GROUP BY Line.who)
SELECT
  Spend.who AS who,
  CASE WHEN (Spend.total >= 40) THEN 'gold' WHEN (Spend.total >= 15) THEN 'silver' ELSE 'bronze' END AS tier
FROM
  t_0_Spend AS Spend;

-- Interacting with table logica_home.Tier

WITH t_0_TierCount AS (SELECT
  t_1_Tier.tier AS tier,
  SUM(1) AS n
FROM
  logica_home.Tier AS t_1_Tier
GROUP BY t_1_Tier.tier)
SELECT
  TierCount.tier AS tier,
  TierCount.n AS n
FROM
  t_0_TierCount AS TierCount ORDER BY tier, n;
