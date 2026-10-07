DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_0_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_0_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table logica_test.Test_sn_delta

DROP TABLE IF EXISTS logica_test.Test_sn_t0;
CREATE TABLE logica_test.Test_sn_t0 AS SELECT
  Test_sn_delta.y AS y
FROM
  logica_test.Test_sn_delta AS Test_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Test_sn_t0

DROP TABLE IF EXISTS logica_test.Test_sn_t1;
CREATE TABLE logica_test.Test_sn_t1 AS WITH t_1_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_t0 AS Test_sn_t0, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_t0.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_r1 AS (SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_1_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY 1)
SELECT
  Test_sn_r1.y AS y
FROM
  t_0_Test_sn_r1 AS Test_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Test_sn_t1

DROP TABLE IF EXISTS logica_test.Test_sn_t2;
CREATE TABLE logica_test.Test_sn_t2 AS WITH t_1_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_t1 AS Test_sn_t1, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_t1.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_r2 AS (SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_1_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  Test_sn_r2.y AS y
FROM
  t_0_Test_sn_r2 AS Test_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Test_sn_t2

DROP TABLE IF EXISTS logica_test.Test_sn_t3;
CREATE TABLE logica_test.Test_sn_t3 AS WITH t_1_Test_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_t2 AS Test_sn_t2, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_t2.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_r3 AS (SELECT
  Test_MultBodyAggAux_f5.y AS y
FROM
  t_1_Test_MultBodyAggAux_f5 AS Test_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Test_sn_r3.y AS y
FROM
  t_0_Test_sn_r3 AS Test_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Test_sn_t3

DROP TABLE IF EXISTS logica_test.Test_sn_full;
CREATE TABLE logica_test.Test_sn_full AS SELECT * FROM (
  
    SELECT
      Test_sn_delta.y AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta
   UNION ALL
  
    SELECT
      Test_sn_t1.y AS y
    FROM
      logica_test.Test_sn_t1 AS Test_sn_t1
   UNION ALL
  
    SELECT
      Test_sn_t2.y AS y
    FROM
      logica_test.Test_sn_t2 AS Test_sn_t2
   UNION ALL
  
    SELECT
      Test_sn_t3.y AS y
    FROM
      logica_test.Test_sn_t3 AS Test_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Test_sn_full

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f6.y AS y
FROM
  t_1_Test_MultBodyAggAux_f6 AS Test_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_1_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Test_sn_new AS Test_sn_new, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 100), x -> x < 100), synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (Test_sn_new.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_back_step AS (SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_1_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Test_sn_back_step.y AS y
FROM
  t_0_Test_sn_back_step AS Test_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Test_sn_full AS Test_sn_full
  WHERE
    (Test_sn_full.y = Test_sn_back_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_delta;

SELECT
  Test_sn_full.y AS y
FROM
  logica_test.Test_sn_full AS Test_sn_full;