DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS WITH t_0_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_0_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.A_sn_delta

DROP TABLE IF EXISTS logica_test.A_sn_full;
CREATE TABLE logica_test.A_sn_full AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      A_sn_delta.y AS y
    FROM
      logica_test.A_sn_delta AS A_sn_delta
   UNION ALL
  
    SELECT
      A_sn_step.y AS y
    FROM
      t_0_A_sn_step AS A_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.A_sn_full

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS WITH t_0_B_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f3.y AS y
FROM
  t_0_B_MultBodyAggAux_f3 AS B_MultBodyAggAux_f3
GROUP BY 1;

-- Interacting with table logica_test.B_sn_delta

DROP TABLE IF EXISTS logica_test.B_sn_full;
CREATE TABLE logica_test.B_sn_full AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      B_sn_delta.y AS y
    FROM
      logica_test.B_sn_delta AS B_sn_delta
   UNION ALL
  
    SELECT
      B_sn_step.y AS y
    FROM
      t_0_B_sn_step AS B_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.B_sn_full

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_new;
CREATE TABLE logica_test.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.A_sn_delta AS t_2_A_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_A_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.A_sn_full SELECT * FROM logica_test.A_sn_new;

DROP TABLE IF EXISTS logica_test.A_sn_delta;
CREATE TABLE logica_test.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_test.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

INSERT INTO logica_test.B_sn_full SELECT * FROM logica_test.B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_delta;
CREATE TABLE logica_test.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_test.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_test.B_sn_new;
CREATE TABLE logica_test.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_test.B_sn_delta AS t_2_B_sn_delta, explode(SEQUENCE(0, 100 - 1)) AS pushkin(x_11)
    WHERE
      (t_2_B_sn_delta.y = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY 1)
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
GROUP BY 1;

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