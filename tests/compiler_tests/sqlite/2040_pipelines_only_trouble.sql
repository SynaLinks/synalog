WITH t_3_Order AS (SELECT * FROM (
  
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
t_1_Trouble_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_2_Order.who AS who
    FROM
      t_3_Order AS t_2_Order
    WHERE
      (t_2_Order.state = 'refunded')
   UNION ALL
  
    SELECT
      t_4_Order.who AS who
    FROM
      t_3_Order AS t_4_Order
    WHERE
      (t_4_Order.state = 'pending')
  
) AS UNUSED_TABLE_NAME  ),
t_0_Trouble AS (SELECT
  Trouble_MultBodyAggAux.who AS who
FROM
  t_1_Trouble_MultBodyAggAux AS Trouble_MultBodyAggAux
GROUP BY Trouble_MultBodyAggAux.who),
t_7_Price AS (SELECT * FROM (
  
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
t_5_Spend AS (SELECT
  t_6_Order.who AS who,
  SUM(((t_6_Order.n) * (Price.p))) AS total
FROM
  t_3_Order AS t_6_Order, t_7_Price AS Price
WHERE
  (t_6_Order.state = 'paid') AND
  (Price.item = t_6_Order.item)
GROUP BY t_6_Order.who)
SELECT
  Trouble.who AS who
FROM
  t_0_Trouble AS Trouble
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    t_5_Spend AS Spend, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (Spend.who = Trouble.who)) IS NULL);
