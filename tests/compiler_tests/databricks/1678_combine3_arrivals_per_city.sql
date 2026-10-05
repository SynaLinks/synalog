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
AS UNUSED_TABLE_NAME(id, client, src, dst, kg, carrier)),
t_2_City_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_3_Ship.src AS c
    FROM
      t_0_Ship AS t_3_Ship
   UNION ALL
  
    SELECT
      t_4_Ship.dst AS c
    FROM
      t_0_Ship AS t_4_Ship
  
) AS UNUSED_TABLE_NAME  ),
t_1_City AS (SELECT
  City_MultBodyAggAux.c AS c
FROM
  t_2_City_MultBodyAggAux AS City_MultBodyAggAux
GROUP BY 1)
SELECT
  City.c AS c,
  COALESCE((SELECT
  SUM(1) AS logica_value
FROM
  t_0_Ship AS Ship
WHERE
  (Ship.dst = City.c)), 0) AS n
FROM
  t_1_City AS City ORDER BY c NULLS LAST, n NULLS LAST;
