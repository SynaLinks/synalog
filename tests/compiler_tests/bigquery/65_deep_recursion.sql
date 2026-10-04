DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS WITH t_0_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_0_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY y;

-- Interacting with table logica_test.Test_sn_delta

DROP TABLE IF EXISTS logica_test.Test_sn_full;
CREATE TABLE logica_test.Test_sn_full AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
SELECT * FROM (
  
    SELECT
      Test_sn_delta.y AS y
    FROM
      logica_test.Test_sn_delta AS Test_sn_delta
   UNION ALL
  
    SELECT
      Test_sn_step.y AS y
    FROM
      t_0_Test_sn_step AS Test_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Test_sn_full

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_new;
CREATE TABLE logica_test.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.Test_sn_delta AS t_2_Test_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_11
    WHERE
      (t_2_Test_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY y)
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
GROUP BY y;

INSERT INTO logica_test.Test_sn_full SELECT * FROM logica_test.Test_sn_new;

DROP TABLE IF EXISTS logica_test.Test_sn_delta;
CREATE TABLE logica_test.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_test.Test_sn_new AS Test_sn_new;

SELECT
  Test_sn_full.y AS y
FROM
  logica_test.Test_sn_full AS Test_sn_full;