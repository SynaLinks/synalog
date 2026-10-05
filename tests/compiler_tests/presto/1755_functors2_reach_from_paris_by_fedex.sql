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
  (Ship.carrier = 'fedex');

-- Interacting with table logica_test.Route

DROP TABLE IF EXISTS logica_test.Reach_sn_delta_f3;
CREATE TABLE logica_test.Reach_sn_delta_f3 AS WITH t_0_Reach_MultBodyAggAux_f1_f3 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1_f3.a AS a,
  Reach_MultBodyAggAux_f1_f3.b AS b
FROM
  t_0_Reach_MultBodyAggAux_f1_f3 AS Reach_MultBodyAggAux_f1_f3
GROUP BY 1, 2;

-- Interacting with table logica_test.Reach_sn_delta_f3

DROP TABLE IF EXISTS logica_test.Reach_sn_full_f3;
CREATE TABLE logica_test.Reach_sn_full_f3 AS WITH t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_3_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, logica_test.Route AS t_3_Route
    WHERE
      (t_3_Route.a = t_2_Reach_sn_delta_f3.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_3_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, logica_test.Route AS t_3_Route
    WHERE
      (t_3_Route.a = t_2_Reach_sn_delta_f3.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_3_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, logica_test.Route AS t_3_Route
    WHERE
      (t_3_Route.a = t_2_Reach_sn_delta_f3.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_3_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, logica_test.Route AS t_3_Route
    WHERE
      (t_3_Route.a = t_2_Reach_sn_delta_f3.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_3_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, logica_test.Route AS t_3_Route
    WHERE
      (t_3_Route.a = t_2_Reach_sn_delta_f3.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_3_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, logica_test.Route AS t_3_Route
    WHERE
      (t_3_Route.a = t_2_Reach_sn_delta_f3.b)
  
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
CREATE TABLE logica_test.Reach_sn_new_f3 AS WITH t_1_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Route.a AS a,
      Route.b AS b
    FROM
      logica_test.Route AS Route
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta_f3.a AS a,
      t_3_Route.b AS b
    FROM
      logica_test.Reach_sn_delta_f3 AS t_2_Reach_sn_delta_f3, logica_test.Route AS t_3_Route
    WHERE
      (t_3_Route.a = t_2_Reach_sn_delta_f3.b)
  
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
  ('paris' = Reach_sn_full_f3.a);
