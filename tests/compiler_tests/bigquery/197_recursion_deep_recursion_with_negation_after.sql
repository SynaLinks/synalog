DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY y;

-- Interacting with table logica_test.Reach_sn_delta

DROP TABLE IF EXISTS logica_test.Reach_sn_full;
CREATE TABLE logica_test.Reach_sn_full AS SELECT
  Reach_sn_delta.y AS y
FROM
  logica_test.Reach_sn_delta AS Reach_sn_delta;

-- Interacting with table logica_test.Reach_sn_full

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (Reach_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY y)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[10, 22, 23]) as x_3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (x_3 = Reach_sn_full.y)) IS NULL) ORDER BY x;