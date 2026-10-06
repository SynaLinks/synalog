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

DROP TABLE IF EXISTS logica_test.P_sn_t0;
CREATE TABLE logica_test.P_sn_t0 AS SELECT
  P_sn_delta.s AS s,
  P_sn_delta.t AS t
FROM
  logica_test.P_sn_delta AS P_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t0

DROP TABLE IF EXISTS logica_test.P_sn_t1;
CREATE TABLE logica_test.P_sn_t1 AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      P_sn_t0.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_t0 AS P_sn_t0, t_2_E AS E
    WHERE
      (E.a = P_sn_t0.t)
   UNION ALL
  
    SELECT
      t_2_E.a AS s,
      t_2_E.b AS t
    FROM
      t_2_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r1 AS (SELECT
  P_MultBodyAggAux_f2.s AS s,
  P_MultBodyAggAux_f2.t AS t
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_r1.s AS s,
  P_sn_r1.t AS t
FROM
  t_0_P_sn_r1 AS P_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t1

DROP TABLE IF EXISTS logica_test.P_sn_t2;
CREATE TABLE logica_test.P_sn_t2 AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      P_sn_t1.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_t1 AS P_sn_t1, t_2_E AS E
    WHERE
      (E.a = P_sn_t1.t)
   UNION ALL
  
    SELECT
      t_2_E.a AS s,
      t_2_E.b AS t
    FROM
      t_2_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r2 AS (SELECT
  P_MultBodyAggAux_f3.s AS s,
  P_MultBodyAggAux_f3.t AS t
FROM
  t_1_P_MultBodyAggAux_f3 AS P_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  P_sn_r2.s AS s,
  P_sn_r2.t AS t
FROM
  t_0_P_sn_r2 AS P_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t2

DROP TABLE IF EXISTS logica_test.P_sn_t3;
CREATE TABLE logica_test.P_sn_t3 AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      P_sn_t2.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_t2 AS P_sn_t2, t_2_E AS E
    WHERE
      (E.a = P_sn_t2.t)
   UNION ALL
  
    SELECT
      t_2_E.a AS s,
      t_2_E.b AS t
    FROM
      t_2_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r3 AS (SELECT
  P_MultBodyAggAux_f4.s AS s,
  P_MultBodyAggAux_f4.t AS t
FROM
  t_1_P_MultBodyAggAux_f4 AS P_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  P_sn_r3.s AS s,
  P_sn_r3.t AS t
FROM
  t_0_P_sn_r3 AS P_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t3

DROP TABLE IF EXISTS logica_test.P_sn_t4;
CREATE TABLE logica_test.P_sn_t4 AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      P_sn_t3.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_t3 AS P_sn_t3, t_2_E AS E
    WHERE
      (E.a = P_sn_t3.t)
   UNION ALL
  
    SELECT
      t_2_E.a AS s,
      t_2_E.b AS t
    FROM
      t_2_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r4 AS (SELECT
  P_MultBodyAggAux_f5.s AS s,
  P_MultBodyAggAux_f5.t AS t
FROM
  t_1_P_MultBodyAggAux_f5 AS P_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  P_sn_r4.s AS s,
  P_sn_r4.t AS t
FROM
  t_0_P_sn_r4 AS P_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t4

DROP TABLE IF EXISTS logica_test.P_sn_t5;
CREATE TABLE logica_test.P_sn_t5 AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      P_sn_t4.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_t4 AS P_sn_t4, t_2_E AS E
    WHERE
      (E.a = P_sn_t4.t)
   UNION ALL
  
    SELECT
      t_2_E.a AS s,
      t_2_E.b AS t
    FROM
      t_2_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r5 AS (SELECT
  P_MultBodyAggAux_f6.s AS s,
  P_MultBodyAggAux_f6.t AS t
FROM
  t_1_P_MultBodyAggAux_f6 AS P_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  P_sn_r5.s AS s,
  P_sn_r5.t AS t
FROM
  t_0_P_sn_r5 AS P_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t5

DROP TABLE IF EXISTS logica_test.P_sn_full;
CREATE TABLE logica_test.P_sn_full AS SELECT * FROM (
  
    SELECT
      P_sn_delta.s AS s,
      P_sn_delta.t AS t
    FROM
      logica_test.P_sn_delta AS P_sn_delta
   UNION ALL
  
    SELECT
      P_sn_t1.s AS s,
      P_sn_t1.t AS t
    FROM
      logica_test.P_sn_t1 AS P_sn_t1
   UNION ALL
  
    SELECT
      P_sn_t2.s AS s,
      P_sn_t2.t AS t
    FROM
      logica_test.P_sn_t2 AS P_sn_t2
   UNION ALL
  
    SELECT
      P_sn_t3.s AS s,
      P_sn_t3.t AS t
    FROM
      logica_test.P_sn_t3 AS P_sn_t3
   UNION ALL
  
    SELECT
      P_sn_t4.s AS s,
      P_sn_t4.t AS t
    FROM
      logica_test.P_sn_t4 AS P_sn_t4
   UNION ALL
  
    SELECT
      P_sn_t5.s AS s,
      P_sn_t5.t AS t
    FROM
      logica_test.P_sn_t5 AS P_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.P_sn_full

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c")
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      P_sn_delta.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_delta AS P_sn_delta, t_2_E AS E
    WHERE
      (E.a = P_sn_delta.t)
   UNION ALL
  
    SELECT
      t_2_E.a AS s,
      t_2_E.b AS t
    FROM
      t_2_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f7.s AS s,
  P_MultBodyAggAux_f7.t AS t
FROM
  t_1_P_MultBodyAggAux_f7 AS P_MultBodyAggAux_f7
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
t_1_P_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      P_sn_delta.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_delta AS P_sn_delta, t_2_E AS E
    WHERE
      (E.a = P_sn_delta.t)
   UNION ALL
  
    SELECT
      t_2_E.a AS s,
      t_2_E.b AS t
    FROM
      t_2_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f7.s AS s,
  P_MultBodyAggAux_f7.t AS t
FROM
  t_1_P_MultBodyAggAux_f7 AS P_MultBodyAggAux_f7
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
t_1_P_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      P_sn_delta.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_delta AS P_sn_delta, t_2_E AS E
    WHERE
      (E.a = P_sn_delta.t)
   UNION ALL
  
    SELECT
      t_2_E.a AS s,
      t_2_E.b AS t
    FROM
      t_2_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f7.s AS s,
  P_MultBodyAggAux_f7.t AS t
FROM
  t_1_P_MultBodyAggAux_f7 AS P_MultBodyAggAux_f7
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
t_1_P_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      P_sn_delta.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_delta AS P_sn_delta, t_2_E AS E
    WHERE
      (E.a = P_sn_delta.t)
   UNION ALL
  
    SELECT
      t_2_E.a AS s,
      t_2_E.b AS t
    FROM
      t_2_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f7.s AS s,
  P_MultBodyAggAux_f7.t AS t
FROM
  t_1_P_MultBodyAggAux_f7 AS P_MultBodyAggAux_f7
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
t_1_P_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      P_sn_delta.s AS s,
      E.b AS t
    FROM
      logica_test.P_sn_delta AS P_sn_delta, t_2_E AS E
    WHERE
      (E.a = P_sn_delta.t)
   UNION ALL
  
    SELECT
      t_2_E.a AS s,
      t_2_E.b AS t
    FROM
      t_2_E
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f7.s AS s,
  P_MultBodyAggAux_f7.t AS t
FROM
  t_1_P_MultBodyAggAux_f7 AS P_MultBodyAggAux_f7
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