DROP TABLE IF EXISTS logica_test.U;
CREATE TABLE logica_test.U AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      5 AS a,
      6 AS b
   UNION ALL
  
    SELECT
      6 AS a,
      7 AS b
   UNION ALL
  
    SELECT
      7 AS a,
      8 AS b
   UNION ALL
  
    SELECT
      8 AS a,
      5 AS b
   UNION ALL
  
    SELECT
      9 AS a,
      10 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_E.b AS a,
      t_2_E.a AS b
    FROM
      t_1_E AS t_2_E
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_0_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2;

-- Interacting with table logica_test.U

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS WITH t_0_Conn_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Conn_MultBodyAggAux_f1.a AS a,
  Conn_MultBodyAggAux_f1.b AS b
FROM
  t_0_Conn_MultBodyAggAux_f1 AS Conn_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Conn_sn_delta

DROP TABLE IF EXISTS logica_test.Conn_sn_full;
CREATE TABLE logica_test.Conn_sn_full AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Conn_sn_delta.a AS a,
      Conn_sn_delta.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta
   UNION ALL
  
    SELECT
      Conn_sn_step.a AS a,
      Conn_sn_step.b AS b
    FROM
      t_0_Conn_sn_step AS Conn_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Conn_sn_full

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      logica_test.U AS U
   UNION ALL
  
    SELECT
      t_2_Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS t_2_Conn_sn_delta, logica_test.U AS t_3_U
    WHERE
      (t_3_U.a = t_2_Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

WITH t_2_Node AS (SELECT * FROM (
  
    SELECT
      1 AS n
   UNION ALL
  
    SELECT
      2 AS n
   UNION ALL
  
    SELECT
      3 AS n
   UNION ALL
  
    SELECT
      4 AS n
   UNION ALL
  
    SELECT
      5 AS n
   UNION ALL
  
    SELECT
      6 AS n
   UNION ALL
  
    SELECT
      7 AS n
   UNION ALL
  
    SELECT
      8 AS n
   UNION ALL
  
    SELECT
      9 AS n
   UNION ALL
  
    SELECT
      10 AS n
   UNION ALL
  
    SELECT
      11 AS n
   UNION ALL
  
    SELECT
      12 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_Comp_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Node.n AS n,
      Conn_sn_full.b AS c
    FROM
      t_2_Node AS Node, logica_test.Conn_sn_full AS Conn_sn_full
    WHERE
      (Node.n = Conn_sn_full.a)
   UNION ALL
  
    SELECT
      t_3_Node.n AS n,
      t_3_Node.n AS c
    FROM
      t_2_Node AS t_3_Node
  
) AS UNUSED_TABLE_NAME  ),
t_0_Comp AS (SELECT
  Comp_MultBodyAggAux.n AS n,
  MIN(Comp_MultBodyAggAux.c) AS c
FROM
  t_1_Comp_MultBodyAggAux AS Comp_MultBodyAggAux
GROUP BY 1)
SELECT
  Comp.c AS c
FROM
  t_0_Comp AS Comp
WHERE
  (Comp.n = 5);
