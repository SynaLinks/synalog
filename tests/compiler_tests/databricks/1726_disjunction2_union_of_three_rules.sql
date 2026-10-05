WITH t_1_Ship AS (SELECT * FROM VALUES
  (1, "acme", "paris", "lyon", 12, "dhl"),
  (2, "acme", "lyon", "nice", 5, "ups"),
  (3, "bolt", "paris", "nice", 30, "dhl"),
  (4, "bolt", "nice", "rome", 8, "fedex"),
  (5, "cora", "rome", "milan", 14, "ups"),
  (6, "cora", "milan", "paris", 3, "dhl"),
  (7, "acme", "paris", "rome", 22, "fedex"),
  (8, "dune", "lyon", "paris", 9, "ups"),
  (9, "dune", "nice", "lyon", 11, "dhl")
AS UNUSED_TABLE_NAME(id, client, src, dst, kg, carrier)),
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
GROUP BY 1, 2 ORDER BY client NULLS LAST, carrier NULLS LAST;
