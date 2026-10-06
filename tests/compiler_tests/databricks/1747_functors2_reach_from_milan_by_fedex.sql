DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f8;
CREATE TABLE logica_test.Reach_sn_delta_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_0_Reach_MultBodyAggAux_f1_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1_f8.a AS a,
  Reach_MultBodyAggAux_f1_f8.b AS b
FROM
  t_0_Reach_MultBodyAggAux_f1_f8 AS Reach_MultBodyAggAux_f1_f8
GROUP BY 1, 2;

-- Interacting with table logica_test.Reach_sn_delta_f8

DROP TABLE IF EXISTS logica_test.Reach_sn_t0_f8;
CREATE TABLE logica_test.Reach_sn_t0_f8 AS SELECT
  Reach_sn_delta_f8.a AS a,
  Reach_sn_delta_f8.b AS b
FROM
  logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t0_f8

DROP TABLE IF EXISTS logica_test.Reach_sn_t1_f8;
CREATE TABLE logica_test.Reach_sn_t1_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f2_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      Reach_sn_t0_f8.a AS a,
      t_3_Ship.dst AS b
    FROM
      logica_test.Reach_sn_t0_f8 AS Reach_sn_t0_f8, t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "fedex") AND
      (Reach_sn_t0_f8.b = t_3_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r1_f8 AS (SELECT
  Reach_MultBodyAggAux_f2_f8.a AS a,
  Reach_MultBodyAggAux_f2_f8.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2_f8 AS Reach_MultBodyAggAux_f2_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_r1_f8.a AS a,
  Reach_sn_r1_f8.b AS b
FROM
  t_0_Reach_sn_r1_f8 AS Reach_sn_r1_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t1_f8

DROP TABLE IF EXISTS logica_test.Reach_sn_t2_f8;
CREATE TABLE logica_test.Reach_sn_t2_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f3_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      Reach_sn_t1_f8.a AS a,
      t_3_Ship.dst AS b
    FROM
      logica_test.Reach_sn_t1_f8 AS Reach_sn_t1_f8, t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "fedex") AND
      (Reach_sn_t1_f8.b = t_3_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r2_f8 AS (SELECT
  Reach_MultBodyAggAux_f3_f8.a AS a,
  Reach_MultBodyAggAux_f3_f8.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f3_f8 AS Reach_MultBodyAggAux_f3_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_r2_f8.a AS a,
  Reach_sn_r2_f8.b AS b
FROM
  t_0_Reach_sn_r2_f8 AS Reach_sn_r2_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t2_f8

DROP TABLE IF EXISTS logica_test.Reach_sn_t3_f8;
CREATE TABLE logica_test.Reach_sn_t3_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f4_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      Reach_sn_t2_f8.a AS a,
      t_3_Ship.dst AS b
    FROM
      logica_test.Reach_sn_t2_f8 AS Reach_sn_t2_f8, t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "fedex") AND
      (Reach_sn_t2_f8.b = t_3_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r3_f8 AS (SELECT
  Reach_MultBodyAggAux_f4_f8.a AS a,
  Reach_MultBodyAggAux_f4_f8.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f4_f8 AS Reach_MultBodyAggAux_f4_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_r3_f8.a AS a,
  Reach_sn_r3_f8.b AS b
FROM
  t_0_Reach_sn_r3_f8 AS Reach_sn_r3_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t3_f8

DROP TABLE IF EXISTS logica_test.Reach_sn_t4_f8;
CREATE TABLE logica_test.Reach_sn_t4_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f5_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      Reach_sn_t3_f8.a AS a,
      t_3_Ship.dst AS b
    FROM
      logica_test.Reach_sn_t3_f8 AS Reach_sn_t3_f8, t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "fedex") AND
      (Reach_sn_t3_f8.b = t_3_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r4_f8 AS (SELECT
  Reach_MultBodyAggAux_f5_f8.a AS a,
  Reach_MultBodyAggAux_f5_f8.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f5_f8 AS Reach_MultBodyAggAux_f5_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_r4_f8.a AS a,
  Reach_sn_r4_f8.b AS b
FROM
  t_0_Reach_sn_r4_f8 AS Reach_sn_r4_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t4_f8

DROP TABLE IF EXISTS logica_test.Reach_sn_t5_f8;
CREATE TABLE logica_test.Reach_sn_t5_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f6_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      Reach_sn_t4_f8.a AS a,
      t_3_Ship.dst AS b
    FROM
      logica_test.Reach_sn_t4_f8 AS Reach_sn_t4_f8, t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "fedex") AND
      (Reach_sn_t4_f8.b = t_3_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r5_f8 AS (SELECT
  Reach_MultBodyAggAux_f6_f8.a AS a,
  Reach_MultBodyAggAux_f6_f8.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f6_f8 AS Reach_MultBodyAggAux_f6_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_r5_f8.a AS a,
  Reach_sn_r5_f8.b AS b
FROM
  t_0_Reach_sn_r5_f8 AS Reach_sn_r5_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t5_f8

DROP TABLE IF EXISTS logica_test.Reach_sn_full_f8;
CREATE TABLE logica_test.Reach_sn_full_f8 AS SELECT * FROM (
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      Reach_sn_delta_f8.b AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8
   UNION ALL
  
    SELECT
      Reach_sn_t1_f8.a AS a,
      Reach_sn_t1_f8.b AS b
    FROM
      logica_test.Reach_sn_t1_f8 AS Reach_sn_t1_f8
   UNION ALL
  
    SELECT
      Reach_sn_t2_f8.a AS a,
      Reach_sn_t2_f8.b AS b
    FROM
      logica_test.Reach_sn_t2_f8 AS Reach_sn_t2_f8
   UNION ALL
  
    SELECT
      Reach_sn_t3_f8.a AS a,
      Reach_sn_t3_f8.b AS b
    FROM
      logica_test.Reach_sn_t3_f8 AS Reach_sn_t3_f8
   UNION ALL
  
    SELECT
      Reach_sn_t4_f8.a AS a,
      Reach_sn_t4_f8.b AS b
    FROM
      logica_test.Reach_sn_t4_f8 AS Reach_sn_t4_f8
   UNION ALL
  
    SELECT
      Reach_sn_t5_f8.a AS a,
      Reach_sn_t5_f8.b AS b
    FROM
      logica_test.Reach_sn_t5_f8 AS Reach_sn_t5_f8
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reach_sn_full_f8

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f8;
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_3_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "fedex") AND
      (Reach_sn_delta_f8.b = t_3_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f8 AS (SELECT
  Reach_MultBodyAggAux_f7_f8.a AS a,
  Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f7_f8 AS Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f8.a AS a,
  Reach_sn_step_f8.b AS b
FROM
  t_0_Reach_sn_step_f8 AS Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f8 AS Reach_sn_full_f8
  WHERE
    (Reach_sn_full_f8.a = Reach_sn_step_f8.a) AND
    (Reach_sn_full_f8.b = Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f8 SELECT * FROM logica_test.Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f8;
CREATE TABLE logica_test.Reach_sn_delta_f8 AS SELECT
  Reach_sn_new_f8.a AS a,
  Reach_sn_new_f8.b AS b
FROM
  logica_test.Reach_sn_new_f8 AS Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f8;
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_3_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "fedex") AND
      (Reach_sn_delta_f8.b = t_3_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f8 AS (SELECT
  Reach_MultBodyAggAux_f7_f8.a AS a,
  Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f7_f8 AS Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f8.a AS a,
  Reach_sn_step_f8.b AS b
FROM
  t_0_Reach_sn_step_f8 AS Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f8 AS Reach_sn_full_f8
  WHERE
    (Reach_sn_full_f8.a = Reach_sn_step_f8.a) AND
    (Reach_sn_full_f8.b = Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f8 SELECT * FROM logica_test.Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f8;
CREATE TABLE logica_test.Reach_sn_delta_f8 AS SELECT
  Reach_sn_new_f8.a AS a,
  Reach_sn_new_f8.b AS b
FROM
  logica_test.Reach_sn_new_f8 AS Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f8;
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_3_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "fedex") AND
      (Reach_sn_delta_f8.b = t_3_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f8 AS (SELECT
  Reach_MultBodyAggAux_f7_f8.a AS a,
  Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f7_f8 AS Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f8.a AS a,
  Reach_sn_step_f8.b AS b
FROM
  t_0_Reach_sn_step_f8 AS Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f8 AS Reach_sn_full_f8
  WHERE
    (Reach_sn_full_f8.a = Reach_sn_step_f8.a) AND
    (Reach_sn_full_f8.b = Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f8 SELECT * FROM logica_test.Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f8;
CREATE TABLE logica_test.Reach_sn_delta_f8 AS SELECT
  Reach_sn_new_f8.a AS a,
  Reach_sn_new_f8.b AS b
FROM
  logica_test.Reach_sn_new_f8 AS Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f8;
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_3_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "fedex") AND
      (Reach_sn_delta_f8.b = t_3_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f8 AS (SELECT
  Reach_MultBodyAggAux_f7_f8.a AS a,
  Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f7_f8 AS Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f8.a AS a,
  Reach_sn_step_f8.b AS b
FROM
  t_0_Reach_sn_step_f8 AS Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f8 AS Reach_sn_full_f8
  WHERE
    (Reach_sn_full_f8.a = Reach_sn_step_f8.a) AND
    (Reach_sn_full_f8.b = Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f8 SELECT * FROM logica_test.Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f8;
CREATE TABLE logica_test.Reach_sn_delta_f8 AS SELECT
  Reach_sn_new_f8.a AS a,
  Reach_sn_new_f8.b AS b
FROM
  logica_test.Reach_sn_new_f8 AS Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f8;
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_3_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "fedex") AND
      (Reach_sn_delta_f8.b = t_3_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f8 AS (SELECT
  Reach_MultBodyAggAux_f7_f8.a AS a,
  Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f7_f8 AS Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f8.a AS a,
  Reach_sn_step_f8.b AS b
FROM
  t_0_Reach_sn_step_f8 AS Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f8 AS Reach_sn_full_f8
  WHERE
    (Reach_sn_full_f8.a = Reach_sn_step_f8.a) AND
    (Reach_sn_full_f8.b = Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f8 SELECT * FROM logica_test.Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f8;
CREATE TABLE logica_test.Reach_sn_delta_f8 AS SELECT
  Reach_sn_new_f8.a AS a,
  Reach_sn_new_f8.b AS b
FROM
  logica_test.Reach_sn_new_f8 AS Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Reach_sn_new_f8;
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Ship AS (SELECT * FROM VALUES
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
t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Ship.src AS a,
      Ship.dst AS b
    FROM
      t_1_Ship AS Ship
    WHERE
      (Ship.carrier = "fedex")
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_3_Ship.dst AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, t_1_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = "fedex") AND
      (Reach_sn_delta_f8.b = t_3_Ship.src)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step_f8 AS (SELECT
  Reach_MultBodyAggAux_f7_f8.a AS a,
  Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f7_f8 AS Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step_f8.a AS a,
  Reach_sn_step_f8.b AS b
FROM
  t_0_Reach_sn_step_f8 AS Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full_f8 AS Reach_sn_full_f8
  WHERE
    (Reach_sn_full_f8.a = Reach_sn_step_f8.a) AND
    (Reach_sn_full_f8.b = Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full_f8 SELECT * FROM logica_test.Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f8;
CREATE TABLE logica_test.Reach_sn_delta_f8 AS SELECT
  Reach_sn_new_f8.a AS a,
  Reach_sn_new_f8.b AS b
FROM
  logica_test.Reach_sn_new_f8 AS Reach_sn_new_f8;

SELECT
  Reach_sn_full_f8.b AS b
FROM
  logica_test.Reach_sn_full_f8 AS Reach_sn_full_f8
WHERE
  ("milan" = Reach_sn_full_f8.a);