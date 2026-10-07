WITH t_2_Order AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "ann" AS who,
      "tea" AS item,
      3 AS n,
      "paid" AS state
   UNION ALL
  
    SELECT
      2 AS id,
      "bob" AS who,
      "cake" AS item,
      1 AS n,
      "paid" AS state
   UNION ALL
  
    SELECT
      3 AS id,
      "ann" AS who,
      "cake" AS item,
      2 AS n,
      "refunded" AS state
   UNION ALL
  
    SELECT
      4 AS id,
      "cy" AS who,
      "tea" AS item,
      5 AS n,
      "paid" AS state
   UNION ALL
  
    SELECT
      5 AS id,
      "dee" AS who,
      "coffee" AS item,
      2 AS n,
      "pending" AS state
   UNION ALL
  
    SELECT
      6 AS id,
      "bob" AS who,
      "tea" AS item,
      1 AS n,
      "paid" AS state
   UNION ALL
  
    SELECT
      7 AS id,
      "cy" AS who,
      "coffee" AS item,
      4 AS n,
      "paid" AS state
   UNION ALL
  
    SELECT
      8 AS id,
      "ann" AS who,
      "coffee" AS item,
      1 AS n,
      "pending" AS state
   UNION ALL
  
    SELECT
      9 AS id,
      "eve" AS who,
      "cake" AS item,
      6 AS n,
      "paid" AS state
   UNION ALL
  
    SELECT
      10 AS id,
      "eve" AS who,
      "tea" AS item,
      2 AS n,
      "refunded" AS state
  
) AS UNUSED_TABLE_NAME  ),
t_0_Person AS (SELECT
  t_1_Order.who AS who
FROM
  t_2_Order AS t_1_Order
GROUP BY who),
t_8_Price AS (SELECT * FROM (
  
    SELECT
      "tea" AS item,
      4 AS p
   UNION ALL
  
    SELECT
      "cake" AS item,
      9 AS p
   UNION ALL
  
    SELECT
      "coffee" AS item,
      6 AS p
  
) AS UNUSED_TABLE_NAME  ),
t_6_Spend AS (SELECT
  t_7_Order.who AS who,
  SUM(((t_7_Order.n) * (Price.p))) AS total
FROM
  t_2_Order AS t_7_Order, t_8_Price AS Price
WHERE
  (t_7_Order.state = "paid") AND
  (Price.item = t_7_Order.item)
GROUP BY who),
t_3_Never AS (SELECT
  t_4_Person.who AS who
FROM
  t_0_Person AS t_4_Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_6_Spend AS Spend
  WHERE
    (Spend.who = t_4_Person.who)) IS NULL))
SELECT
  Person.who AS who
FROM
  t_0_Person AS Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_Never AS Never
  WHERE
    (Never.who = Person.who)) IS NULL) ORDER BY who NULLS LAST;
