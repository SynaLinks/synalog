DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_0_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_f2.n AS n
FROM
  t_0_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table logica_test.R_sn_delta

DROP TABLE IF EXISTS logica_test.R_sn_t0;
CREATE TABLE logica_test.R_sn_t0 AS SELECT
  R_sn_delta.n AS n
FROM
  logica_test.R_sn_delta AS R_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t0

DROP TABLE IF EXISTS logica_test.R_sn_t1;
CREATE TABLE logica_test.R_sn_t1 AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("x", "y")
AS UNUSED_TABLE_NAME(a, b)),
t_1_R_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_t0 AS R_sn_t0, t_2_E AS E
    WHERE
      (E.a = R_sn_t0.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r1 AS (SELECT
  R_MultBodyAggAux_f3.n AS n
FROM
  t_1_R_MultBodyAggAux_f3 AS R_MultBodyAggAux_f3
GROUP BY 1)
SELECT
  R_sn_r1.n AS n
FROM
  t_0_R_sn_r1 AS R_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t1

DROP TABLE IF EXISTS logica_test.R_sn_t2;
CREATE TABLE logica_test.R_sn_t2 AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("x", "y")
AS UNUSED_TABLE_NAME(a, b)),
t_1_R_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_t1 AS R_sn_t1, t_2_E AS E
    WHERE
      (E.a = R_sn_t1.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r2 AS (SELECT
  R_MultBodyAggAux_f4.n AS n
FROM
  t_1_R_MultBodyAggAux_f4 AS R_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  R_sn_r2.n AS n
FROM
  t_0_R_sn_r2 AS R_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t2

DROP TABLE IF EXISTS logica_test.R_sn_t3;
CREATE TABLE logica_test.R_sn_t3 AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("x", "y")
AS UNUSED_TABLE_NAME(a, b)),
t_1_R_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_t2 AS R_sn_t2, t_2_E AS E
    WHERE
      (E.a = R_sn_t2.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r3 AS (SELECT
  R_MultBodyAggAux_f5.n AS n
FROM
  t_1_R_MultBodyAggAux_f5 AS R_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  R_sn_r3.n AS n
FROM
  t_0_R_sn_r3 AS R_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t3

DROP TABLE IF EXISTS logica_test.R_sn_full;
CREATE TABLE logica_test.R_sn_full AS SELECT * FROM (
  
    SELECT
      R_sn_delta.n AS n
    FROM
      logica_test.R_sn_delta AS R_sn_delta
   UNION ALL
  
    SELECT
      R_sn_t1.n AS n
    FROM
      logica_test.R_sn_t1 AS R_sn_t1
   UNION ALL
  
    SELECT
      R_sn_t2.n AS n
    FROM
      logica_test.R_sn_t2 AS R_sn_t2
   UNION ALL
  
    SELECT
      R_sn_t3.n AS n
    FROM
      logica_test.R_sn_t3 AS R_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.R_sn_full

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("x", "y")
AS UNUSED_TABLE_NAME(a, b)),
t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_delta AS R_sn_delta, t_2_E AS E
    WHERE
      (E.a = R_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.n AS n
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.n AS n
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full
  WHERE
    (R_sn_full.n = R_sn_step.n)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("x", "y")
AS UNUSED_TABLE_NAME(a, b)),
t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_new AS R_sn_new, t_2_E AS E
    WHERE
      (E.a = R_sn_new.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.n AS n
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.n AS n
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full
  WHERE
    (R_sn_full.n = R_sn_back_step.n)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("x", "y")
AS UNUSED_TABLE_NAME(a, b)),
t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_delta AS R_sn_delta, t_2_E AS E
    WHERE
      (E.a = R_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.n AS n
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.n AS n
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full
  WHERE
    (R_sn_full.n = R_sn_step.n)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("x", "y")
AS UNUSED_TABLE_NAME(a, b)),
t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_new AS R_sn_new, t_2_E AS E
    WHERE
      (E.a = R_sn_new.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.n AS n
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  R_sn_back_step.n AS n
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full
  WHERE
    (R_sn_full.n = R_sn_back_step.n)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  ("a", "b"),
  ("b", "c"),
  ("x", "y")
AS UNUSED_TABLE_NAME(a, b)),
t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_delta AS R_sn_delta, t_2_E AS E
    WHERE
      (E.a = R_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.n AS n
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  R_sn_step.n AS n
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full
  WHERE
    (R_sn_full.n = R_sn_step.n)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

SELECT
  R_sn_full.n AS n
FROM
  logica_test.R_sn_full AS R_sn_full ORDER BY n NULLS LAST;