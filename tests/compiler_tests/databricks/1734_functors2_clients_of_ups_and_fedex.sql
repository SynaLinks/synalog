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
t_0_X AS (SELECT
  Ship.client AS client
FROM
  t_1_Ship AS Ship
WHERE
  (Ship.carrier = "ups")
GROUP BY 1),
t_2_Y AS (SELECT
  t_3_Ship.client AS client
FROM
  t_1_Ship AS t_3_Ship
WHERE
  (t_3_Ship.carrier = "fedex")
GROUP BY 1)
SELECT
  X.client AS client
FROM
  t_0_X AS X, t_2_Y AS Y
WHERE
  (Y.client = X.client);
