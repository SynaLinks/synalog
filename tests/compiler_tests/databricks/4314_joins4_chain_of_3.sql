DROP TABLE IF EXISTS logica_test.Up_sn_delta;
CREATE TABLE logica_test.Up_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_0_Up_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Up_MultBodyAggAux_f2.id AS id
FROM
  t_0_Up_MultBodyAggAux_f2 AS Up_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table logica_test.Up_sn_delta

DROP TABLE IF EXISTS logica_test.Up_sn_t0;
CREATE TABLE logica_test.Up_sn_t0 AS SELECT
  Up_sn_delta.id AS id
FROM
  logica_test.Up_sn_delta AS Up_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Up_sn_t0

DROP TABLE IF EXISTS logica_test.Up_sn_t1;
CREATE TABLE logica_test.Up_sn_t1 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_t0 AS Up_sn_t0, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_t0.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_r1 AS (SELECT
  Up_MultBodyAggAux_f3.id AS id
FROM
  t_1_Up_MultBodyAggAux_f3 AS Up_MultBodyAggAux_f3
GROUP BY 1)
SELECT
  Up_sn_r1.id AS id
FROM
  t_0_Up_sn_r1 AS Up_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Up_sn_t1

DROP TABLE IF EXISTS logica_test.Up_sn_t2;
CREATE TABLE logica_test.Up_sn_t2 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_t1 AS Up_sn_t1, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_t1.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_r2 AS (SELECT
  Up_MultBodyAggAux_f4.id AS id
FROM
  t_1_Up_MultBodyAggAux_f4 AS Up_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  Up_sn_r2.id AS id
FROM
  t_0_Up_sn_r2 AS Up_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Up_sn_t2

DROP TABLE IF EXISTS logica_test.Up_sn_t3;
CREATE TABLE logica_test.Up_sn_t3 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_t2 AS Up_sn_t2, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_t2.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_r3 AS (SELECT
  Up_MultBodyAggAux_f5.id AS id
FROM
  t_1_Up_MultBodyAggAux_f5 AS Up_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Up_sn_r3.id AS id
FROM
  t_0_Up_sn_r3 AS Up_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Up_sn_t3

DROP TABLE IF EXISTS logica_test.Up_sn_full;
CREATE TABLE logica_test.Up_sn_full AS SELECT * FROM (
  
    SELECT
      Up_sn_delta.id AS id
    FROM
      logica_test.Up_sn_delta AS Up_sn_delta
   UNION ALL
  
    SELECT
      Up_sn_t1.id AS id
    FROM
      logica_test.Up_sn_t1 AS Up_sn_t1
   UNION ALL
  
    SELECT
      Up_sn_t2.id AS id
    FROM
      logica_test.Up_sn_t2 AS Up_sn_t2
   UNION ALL
  
    SELECT
      Up_sn_t3.id AS id
    FROM
      logica_test.Up_sn_t3 AS Up_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Up_sn_full

DROP TABLE IF EXISTS logica_test.Up_sn_new;
CREATE TABLE logica_test.Up_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_delta AS Up_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_delta.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_step AS (SELECT
  Up_MultBodyAggAux_f6.id AS id
FROM
  t_1_Up_MultBodyAggAux_f6 AS Up_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Up_sn_step.id AS id
FROM
  t_0_Up_sn_step AS Up_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Up_sn_full AS Up_sn_full
  WHERE
    (Up_sn_full.id = Up_sn_step.id)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Up_sn_full SELECT * FROM logica_test.Up_sn_new;

DROP TABLE IF EXISTS logica_test.Up_sn_delta;
CREATE TABLE logica_test.Up_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_new AS Up_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_new.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_back_step AS (SELECT
  Up_MultBodyAggAux_f1.id AS id
FROM
  t_1_Up_MultBodyAggAux_f1 AS Up_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Up_sn_back_step.id AS id
FROM
  t_0_Up_sn_back_step AS Up_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Up_sn_full AS Up_sn_full
  WHERE
    (Up_sn_full.id = Up_sn_back_step.id)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Up_sn_full SELECT * FROM logica_test.Up_sn_delta;

DROP TABLE IF EXISTS logica_test.Up_sn_new;
CREATE TABLE logica_test.Up_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_delta AS Up_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_delta.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_step AS (SELECT
  Up_MultBodyAggAux_f6.id AS id
FROM
  t_1_Up_MultBodyAggAux_f6 AS Up_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Up_sn_step.id AS id
FROM
  t_0_Up_sn_step AS Up_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Up_sn_full AS Up_sn_full
  WHERE
    (Up_sn_full.id = Up_sn_step.id)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Up_sn_full SELECT * FROM logica_test.Up_sn_new;

DROP TABLE IF EXISTS logica_test.Up_sn_delta;
CREATE TABLE logica_test.Up_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_new AS Up_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_new.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_back_step AS (SELECT
  Up_MultBodyAggAux_f1.id AS id
FROM
  t_1_Up_MultBodyAggAux_f1 AS Up_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Up_sn_back_step.id AS id
FROM
  t_0_Up_sn_back_step AS Up_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Up_sn_full AS Up_sn_full
  WHERE
    (Up_sn_full.id = Up_sn_back_step.id)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Up_sn_full SELECT * FROM logica_test.Up_sn_delta;

DROP TABLE IF EXISTS logica_test.Up_sn_new;
CREATE TABLE logica_test.Up_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_delta AS Up_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_delta.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_step AS (SELECT
  Up_MultBodyAggAux_f6.id AS id
FROM
  t_1_Up_MultBodyAggAux_f6 AS Up_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Up_sn_step.id AS id
FROM
  t_0_Up_sn_step AS Up_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Up_sn_full AS Up_sn_full
  WHERE
    (Up_sn_full.id = Up_sn_step.id)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Up_sn_full SELECT * FROM logica_test.Up_sn_new;

DROP TABLE IF EXISTS logica_test.Up_sn_delta;
CREATE TABLE logica_test.Up_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_new AS Up_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_new.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_back_step AS (SELECT
  Up_MultBodyAggAux_f1.id AS id
FROM
  t_1_Up_MultBodyAggAux_f1 AS Up_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Up_sn_back_step.id AS id
FROM
  t_0_Up_sn_back_step AS Up_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Up_sn_full AS Up_sn_full
  WHERE
    (Up_sn_full.id = Up_sn_back_step.id)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Up_sn_full SELECT * FROM logica_test.Up_sn_delta;

DROP TABLE IF EXISTS logica_test.Up_sn_new;
CREATE TABLE logica_test.Up_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_delta AS Up_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_delta.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_step AS (SELECT
  Up_MultBodyAggAux_f6.id AS id
FROM
  t_1_Up_MultBodyAggAux_f6 AS Up_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Up_sn_step.id AS id
FROM
  t_0_Up_sn_step AS Up_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Up_sn_full AS Up_sn_full
  WHERE
    (Up_sn_full.id = Up_sn_step.id)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Up_sn_full SELECT * FROM logica_test.Up_sn_new;

DROP TABLE IF EXISTS logica_test.Up_sn_delta;
CREATE TABLE logica_test.Up_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_new AS Up_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_new.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_back_step AS (SELECT
  Up_MultBodyAggAux_f1.id AS id
FROM
  t_1_Up_MultBodyAggAux_f1 AS Up_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Up_sn_back_step.id AS id
FROM
  t_0_Up_sn_back_step AS Up_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Up_sn_full AS Up_sn_full
  WHERE
    (Up_sn_full.id = Up_sn_back_step.id)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Up_sn_full SELECT * FROM logica_test.Up_sn_delta;

DROP TABLE IF EXISTS logica_test.Up_sn_new;
CREATE TABLE logica_test.Up_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_delta AS Up_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_delta.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_step AS (SELECT
  Up_MultBodyAggAux_f6.id AS id
FROM
  t_1_Up_MultBodyAggAux_f6 AS Up_MultBodyAggAux_f6
GROUP BY 1)
SELECT
  Up_sn_step.id AS id
FROM
  t_0_Up_sn_step AS Up_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Up_sn_full AS Up_sn_full
  WHERE
    (Up_sn_full.id = Up_sn_step.id)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Up_sn_full SELECT * FROM logica_test.Up_sn_new;

DROP TABLE IF EXISTS logica_test.Up_sn_delta;
CREATE TABLE logica_test.Up_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_1_Up_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.boss AS id
    FROM
      t_1_E AS E
    WHERE
      (E.id = 3)
   UNION ALL
  
    SELECT
      t_2_E.boss AS id
    FROM
      logica_test.Up_sn_new AS Up_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.id = Up_sn_new.id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Up_sn_back_step AS (SELECT
  Up_MultBodyAggAux_f1.id AS id
FROM
  t_1_Up_MultBodyAggAux_f1 AS Up_MultBodyAggAux_f1
GROUP BY 1)
SELECT
  Up_sn_back_step.id AS id
FROM
  t_0_Up_sn_back_step AS Up_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Up_sn_full AS Up_sn_full
  WHERE
    (Up_sn_full.id = Up_sn_back_step.id)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Up_sn_full SELECT * FROM logica_test.Up_sn_delta;

WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay))
SELECT
  E.n AS n
FROM
  logica_test.Up_sn_full AS Up_sn_full, t_1_E AS E
WHERE
  (E.id = Up_sn_full.id) ORDER BY n NULLS LAST;