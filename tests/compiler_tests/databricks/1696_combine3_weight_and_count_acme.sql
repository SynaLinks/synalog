WITH t_0_Ship AS (SELECT * FROM VALUES
  (1, "acme", "paris", "lyon", 12, "dhl"),
  (2, "acme", "lyon", "nice", 5, "ups"),
  (3, "bolt", "paris", "nice", 30, "dhl"),
  (4, "bolt", "nice", "rome", 8, "fedex"),
  (5, "cora", "rome", "milan", 14, "ups"),
  (6, "cora", "milan", "paris", 3, "dhl"),
  (7, "acme", "paris", "rome", 22, "fedex"),
  (8, "dune", "lyon", "paris", 9, "ups"),
  (9, "dune", "nice", "lyon", 11, "dhl")
AS UNUSED_TABLE_NAME(id, client, src, dst, kg, carrier))
SELECT
  (SELECT
  SUM(Ship.kg) AS logica_value
FROM
  t_0_Ship AS Ship
WHERE
  (Ship.client = "acme")) AS t,
  (SELECT
  SUM(1) AS logica_value
FROM
  t_0_Ship AS t_1_Ship
WHERE
  (t_1_Ship.client = "acme")) AS n;
