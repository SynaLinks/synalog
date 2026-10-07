DROP TABLE IF EXISTS logica_test.W_sn_delta;
CREATE TABLE logica_test.W_sn_delta AS WITH t_0_W_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W_MultBodyAggAux_f2.w AS w
FROM
  t_0_W_MultBodyAggAux_f2 AS W_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table logica_test.W_sn_delta

DROP TABLE IF EXISTS logica_test.W_sn_t0;
CREATE TABLE logica_test.W_sn_t0 AS SELECT
  W_sn_delta.w AS w
FROM
  logica_test.W_sn_delta AS W_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.W_sn_t0

DROP TABLE IF EXISTS logica_test.W_sn_t1;
CREATE TABLE logica_test.W_sn_t1 AS WITH t_1_W_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_sn_t0.w, 'a')) AS w
    FROM
      logica_test.W_sn_t0 AS W_sn_t0
    WHERE
      (LENGTH(W_sn_t0.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_r1 AS (SELECT
  W_MultBodyAggAux_f3.w AS w
FROM
  t_1_W_MultBodyAggAux_f3 AS W_MultBodyAggAux_f3
GROUP BY 1)
SELECT
  W_sn_r1.w AS w
FROM
  t_0_W_sn_r1 AS W_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.W_sn_t1

DROP TABLE IF EXISTS logica_test.W_sn_t2;
CREATE TABLE logica_test.W_sn_t2 AS WITH t_1_W_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_sn_t1.w, 'a')) AS w
    FROM
      logica_test.W_sn_t1 AS W_sn_t1
    WHERE
      (LENGTH(W_sn_t1.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_r2 AS (SELECT
  W_MultBodyAggAux_f4.w AS w
FROM
  t_1_W_MultBodyAggAux_f4 AS W_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  W_sn_r2.w AS w
FROM
  t_0_W_sn_r2 AS W_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.W_sn_t2

DROP TABLE IF EXISTS logica_test.W_sn_t3;
CREATE TABLE logica_test.W_sn_t3 AS WITH t_1_W_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_sn_t2.w, 'a')) AS w
    FROM
      logica_test.W_sn_t2 AS W_sn_t2
    WHERE
      (LENGTH(W_sn_t2.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_r3 AS (SELECT
  W_MultBodyAggAux_f5.w AS w
FROM
  t_1_W_MultBodyAggAux_f5 AS W_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  W_sn_r3.w AS w
FROM
  t_0_W_sn_r3 AS W_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.W_sn_t3

DROP TABLE IF EXISTS logica_test.W_sn_full;
CREATE TABLE logica_test.W_sn_full AS SELECT * FROM (
  
    SELECT
      W_sn_delta.w AS w
    FROM
      logica_test.W_sn_delta AS W_sn_delta
   UNION ALL
  
    SELECT
      W_sn_t1.w AS w
    FROM
      logica_test.W_sn_t1 AS W_sn_t1
   UNION ALL
  
    SELECT
      W_sn_t2.w AS w
    FROM
      logica_test.W_sn_t2 AS W_sn_t2
   UNION ALL
  
    SELECT
      W_sn_t3.w AS w
    FROM
      logica_test.W_sn_t3 AS W_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.W_sn_full

DROP TABLE IF EXISTS logica_test.W_sn_new;
CREATE TABLE logica_test.W_sn_new AS WITH t_1_W_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_sn_delta.w, 'a')) AS w
    FROM
      logica_test.W_sn_delta AS W_sn_delta
    WHERE
      (LENGTH(W_sn_delta.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_step AS (SELECT
  W_MultBodyAggAux_f6.w AS w
FROM
  t_1_W_MultBodyAggAux_f6 AS W_MultBodyAggAux_f6
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
CREATE TABLE logica_test.W_sn_delta AS WITH t_1_W_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_sn_new.w, 'a')) AS w
    FROM
      logica_test.W_sn_new AS W_sn_new
    WHERE
      (LENGTH(W_sn_new.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_back_step AS (SELECT
  W_MultBodyAggAux_f1.w AS w
FROM
  t_1_W_MultBodyAggAux_f1 AS W_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  W_sn_back_step.w AS w
FROM
  t_0_W_sn_back_step AS W_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.W_sn_full AS W_sn_full
  WHERE
    (W_sn_full.w = W_sn_back_step.w)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.W_sn_full SELECT * FROM logica_test.W_sn_delta;

DROP TABLE IF EXISTS logica_test.W_sn_new;
CREATE TABLE logica_test.W_sn_new AS WITH t_1_W_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_sn_delta.w, 'a')) AS w
    FROM
      logica_test.W_sn_delta AS W_sn_delta
    WHERE
      (LENGTH(W_sn_delta.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_step AS (SELECT
  W_MultBodyAggAux_f6.w AS w
FROM
  t_1_W_MultBodyAggAux_f6 AS W_MultBodyAggAux_f6
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
CREATE TABLE logica_test.W_sn_delta AS WITH t_1_W_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_sn_new.w, 'a')) AS w
    FROM
      logica_test.W_sn_new AS W_sn_new
    WHERE
      (LENGTH(W_sn_new.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_back_step AS (SELECT
  W_MultBodyAggAux_f1.w AS w
FROM
  t_1_W_MultBodyAggAux_f1 AS W_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  W_sn_back_step.w AS w
FROM
  t_0_W_sn_back_step AS W_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.W_sn_full AS W_sn_full
  WHERE
    (W_sn_full.w = W_sn_back_step.w)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.W_sn_full SELECT * FROM logica_test.W_sn_delta;

DROP TABLE IF EXISTS logica_test.W_sn_new;
CREATE TABLE logica_test.W_sn_new AS WITH t_1_W_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_sn_delta.w, 'a')) AS w
    FROM
      logica_test.W_sn_delta AS W_sn_delta
    WHERE
      (LENGTH(W_sn_delta.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_W_sn_step AS (SELECT
  W_MultBodyAggAux_f6.w AS w
FROM
  t_1_W_MultBodyAggAux_f6 AS W_MultBodyAggAux_f6
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

SELECT
  W_sn_full.w AS w
FROM
  logica_test.W_sn_full AS W_sn_full ORDER BY w;