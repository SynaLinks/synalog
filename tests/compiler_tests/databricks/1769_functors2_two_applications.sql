WITH t_3_Ship AS (SELECT * FROM VALUES
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
t_2_H AS (SELECT
  SUM(Ship.kg) AS t
FROM
  t_3_Ship AS Ship
WHERE
  (Ship.kg > 10)),
t_4_L AS (SELECT
  SUM(t_5_Ship.kg) AS t
FROM
  t_3_Ship AS t_5_Ship
WHERE
  (t_5_Ship.kg <= 10))
SELECT
  t_0_H.t AS h,
  t_1_L.t AS l
FROM
  t_2_H AS t_0_H, t_4_L AS t_1_L;
