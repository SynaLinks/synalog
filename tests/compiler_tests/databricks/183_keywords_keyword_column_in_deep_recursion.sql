DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.`to` AS `to`
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.Reach_sn_delta

DROP TABLE IF EXISTS logica_test.Reach_sn_full;
CREATE TABLE logica_test.Reach_sn_full AS SELECT
  Reach_sn_delta.`to` AS `to`
FROM
  logica_test.Reach_sn_delta AS Reach_sn_delta;

-- Interacting with table logica_test.Reach_sn_full

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS `to`
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_9)
    WHERE
      (Reach_sn_delta.`to` = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

SELECT
  MAX(Reach_sn_full.`to`) AS m
FROM
  logica_test.Reach_sn_full AS Reach_sn_full;