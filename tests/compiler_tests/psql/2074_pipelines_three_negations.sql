-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_Order AS (SELECT * FROM (
  
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
t_3_Price AS (SELECT * FROM (
  
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
t_0_Spend AS (SELECT
  t_1_Order.who AS who,
  SUM(((t_1_Order.n) * (Price.p))) AS total
FROM
  t_2_Order AS t_1_Order, t_3_Price AS Price
WHERE
  (t_1_Order.state = 'paid') AND
  (COALESCE(Price.item, '') = COALESCE(t_1_Order.item, '') AND (Price.item IS NULL) = (t_1_Order.item IS NULL))
GROUP BY t_1_Order.who),
t_4_Ref AS (SELECT
  t_5_Order.who AS who
FROM
  t_2_Order AS t_5_Order
WHERE
  (t_5_Order.state = 'refunded')
GROUP BY t_5_Order.who),
t_6_Pen AS (SELECT
  t_7_Order.who AS who
FROM
  t_2_Order AS t_7_Order
WHERE
  (t_7_Order.state = 'pending')
GROUP BY t_7_Order.who)
SELECT
  Spend.who AS who
FROM
  t_0_Spend AS Spend
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_24 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_4_Ref AS Ref, UNNEST(ARRAY[0]) as x_24
  WHERE
    (COALESCE(Ref.who, '') = COALESCE(Spend.who, '') AND (Ref.who IS NULL) = (Spend.who IS NULL))) AS numeric) IS NULL) AND
  (CAST((SELECT
    MIN((CASE WHEN x_30 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_6_Pen AS Pen, UNNEST(ARRAY[0]) as x_30
  WHERE
    (COALESCE(Pen.who, '') = COALESCE(Spend.who, '') AND (Pen.who IS NULL) = (Spend.who IS NULL))) AS numeric) IS NULL) ORDER BY who;
