DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_0_P_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      t_1_E.a AS s,
      t_1_E.b AS t
    FROM
      t_2_E AS t_1_E
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P_MultBodyAggAux_f1.s AS s,
  P_MultBodyAggAux_f1.t AS t
FROM
  t_0_P_MultBodyAggAux_f1 AS P_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.P_sn_delta

DROP TABLE IF EXISTS logica_test.P_sn_full;
CREATE TABLE logica_test.P_sn_full AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_P_sn_delta.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (E.a = t_2_P_sn_delta.t)
   UNION ALL
  
    SELECT
      t_3_E.a AS s,
      t_3_E.b AS t
    FROM
      t_2_E AS t_3_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.s AS s,
  P_MultBodyAggAux_f2.t AS t
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      P_sn_delta.s AS s,
      P_sn_delta.t AS t
    FROM
      logica_test.P_sn_delta AS P_sn_delta
   UNION ALL
  
    SELECT
      P_sn_step.s AS s,
      P_sn_step.t AS t
    FROM
      t_0_P_sn_step AS P_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.P_sn_full

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_P_sn_delta.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (E.a = t_2_P_sn_delta.t)
   UNION ALL
  
    SELECT
      t_3_E.a AS s,
      t_3_E.b AS t
    FROM
      t_2_E AS t_3_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.s AS s,
  P_MultBodyAggAux_f2.t AS t
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.s AS s,
  P_sn_step.t AS t
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.s = P_sn_step.s) AND
    (P_sn_full.t = P_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.s AS s,
  P_sn_new.t AS t
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_P_sn_delta.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (E.a = t_2_P_sn_delta.t)
   UNION ALL
  
    SELECT
      t_3_E.a AS s,
      t_3_E.b AS t
    FROM
      t_2_E AS t_3_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.s AS s,
  P_MultBodyAggAux_f2.t AS t
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.s AS s,
  P_sn_step.t AS t
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.s = P_sn_step.s) AND
    (P_sn_full.t = P_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.s AS s,
  P_sn_new.t AS t
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_P_sn_delta.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (E.a = t_2_P_sn_delta.t)
   UNION ALL
  
    SELECT
      t_3_E.a AS s,
      t_3_E.b AS t
    FROM
      t_2_E AS t_3_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.s AS s,
  P_MultBodyAggAux_f2.t AS t
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.s AS s,
  P_sn_step.t AS t
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.s = P_sn_step.s) AND
    (P_sn_full.t = P_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.s AS s,
  P_sn_new.t AS t
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_P_sn_delta.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (E.a = t_2_P_sn_delta.t)
   UNION ALL
  
    SELECT
      t_3_E.a AS s,
      t_3_E.b AS t
    FROM
      t_2_E AS t_3_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.s AS s,
  P_MultBodyAggAux_f2.t AS t
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.s AS s,
  P_sn_step.t AS t
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.s = P_sn_step.s) AND
    (P_sn_full.t = P_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.s AS s,
  P_sn_new.t AS t
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_P_sn_delta.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (E.a = t_2_P_sn_delta.t)
   UNION ALL
  
    SELECT
      t_3_E.a AS s,
      t_3_E.b AS t
    FROM
      t_2_E AS t_3_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.s AS s,
  P_MultBodyAggAux_f2.t AS t
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.s AS s,
  P_sn_step.t AS t
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.s = P_sn_step.s) AND
    (P_sn_full.t = P_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.s AS s,
  P_sn_new.t AS t
FROM
  logica_test.P_sn_new AS P_sn_new;

WITH t_1_L AS (SELECT
  P_sn_full.s AS s,
  ARRAY_AGG(DISTINCT P_sn_full.t) AS l
FROM
  logica_test.P_sn_full AS P_sn_full
GROUP BY 1)
SELECT
  t_0_L.s AS s,
  ARRAY_SIZE(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY s NULLS LAST;