DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_0_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f2.s AS s,
  Reach_MultBodyAggAux_f2.t AS t
FROM
  t_0_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table logica_test.Reach_sn_delta

DROP TABLE IF EXISTS logica_test.Reach_sn_t0;
CREATE TABLE logica_test.Reach_sn_t0 AS SELECT
  Reach_sn_delta.s AS s,
  Reach_sn_delta.t AS t
FROM
  logica_test.Reach_sn_delta AS Reach_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t0

DROP TABLE IF EXISTS logica_test.Reach_sn_t1;
CREATE TABLE logica_test.Reach_sn_t1 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      Reach_sn_t0.s AS s,
      t_2_E.b AS t
    FROM
      logica_test.Reach_sn_t0 AS Reach_sn_t0, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = Reach_sn_t0.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r1 AS (SELECT
  Reach_MultBodyAggAux_f3.s AS s,
  Reach_MultBodyAggAux_f3.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  Reach_sn_r1.s AS s,
  Reach_sn_r1.t AS t
FROM
  t_0_Reach_sn_r1 AS Reach_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t1

DROP TABLE IF EXISTS logica_test.Reach_sn_t2;
CREATE TABLE logica_test.Reach_sn_t2 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      Reach_sn_t1.s AS s,
      t_2_E.b AS t
    FROM
      logica_test.Reach_sn_t1 AS Reach_sn_t1, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = Reach_sn_t1.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r2 AS (SELECT
  Reach_MultBodyAggAux_f4.s AS s,
  Reach_MultBodyAggAux_f4.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  Reach_sn_r2.s AS s,
  Reach_sn_r2.t AS t
FROM
  t_0_Reach_sn_r2 AS Reach_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t2

DROP TABLE IF EXISTS logica_test.Reach_sn_t3;
CREATE TABLE logica_test.Reach_sn_t3 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      Reach_sn_t2.s AS s,
      t_2_E.b AS t
    FROM
      logica_test.Reach_sn_t2 AS Reach_sn_t2, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = Reach_sn_t2.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r3 AS (SELECT
  Reach_MultBodyAggAux_f5.s AS s,
  Reach_MultBodyAggAux_f5.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  Reach_sn_r3.s AS s,
  Reach_sn_r3.t AS t
FROM
  t_0_Reach_sn_r3 AS Reach_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t3

DROP TABLE IF EXISTS logica_test.Reach_sn_t4;
CREATE TABLE logica_test.Reach_sn_t4 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      Reach_sn_t3.s AS s,
      t_2_E.b AS t
    FROM
      logica_test.Reach_sn_t3 AS Reach_sn_t3, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = Reach_sn_t3.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r4 AS (SELECT
  Reach_MultBodyAggAux_f6.s AS s,
  Reach_MultBodyAggAux_f6.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  Reach_sn_r4.s AS s,
  Reach_sn_r4.t AS t
FROM
  t_0_Reach_sn_r4 AS Reach_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t4

DROP TABLE IF EXISTS logica_test.Reach_sn_t5;
CREATE TABLE logica_test.Reach_sn_t5 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      Reach_sn_t4.s AS s,
      t_2_E.b AS t
    FROM
      logica_test.Reach_sn_t4 AS Reach_sn_t4, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = Reach_sn_t4.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r5 AS (SELECT
  Reach_MultBodyAggAux_f7.s AS s,
  Reach_MultBodyAggAux_f7.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Reach_sn_r5.s AS s,
  Reach_sn_r5.t AS t
FROM
  t_0_Reach_sn_r5 AS Reach_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t5

DROP TABLE IF EXISTS logica_test.Reach_sn_full;
CREATE TABLE logica_test.Reach_sn_full AS SELECT * FROM (
  
    SELECT
      Reach_sn_delta.s AS s,
      Reach_sn_delta.t AS t
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_t1.s AS s,
      Reach_sn_t1.t AS t
    FROM
      logica_test.Reach_sn_t1 AS Reach_sn_t1
   UNION ALL
  
    SELECT
      Reach_sn_t2.s AS s,
      Reach_sn_t2.t AS t
    FROM
      logica_test.Reach_sn_t2 AS Reach_sn_t2
   UNION ALL
  
    SELECT
      Reach_sn_t3.s AS s,
      Reach_sn_t3.t AS t
    FROM
      logica_test.Reach_sn_t3 AS Reach_sn_t3
   UNION ALL
  
    SELECT
      Reach_sn_t4.s AS s,
      Reach_sn_t4.t AS t
    FROM
      logica_test.Reach_sn_t4 AS Reach_sn_t4
   UNION ALL
  
    SELECT
      Reach_sn_t5.s AS s,
      Reach_sn_t5.t AS t
    FROM
      logica_test.Reach_sn_t5 AS Reach_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reach_sn_full

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      Reach_sn_delta.s AS s,
      t_2_E.b AS t
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = Reach_sn_delta.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.s AS s,
  Reach_MultBodyAggAux_f8.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.s AS s,
  Reach_sn_step.t AS t
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.s = Reach_sn_step.s) AND
    (Reach_sn_full.t = Reach_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      Reach_sn_new.s AS s,
      t_2_E.b AS t
    FROM
      logica_test.Reach_sn_new AS Reach_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = Reach_sn_new.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.s AS s,
  Reach_MultBodyAggAux_f1.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.s AS s,
  Reach_sn_back_step.t AS t
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.s = Reach_sn_back_step.s) AND
    (Reach_sn_full.t = Reach_sn_back_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_delta;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      Reach_sn_delta.s AS s,
      t_2_E.b AS t
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = Reach_sn_delta.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.s AS s,
  Reach_MultBodyAggAux_f8.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.s AS s,
  Reach_sn_step.t AS t
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.s = Reach_sn_step.s) AND
    (Reach_sn_full.t = Reach_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      Reach_sn_new.s AS s,
      t_2_E.b AS t
    FROM
      logica_test.Reach_sn_new AS Reach_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = Reach_sn_new.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_back_step AS (SELECT
  Reach_MultBodyAggAux_f1.s AS s,
  Reach_MultBodyAggAux_f1.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Reach_sn_back_step.s AS s,
  Reach_sn_back_step.t AS t
FROM
  t_0_Reach_sn_back_step AS Reach_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.s = Reach_sn_back_step.s) AND
    (Reach_sn_full.t = Reach_sn_back_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_delta;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Reach_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      Reach_sn_delta.s AS s,
      t_2_E.b AS t
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a = Reach_sn_delta.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f8.s AS s,
  Reach_MultBodyAggAux_f8.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f8 AS Reach_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Reach_sn_step.s AS s,
  Reach_sn_step.t AS t
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.s = Reach_sn_step.s) AND
    (Reach_sn_full.t = Reach_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

SELECT
  Reach_sn_full.s AS s,
  SUM(1) AS n
FROM
  logica_test.Reach_sn_full AS Reach_sn_full
GROUP BY 1 ORDER BY s NULLS LAST;