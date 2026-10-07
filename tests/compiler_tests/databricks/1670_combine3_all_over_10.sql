WITH t_2_Ship AS (SELECT * FROM VALUES
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
t_1_Client AS (SELECT
  Ship.client AS client
FROM
  t_2_Ship AS Ship
GROUP BY 1)
SELECT
  t_0_Client.client AS client
FROM
  t_1_Client AS t_0_Client
WHERE
  ((SELECT
    MIN(t_3_Ship.kg) AS logica_value
  FROM
    t_2_Ship AS t_3_Ship
  WHERE
    (t_3_Ship.client = t_0_Client.client)) > 10);
