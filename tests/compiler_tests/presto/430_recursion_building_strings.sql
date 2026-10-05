DROP TABLE IF EXISTS logica_test.W_sn_delta;
CREATE TABLE logica_test.W_sn_delta AS WITH t_0_W_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W_MultBodyAggAux_f1.w AS w
FROM
  t_0_W_MultBodyAggAux_f1 AS W_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.W_sn_delta

DROP TABLE IF EXISTS logica_test.W_sn_full;
CREATE TABLE logica_test.W_sn_full AS WITH t_1_W_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(t_2_W_sn_delta.w, 'a')) AS w
    FROM
      logica_test.W_sn_delta AS t_2_W_sn_delta
    WHERE
      (LENGTH(t_2_W_sn_delta.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_step AS (SELECT
  W_MultBodyAggAux_f2.w AS w
FROM
  t_1_W_MultBodyAggAux_f2 AS W_MultBodyAggAux_f2
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      W_sn_delta.w AS w
    FROM
      logica_test.W_sn_delta AS W_sn_delta
   UNION ALL
  
    SELECT
      W_sn_step.w AS w
    FROM
      t_0_W_sn_step AS W_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.W_sn_full

DROP TABLE IF EXISTS logica_test.W_sn_new;
CREATE TABLE logica_test.W_sn_new AS WITH t_1_W_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(t_2_W_sn_delta.w, 'a')) AS w
    FROM
      logica_test.W_sn_delta AS t_2_W_sn_delta
    WHERE
      (LENGTH(t_2_W_sn_delta.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_step AS (SELECT
  W_MultBodyAggAux_f2.w AS w
FROM
  t_1_W_MultBodyAggAux_f2 AS W_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  W_sn_step.w AS w
FROM
  t_0_W_sn_step AS W_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.W_sn_full AS W_sn_full
  WHERE
    (W_sn_full.w = W_sn_step.w)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.W_sn_full SELECT * FROM logica_test.W_sn_new;

DROP TABLE IF EXISTS logica_test.W_sn_delta;
CREATE TABLE logica_test.W_sn_delta AS SELECT
  W_sn_new.w AS w
FROM
  logica_test.W_sn_new AS W_sn_new;

DROP TABLE IF EXISTS logica_test.W_sn_new;
CREATE TABLE logica_test.W_sn_new AS WITH t_1_W_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(t_2_W_sn_delta.w, 'a')) AS w
    FROM
      logica_test.W_sn_delta AS t_2_W_sn_delta
    WHERE
      (LENGTH(t_2_W_sn_delta.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_step AS (SELECT
  W_MultBodyAggAux_f2.w AS w
FROM
  t_1_W_MultBodyAggAux_f2 AS W_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  W_sn_step.w AS w
FROM
  t_0_W_sn_step AS W_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.W_sn_full AS W_sn_full
  WHERE
    (W_sn_full.w = W_sn_step.w)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.W_sn_full SELECT * FROM logica_test.W_sn_new;

DROP TABLE IF EXISTS logica_test.W_sn_delta;
CREATE TABLE logica_test.W_sn_delta AS SELECT
  W_sn_new.w AS w
FROM
  logica_test.W_sn_new AS W_sn_new;

DROP TABLE IF EXISTS logica_test.W_sn_new;
CREATE TABLE logica_test.W_sn_new AS WITH t_1_W_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(t_2_W_sn_delta.w, 'a')) AS w
    FROM
      logica_test.W_sn_delta AS t_2_W_sn_delta
    WHERE
      (LENGTH(t_2_W_sn_delta.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_step AS (SELECT
  W_MultBodyAggAux_f2.w AS w
FROM
  t_1_W_MultBodyAggAux_f2 AS W_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  W_sn_step.w AS w
FROM
  t_0_W_sn_step AS W_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.W_sn_full AS W_sn_full
  WHERE
    (W_sn_full.w = W_sn_step.w)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.W_sn_full SELECT * FROM logica_test.W_sn_new;

DROP TABLE IF EXISTS logica_test.W_sn_delta;
CREATE TABLE logica_test.W_sn_delta AS SELECT
  W_sn_new.w AS w
FROM
  logica_test.W_sn_new AS W_sn_new;

DROP TABLE IF EXISTS logica_test.W_sn_new;
CREATE TABLE logica_test.W_sn_new AS WITH t_1_W_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(t_2_W_sn_delta.w, 'a')) AS w
    FROM
      logica_test.W_sn_delta AS t_2_W_sn_delta
    WHERE
      (LENGTH(t_2_W_sn_delta.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_step AS (SELECT
  W_MultBodyAggAux_f2.w AS w
FROM
  t_1_W_MultBodyAggAux_f2 AS W_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  W_sn_step.w AS w
FROM
  t_0_W_sn_step AS W_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.W_sn_full AS W_sn_full
  WHERE
    (W_sn_full.w = W_sn_step.w)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.W_sn_full SELECT * FROM logica_test.W_sn_new;

DROP TABLE IF EXISTS logica_test.W_sn_delta;
CREATE TABLE logica_test.W_sn_delta AS SELECT
  W_sn_new.w AS w
FROM
  logica_test.W_sn_new AS W_sn_new;

DROP TABLE IF EXISTS logica_test.W_sn_new;
CREATE TABLE logica_test.W_sn_new AS WITH t_1_W_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(t_2_W_sn_delta.w, 'a')) AS w
    FROM
      logica_test.W_sn_delta AS t_2_W_sn_delta
    WHERE
      (LENGTH(t_2_W_sn_delta.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_step AS (SELECT
  W_MultBodyAggAux_f2.w AS w
FROM
  t_1_W_MultBodyAggAux_f2 AS W_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  W_sn_step.w AS w
FROM
  t_0_W_sn_step AS W_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.W_sn_full AS W_sn_full
  WHERE
    (W_sn_full.w = W_sn_step.w)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.W_sn_full SELECT * FROM logica_test.W_sn_new;

DROP TABLE IF EXISTS logica_test.W_sn_delta;
CREATE TABLE logica_test.W_sn_delta AS SELECT
  W_sn_new.w AS w
FROM
  logica_test.W_sn_new AS W_sn_new;

SELECT
  W_sn_full.w AS w
FROM
  logica_test.W_sn_full AS W_sn_full ORDER BY w;