DROP TABLE IF EXISTS logica_test.Route;
CREATE TABLE logica_test.Route AS WITH t_0_Ship AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'acme' AS client,
      'paris' AS src,
      'lyon' AS dst,
      12 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      2 AS id,
      'acme' AS client,
      'lyon' AS src,
      'nice' AS dst,
      5 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      3 AS id,
      'bolt' AS client,
      'paris' AS src,
      'nice' AS dst,
      30 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      4 AS id,
      'bolt' AS client,
      'nice' AS src,
      'rome' AS dst,
      8 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      5 AS id,
      'cora' AS client,
      'rome' AS src,
      'milan' AS dst,
      14 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      6 AS id,
      'cora' AS client,
      'milan' AS src,
      'paris' AS dst,
      3 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      7 AS id,
      'acme' AS client,
      'paris' AS src,
      'rome' AS dst,
      22 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      8 AS id,
      'dune' AS client,
      'lyon' AS src,
      'paris' AS dst,
      9 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      9 AS id,
      'dune' AS client,
      'nice' AS src,
      'lyon' AS dst,
      11 AS kg,
      'dhl' AS carrier
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Ship.src AS a,
  Ship.dst AS b
FROM
  t_0_Ship AS Ship
WHERE
  (Ship.carrier = 'dhl');

-- Interacting with table logica_test.Route

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f8;
CREATE TABLE logica_test.Reach_sn_delta_f8 AS WITH t_0_Reach_MultBodyAggAux_f1_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
  
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
CREATE TABLE logica_test.Reach_sn_t1_f8 AS WITH t_1_Reach_MultBodyAggAux_f2_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      Reach_sn_t0_f8.a AS a,
      t_2_Route.b AS b
    FROM
      logica_test.Reach_sn_t0_f8 AS Reach_sn_t0_f8, logica_test.Route AS t_2_Route
    WHERE
      (t_2_Route.a = Reach_sn_t0_f8.b)
  
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
CREATE TABLE logica_test.Reach_sn_t2_f8 AS WITH t_1_Reach_MultBodyAggAux_f3_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      Reach_sn_t1_f8.a AS a,
      t_2_Route.b AS b
    FROM
      logica_test.Reach_sn_t1_f8 AS Reach_sn_t1_f8, logica_test.Route AS t_2_Route
    WHERE
      (t_2_Route.a = Reach_sn_t1_f8.b)
  
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
CREATE TABLE logica_test.Reach_sn_t3_f8 AS WITH t_1_Reach_MultBodyAggAux_f4_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      Reach_sn_t2_f8.a AS a,
      t_2_Route.b AS b
    FROM
      logica_test.Reach_sn_t2_f8 AS Reach_sn_t2_f8, logica_test.Route AS t_2_Route
    WHERE
      (t_2_Route.a = Reach_sn_t2_f8.b)
  
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
CREATE TABLE logica_test.Reach_sn_t4_f8 AS WITH t_1_Reach_MultBodyAggAux_f5_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      Reach_sn_t3_f8.a AS a,
      t_2_Route.b AS b
    FROM
      logica_test.Reach_sn_t3_f8 AS Reach_sn_t3_f8, logica_test.Route AS t_2_Route
    WHERE
      (t_2_Route.a = Reach_sn_t3_f8.b)
  
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
CREATE TABLE logica_test.Reach_sn_t5_f8 AS WITH t_1_Reach_MultBodyAggAux_f6_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      Reach_sn_t4_f8.a AS a,
      t_2_Route.b AS b
    FROM
      logica_test.Reach_sn_t4_f8 AS Reach_sn_t4_f8, logica_test.Route AS t_2_Route
    WHERE
      (t_2_Route.a = Reach_sn_t4_f8.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_2_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, logica_test.Route AS t_2_Route
    WHERE
      (t_2_Route.a = Reach_sn_delta_f8.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_2_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, logica_test.Route AS t_2_Route
    WHERE
      (t_2_Route.a = Reach_sn_delta_f8.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_2_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, logica_test.Route AS t_2_Route
    WHERE
      (t_2_Route.a = Reach_sn_delta_f8.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_2_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, logica_test.Route AS t_2_Route
    WHERE
      (t_2_Route.a = Reach_sn_delta_f8.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_2_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, logica_test.Route AS t_2_Route
    WHERE
      (t_2_Route.a = Reach_sn_delta_f8.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f8 AS WITH t_1_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      Reach_sn_delta_f8.a AS a,
      t_2_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f8 AS Reach_sn_delta_f8, logica_test.Route AS t_2_Route
    WHERE
      (t_2_Route.a = Reach_sn_delta_f8.b)
  
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
  ('milan' = Reach_sn_full_f8.a) ORDER BY b;