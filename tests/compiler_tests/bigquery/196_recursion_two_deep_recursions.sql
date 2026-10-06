DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS WITH t_0_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_0_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY y;

-- Interacting with table logica_test.A_sn_delta

DROP TABLE IF EXISTS logica_test.A_sn_t0;
CREATE TABLE logica_test.A_sn_t0 AS SELECT
  A_sn_delta.y AS y
FROM
  logica_test.A_sn_delta AS A_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.A_sn_t0

DROP TABLE IF EXISTS logica_test.A_sn_t1;
CREATE TABLE logica_test.A_sn_t1 AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_t0 AS A_sn_t0, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_t0.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_r1 AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY y)
SELECT
  A_sn_r1.y AS y
FROM
  t_0_A_sn_r1 AS A_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.A_sn_t1

DROP TABLE IF EXISTS logica_test.A_sn_t2;
CREATE TABLE logica_test.A_sn_t2 AS WITH t_1_A_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_t1 AS A_sn_t1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_t1.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_r2 AS (SELECT
  A_MultBodyAggAux_f3.y AS y
FROM
  t_1_A_MultBodyAggAux_f3 AS A_MultBodyAggAux_f3
GROUP BY y)
SELECT
  A_sn_r2.y AS y
FROM
  t_0_A_sn_r2 AS A_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.A_sn_t2

DROP TABLE IF EXISTS logica_test.A_sn_t3;
CREATE TABLE logica_test.A_sn_t3 AS WITH t_1_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_t2 AS A_sn_t2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_t2.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_r3 AS (SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_1_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y)
SELECT
  A_sn_r3.y AS y
FROM
  t_0_A_sn_r3 AS A_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.A_sn_t3

DROP TABLE IF EXISTS logica_test.A_sn_full;
CREATE TABLE logica_test.A_sn_full AS SELECT * FROM (
  
    SELECT
      A_sn_delta.y AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta
   UNION ALL
  
    SELECT
      A_sn_t1.y AS y
    FROM
      logica_test.A_sn_t1 AS A_sn_t1
   UNION ALL
  
    SELECT
      A_sn_t2.y AS y
    FROM
      logica_test.A_sn_t2 AS A_sn_t2
   UNION ALL
  
    SELECT
      A_sn_t3.y AS y
    FROM
      logica_test.A_sn_t3 AS A_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.A_sn_full

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS WITH t_0_B_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f6.y AS y
FROM
  t_0_B_MultBodyAggAux_f6 AS B_MultBodyAggAux_f6
GROUP BY y;

-- Interacting with table logica_test.B_sn_delta

DROP TABLE IF EXISTS logica_test.B_sn_t0;
CREATE TABLE logica_test.B_sn_t0 AS SELECT
  B_sn_delta.y AS y
FROM
  logica_test.B_sn_delta AS B_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.B_sn_t0

DROP TABLE IF EXISTS logica_test.B_sn_t1;
CREATE TABLE logica_test.B_sn_t1 AS WITH t_1_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_t0 AS B_sn_t0, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_t0.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_r1 AS (SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_1_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY y)
SELECT
  B_sn_r1.y AS y
FROM
  t_0_B_sn_r1 AS B_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.B_sn_t1

DROP TABLE IF EXISTS logica_test.B_sn_t2;
CREATE TABLE logica_test.B_sn_t2 AS WITH t_1_B_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_t1 AS B_sn_t1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_t1.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_r2 AS (SELECT
  B_MultBodyAggAux_f8.y AS y
FROM
  t_1_B_MultBodyAggAux_f8 AS B_MultBodyAggAux_f8
GROUP BY y)
SELECT
  B_sn_r2.y AS y
FROM
  t_0_B_sn_r2 AS B_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.B_sn_t2

DROP TABLE IF EXISTS logica_test.B_sn_t3;
CREATE TABLE logica_test.B_sn_t3 AS WITH t_1_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_t2 AS B_sn_t2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_t2.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_r3 AS (SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_1_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y)
SELECT
  B_sn_r3.y AS y
FROM
  t_0_B_sn_r3 AS B_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.B_sn_t3

DROP TABLE IF EXISTS logica_test.B_sn_full;
CREATE TABLE logica_test.B_sn_full AS SELECT * FROM (
  
    SELECT
      B_sn_delta.y AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta
   UNION ALL
  
    SELECT
      B_sn_t1.y AS y
    FROM
      logica_test.B_sn_t1 AS B_sn_t1
   UNION ALL
  
    SELECT
      B_sn_t2.y AS y
    FROM
      logica_test.B_sn_t2 AS B_sn_t2
   UNION ALL
  
    SELECT
      B_sn_t3.y AS y
    FROM
      logica_test.B_sn_t3 AS B_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.B_sn_full

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_1_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.A_sn_full AS A_sn_full
  WHERE
    (A_sn_full.y = A_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_1_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.B_sn_full AS B_sn_full
  WHERE
    (B_sn_full.y = B_sn_step.y)) IS NULL)
GROUP BY y;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

SELECT
  MAX(A_sn_full.y) AS a,
  MAX(B_sn_full.y) AS b
FROM
  logica_test.A_sn_full AS A_sn_full, logica_test.B_sn_full AS B_sn_full;