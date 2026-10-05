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
  (Price.item = t_1_Order.item)
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
  ((SELECT
    MIN(MagicalEntangle(1, x_24.value)) AS logica_value
  FROM
    t_4_Ref AS Ref, JSON_EACH(JSON_ARRAY(0)) as x_24
  WHERE
    (Ref.who = Spend.who)) IS NULL) AND
  ((SELECT
    MIN(MagicalEntangle(1, x_30.value)) AS logica_value
  FROM
    t_6_Pen AS Pen, JSON_EACH(JSON_ARRAY(0)) as x_30
  WHERE
    (Pen.who = Spend.who)) IS NULL) ORDER BY who NULLS LAST;
