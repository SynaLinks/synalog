WITH t_1_Ship AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "acme" AS client,
      "paris" AS src,
      "lyon" AS dst,
      12 AS kg,
      "dhl" AS carrier
   UNION ALL
  
    SELECT
      2 AS id,
      "acme" AS client,
      "lyon" AS src,
      "nice" AS dst,
      5 AS kg,
      "ups" AS carrier
   UNION ALL
  
    SELECT
      3 AS id,
      "bolt" AS client,
      "paris" AS src,
      "nice" AS dst,
      30 AS kg,
      "dhl" AS carrier
   UNION ALL
  
    SELECT
      4 AS id,
      "bolt" AS client,
      "nice" AS src,
      "rome" AS dst,
      8 AS kg,
      "fedex" AS carrier
   UNION ALL
  
    SELECT
      5 AS id,
      "cora" AS client,
      "rome" AS src,
      "milan" AS dst,
      14 AS kg,
      "ups" AS carrier
   UNION ALL
  
    SELECT
      6 AS id,
      "cora" AS client,
      "milan" AS src,
      "paris" AS dst,
      3 AS kg,
      "dhl" AS carrier
   UNION ALL
  
    SELECT
      7 AS id,
      "acme" AS client,
      "paris" AS src,
      "rome" AS dst,
      22 AS kg,
      "fedex" AS carrier
   UNION ALL
  
    SELECT
      8 AS id,
      "dune" AS client,
      "lyon" AS src,
      "paris" AS dst,
      9 AS kg,
      "ups" AS carrier
   UNION ALL
  
    SELECT
      9 AS id,
      "dune" AS client,
      "nice" AS src,
      "lyon" AS dst,
      11 AS kg,
      "dhl" AS carrier
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Ship.client AS client,
      "dhl" AS carrier
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "dhl")
   UNION ALL
  
    SELECT
      t_2_Ship.client AS client,
      "fedex" AS carrier
    FROM
      t_1_Ship AS t_2_Ship
    WHERE
      (t_2_Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      t_3_Ship.client AS client,
      "ups" AS carrier
    FROM
      t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "ups")
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.client AS client,
  Q_MultBodyAggAux.carrier AS carrier
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY client, carrier ORDER BY client, carrier;