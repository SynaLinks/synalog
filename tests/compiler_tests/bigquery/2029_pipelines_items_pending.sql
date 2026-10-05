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
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      "tea" AS item
    FROM
      t_2_Order AS t_1_Order
    WHERE
      (t_1_Order.item = "tea") AND
      (t_1_Order.state = "pending")
   UNION ALL
  
    SELECT
      "cake" AS item
    FROM
      t_2_Order AS t_3_Order
    WHERE
      (t_3_Order.item = "cake") AND
      (t_3_Order.state = "pending")
   UNION ALL
  
    SELECT
      "coffee" AS item
    FROM
      t_2_Order AS t_4_Order
    WHERE
      (t_4_Order.item = "coffee") AND
      (t_4_Order.state = "pending")
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.item AS item
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY item;
