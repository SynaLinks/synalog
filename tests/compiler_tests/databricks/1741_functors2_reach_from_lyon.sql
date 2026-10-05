DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f3;
CREATE TABLE logica_test.Reach_sn_delta_f3 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_0_Reach_MultBodyAggAux_f1_f3 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1_f3.a AS a,
  Reach_MultBodyAggAux_f1_f3.b AS b
FROM
  t_0_Reach_MultBodyAggAux_f1_f3 AS Reach_MultBodyAggAux_f1_f3
GROUP BY 1, 2;

-- Interacting with table logica_test.Reach_sn_delta_f3

DROP TABLE IF EXISTS logica_test.Reach_sn_full_f3;
CREATE TABLE logica_test.Reach_sn_full_f3 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_4_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, t_1_Ship AS t_4_Ship
    WHERE
      (t_2_Reach_sn_delta_f3.b = t_4_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f3 AS (SELECT
  Reach_MultBodyAggAux_f2_f3.a AS a,
  Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2_f3 AS Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Reach_sn_delta_f3.a AS a,
      Reach_sn_delta_f3.b AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS Reach_sn_delta_f3
   UNION ALL
  
    SELECT
      Reach_sn_step_f3.a AS a,
      Reach_sn_step_f3.b AS b
    FROM
      t_0_Reach_sn_step_f3 AS Reach_sn_step_f3
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reach_sn_full_f3

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f3;
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_4_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, t_1_Ship AS t_4_Ship
    WHERE
      (t_2_Reach_sn_delta_f3.b = t_4_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f3 AS (SELECT
  Reach_MultBodyAggAux_f2_f3.a AS a,
  Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2_f3 AS Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f3.a AS a,
  Reach_sn_step_f3.b AS b
FROM
  t_0_Reach_sn_step_f3 AS Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f3 AS Reach_sn_full_f3
  WHERE
    (Reach_sn_full_f3.a = Reach_sn_step_f3.a) AND
    (Reach_sn_full_f3.b = Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f3 SELECT * FROM logica_test.Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f3;
CREATE TABLE logica_test.Reach_sn_delta_f3 AS SELECT
  Reach_sn_new_f3.a AS a,
  Reach_sn_new_f3.b AS b
FROM
  logica_test.Reach_sn_new_f3 AS Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f3;
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_4_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, t_1_Ship AS t_4_Ship
    WHERE
      (t_2_Reach_sn_delta_f3.b = t_4_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f3 AS (SELECT
  Reach_MultBodyAggAux_f2_f3.a AS a,
  Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2_f3 AS Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f3.a AS a,
  Reach_sn_step_f3.b AS b
FROM
  t_0_Reach_sn_step_f3 AS Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f3 AS Reach_sn_full_f3
  WHERE
    (Reach_sn_full_f3.a = Reach_sn_step_f3.a) AND
    (Reach_sn_full_f3.b = Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f3 SELECT * FROM logica_test.Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f3;
CREATE TABLE logica_test.Reach_sn_delta_f3 AS SELECT
  Reach_sn_new_f3.a AS a,
  Reach_sn_new_f3.b AS b
FROM
  logica_test.Reach_sn_new_f3 AS Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f3;
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_4_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, t_1_Ship AS t_4_Ship
    WHERE
      (t_2_Reach_sn_delta_f3.b = t_4_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f3 AS (SELECT
  Reach_MultBodyAggAux_f2_f3.a AS a,
  Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2_f3 AS Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f3.a AS a,
  Reach_sn_step_f3.b AS b
FROM
  t_0_Reach_sn_step_f3 AS Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f3 AS Reach_sn_full_f3
  WHERE
    (Reach_sn_full_f3.a = Reach_sn_step_f3.a) AND
    (Reach_sn_full_f3.b = Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f3 SELECT * FROM logica_test.Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f3;
CREATE TABLE logica_test.Reach_sn_delta_f3 AS SELECT
  Reach_sn_new_f3.a AS a,
  Reach_sn_new_f3.b AS b
FROM
  logica_test.Reach_sn_new_f3 AS Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f3;
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_4_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, t_1_Ship AS t_4_Ship
    WHERE
      (t_2_Reach_sn_delta_f3.b = t_4_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f3 AS (SELECT
  Reach_MultBodyAggAux_f2_f3.a AS a,
  Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2_f3 AS Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f3.a AS a,
  Reach_sn_step_f3.b AS b
FROM
  t_0_Reach_sn_step_f3 AS Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f3 AS Reach_sn_full_f3
  WHERE
    (Reach_sn_full_f3.a = Reach_sn_step_f3.a) AND
    (Reach_sn_full_f3.b = Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f3 SELECT * FROM logica_test.Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f3;
CREATE TABLE logica_test.Reach_sn_delta_f3 AS SELECT
  Reach_sn_new_f3.a AS a,
  Reach_sn_new_f3.b AS b
FROM
  logica_test.Reach_sn_new_f3 AS Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f3;
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_4_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, t_1_Ship AS t_4_Ship
    WHERE
      (t_2_Reach_sn_delta_f3.b = t_4_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f3 AS (SELECT
  Reach_MultBodyAggAux_f2_f3.a AS a,
  Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2_f3 AS Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f3.a AS a,
  Reach_sn_step_f3.b AS b
FROM
  t_0_Reach_sn_step_f3 AS Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f3 AS Reach_sn_full_f3
  WHERE
    (Reach_sn_full_f3.a = Reach_sn_step_f3.a) AND
    (Reach_sn_full_f3.b = Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f3 SELECT * FROM logica_test.Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f3;
CREATE TABLE logica_test.Reach_sn_delta_f3 AS SELECT
  Reach_sn_new_f3.a AS a,
  Reach_sn_new_f3.b AS b
FROM
  logica_test.Reach_sn_new_f3 AS Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f3;
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_4_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, t_1_Ship AS t_4_Ship
    WHERE
      (t_2_Reach_sn_delta_f3.b = t_4_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f3 AS (SELECT
  Reach_MultBodyAggAux_f2_f3.a AS a,
  Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2_f3 AS Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f3.a AS a,
  Reach_sn_step_f3.b AS b
FROM
  t_0_Reach_sn_step_f3 AS Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f3 AS Reach_sn_full_f3
  WHERE
    (Reach_sn_full_f3.a = Reach_sn_step_f3.a) AND
    (Reach_sn_full_f3.b = Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f3 SELECT * FROM logica_test.Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f3;
CREATE TABLE logica_test.Reach_sn_delta_f3 AS SELECT
  Reach_sn_new_f3.a AS a,
  Reach_sn_new_f3.b AS b
FROM
  logica_test.Reach_sn_new_f3 AS Reach_sn_new_f3;

SELECT
  Reach_sn_full_f3.b AS b
FROM
  logica_test.Reach_sn_full_f3 AS Reach_sn_full_f3
WHERE
  ("lyon" = Reach_sn_full_f3.a) ORDER BY b NULLS LAST;
