DROP TABLE IF EXISTS synalog_test.T_sn_delta;
CREATE TABLE synalog_test.T_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_0_T_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T_MultBodyAggAux_f2.a AS a,
  T_MultBodyAggAux_f2.b AS b
FROM
  t_0_T_MultBodyAggAux_f2 AS T_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table synalog_test.T_sn_delta

DROP TABLE IF EXISTS synalog_test.T_sn_t0;
CREATE TABLE synalog_test.T_sn_t0 AS SELECT
  T_sn_delta.a AS a,
  T_sn_delta.b AS b
FROM
  synalog_test.T_sn_delta AS T_sn_delta
WHERE
  (1 = 0);

-- Interacting with table synalog_test.T_sn_t0

DROP TABLE IF EXISTS synalog_test.T_sn_t1;
CREATE TABLE synalog_test.T_sn_t1 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_t0.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_t0 AS T_sn_t0, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_t0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_r1 AS (SELECT
  T_MultBodyAggAux_f3.a AS a,
  T_MultBodyAggAux_f3.b AS b
FROM
  t_1_T_MultBodyAggAux_f3 AS T_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  T_sn_r1.a AS a,
  T_sn_r1.b AS b
FROM
  t_0_T_sn_r1 AS T_sn_r1
WHERE
  (1 = 0);

-- Interacting with table synalog_test.T_sn_t1

DROP TABLE IF EXISTS synalog_test.T_sn_t2;
CREATE TABLE synalog_test.T_sn_t2 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_t1.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_t1 AS T_sn_t1, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_t1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_r2 AS (SELECT
  T_MultBodyAggAux_f4.a AS a,
  T_MultBodyAggAux_f4.b AS b
FROM
  t_1_T_MultBodyAggAux_f4 AS T_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  T_sn_r2.a AS a,
  T_sn_r2.b AS b
FROM
  t_0_T_sn_r2 AS T_sn_r2
WHERE
  (1 = 0);

-- Interacting with table synalog_test.T_sn_t2

DROP TABLE IF EXISTS synalog_test.T_sn_t3;
CREATE TABLE synalog_test.T_sn_t3 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_t2.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_t2 AS T_sn_t2, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_t2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_r3 AS (SELECT
  T_MultBodyAggAux_f5.a AS a,
  T_MultBodyAggAux_f5.b AS b
FROM
  t_1_T_MultBodyAggAux_f5 AS T_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  T_sn_r3.a AS a,
  T_sn_r3.b AS b
FROM
  t_0_T_sn_r3 AS T_sn_r3
WHERE
  (1 = 0);

-- Interacting with table synalog_test.T_sn_t3

DROP TABLE IF EXISTS synalog_test.T_sn_t4;
CREATE TABLE synalog_test.T_sn_t4 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_t3.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_t3 AS T_sn_t3, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_t3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_r4 AS (SELECT
  T_MultBodyAggAux_f6.a AS a,
  T_MultBodyAggAux_f6.b AS b
FROM
  t_1_T_MultBodyAggAux_f6 AS T_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  T_sn_r4.a AS a,
  T_sn_r4.b AS b
FROM
  t_0_T_sn_r4 AS T_sn_r4
WHERE
  (1 = 0);

-- Interacting with table synalog_test.T_sn_t4

DROP TABLE IF EXISTS synalog_test.T_sn_t5;
CREATE TABLE synalog_test.T_sn_t5 AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_t4.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_t4 AS T_sn_t4, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_t4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_r5 AS (SELECT
  T_MultBodyAggAux_f7.a AS a,
  T_MultBodyAggAux_f7.b AS b
FROM
  t_1_T_MultBodyAggAux_f7 AS T_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  T_sn_r5.a AS a,
  T_sn_r5.b AS b
FROM
  t_0_T_sn_r5 AS T_sn_r5
WHERE
  (1 = 0);

-- Interacting with table synalog_test.T_sn_t5

DROP TABLE IF EXISTS synalog_test.T_sn_full;
CREATE TABLE synalog_test.T_sn_full AS SELECT * FROM (
  
    SELECT
      T_sn_delta.a AS a,
      T_sn_delta.b AS b
    FROM
      synalog_test.T_sn_delta AS T_sn_delta
   UNION ALL
  
    SELECT
      T_sn_t1.a AS a,
      T_sn_t1.b AS b
    FROM
      synalog_test.T_sn_t1 AS T_sn_t1
   UNION ALL
  
    SELECT
      T_sn_t2.a AS a,
      T_sn_t2.b AS b
    FROM
      synalog_test.T_sn_t2 AS T_sn_t2
   UNION ALL
  
    SELECT
      T_sn_t3.a AS a,
      T_sn_t3.b AS b
    FROM
      synalog_test.T_sn_t3 AS T_sn_t3
   UNION ALL
  
    SELECT
      T_sn_t4.a AS a,
      T_sn_t4.b AS b
    FROM
      synalog_test.T_sn_t4 AS T_sn_t4
   UNION ALL
  
    SELECT
      T_sn_t5.a AS a,
      T_sn_t5.b AS b
    FROM
      synalog_test.T_sn_t5 AS T_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_test.T_sn_full

DROP TABLE IF EXISTS synalog_test.T_sn_new;
CREATE TABLE synalog_test.T_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_delta AS T_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_step AS (SELECT
  T_MultBodyAggAux_f8.a AS a,
  T_MultBodyAggAux_f8.b AS b
FROM
  t_1_T_MultBodyAggAux_f8 AS T_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  T_sn_step.a AS a,
  T_sn_step.b AS b
FROM
  t_0_T_sn_step AS T_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_step.a) AND
    (T_sn_full.b <=> T_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_new;

DROP TABLE IF EXISTS synalog_test.T_sn_delta;
CREATE TABLE synalog_test.T_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_new AS T_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_back_step AS (SELECT
  T_MultBodyAggAux_f1.a AS a,
  T_MultBodyAggAux_f1.b AS b
FROM
  t_1_T_MultBodyAggAux_f1 AS T_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  T_sn_back_step.a AS a,
  T_sn_back_step.b AS b
FROM
  t_0_T_sn_back_step AS T_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_back_step.a) AND
    (T_sn_full.b <=> T_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_delta;

DROP TABLE IF EXISTS synalog_test.T_sn_new;
CREATE TABLE synalog_test.T_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_delta AS T_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_step AS (SELECT
  T_MultBodyAggAux_f8.a AS a,
  T_MultBodyAggAux_f8.b AS b
FROM
  t_1_T_MultBodyAggAux_f8 AS T_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  T_sn_step.a AS a,
  T_sn_step.b AS b
FROM
  t_0_T_sn_step AS T_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_step.a) AND
    (T_sn_full.b <=> T_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_new;

DROP TABLE IF EXISTS synalog_test.T_sn_delta;
CREATE TABLE synalog_test.T_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_new AS T_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_back_step AS (SELECT
  T_MultBodyAggAux_f1.a AS a,
  T_MultBodyAggAux_f1.b AS b
FROM
  t_1_T_MultBodyAggAux_f1 AS T_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  T_sn_back_step.a AS a,
  T_sn_back_step.b AS b
FROM
  t_0_T_sn_back_step AS T_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_back_step.a) AND
    (T_sn_full.b <=> T_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_delta;

DROP TABLE IF EXISTS synalog_test.T_sn_new;
CREATE TABLE synalog_test.T_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_delta AS T_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_step AS (SELECT
  T_MultBodyAggAux_f8.a AS a,
  T_MultBodyAggAux_f8.b AS b
FROM
  t_1_T_MultBodyAggAux_f8 AS T_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  T_sn_step.a AS a,
  T_sn_step.b AS b
FROM
  t_0_T_sn_step AS T_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_step.a) AND
    (T_sn_full.b <=> T_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_new;

DROP TABLE IF EXISTS synalog_test.T_sn_delta;
CREATE TABLE synalog_test.T_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_new AS T_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_back_step AS (SELECT
  T_MultBodyAggAux_f1.a AS a,
  T_MultBodyAggAux_f1.b AS b
FROM
  t_1_T_MultBodyAggAux_f1 AS T_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  T_sn_back_step.a AS a,
  T_sn_back_step.b AS b
FROM
  t_0_T_sn_back_step AS T_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_back_step.a) AND
    (T_sn_full.b <=> T_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_delta;

DROP TABLE IF EXISTS synalog_test.T_sn_new;
CREATE TABLE synalog_test.T_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_delta AS T_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_step AS (SELECT
  T_MultBodyAggAux_f8.a AS a,
  T_MultBodyAggAux_f8.b AS b
FROM
  t_1_T_MultBodyAggAux_f8 AS T_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  T_sn_step.a AS a,
  T_sn_step.b AS b
FROM
  t_0_T_sn_step AS T_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_step.a) AND
    (T_sn_full.b <=> T_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_new;

DROP TABLE IF EXISTS synalog_test.T_sn_delta;
CREATE TABLE synalog_test.T_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_new AS T_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_back_step AS (SELECT
  T_MultBodyAggAux_f1.a AS a,
  T_MultBodyAggAux_f1.b AS b
FROM
  t_1_T_MultBodyAggAux_f1 AS T_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  T_sn_back_step.a AS a,
  T_sn_back_step.b AS b
FROM
  t_0_T_sn_back_step AS T_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_back_step.a) AND
    (T_sn_full.b <=> T_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_delta;

DROP TABLE IF EXISTS synalog_test.T_sn_new;
CREATE TABLE synalog_test.T_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_delta AS T_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_step AS (SELECT
  T_MultBodyAggAux_f8.a AS a,
  T_MultBodyAggAux_f8.b AS b
FROM
  t_1_T_MultBodyAggAux_f8 AS T_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  T_sn_step.a AS a,
  T_sn_step.b AS b
FROM
  t_0_T_sn_step AS T_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_step.a) AND
    (T_sn_full.b <=> T_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_new;

DROP TABLE IF EXISTS synalog_test.T_sn_delta;
CREATE TABLE synalog_test.T_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_new AS T_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_back_step AS (SELECT
  T_MultBodyAggAux_f1.a AS a,
  T_MultBodyAggAux_f1.b AS b
FROM
  t_1_T_MultBodyAggAux_f1 AS T_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  T_sn_back_step.a AS a,
  T_sn_back_step.b AS b
FROM
  t_0_T_sn_back_step AS T_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_back_step.a) AND
    (T_sn_full.b <=> T_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_delta;

DROP TABLE IF EXISTS synalog_test.T_sn_new;
CREATE TABLE synalog_test.T_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_delta AS T_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_step AS (SELECT
  T_MultBodyAggAux_f8.a AS a,
  T_MultBodyAggAux_f8.b AS b
FROM
  t_1_T_MultBodyAggAux_f8 AS T_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  T_sn_step.a AS a,
  T_sn_step.b AS b
FROM
  t_0_T_sn_step AS T_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_step.a) AND
    (T_sn_full.b <=> T_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_new;

DROP TABLE IF EXISTS synalog_test.T_sn_delta;
CREATE TABLE synalog_test.T_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_new AS T_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_back_step AS (SELECT
  T_MultBodyAggAux_f1.a AS a,
  T_MultBodyAggAux_f1.b AS b
FROM
  t_1_T_MultBodyAggAux_f1 AS T_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  T_sn_back_step.a AS a,
  T_sn_back_step.b AS b
FROM
  t_0_T_sn_back_step AS T_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_back_step.a) AND
    (T_sn_full.b <=> T_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_delta;

DROP TABLE IF EXISTS synalog_test.T_sn_new;
CREATE TABLE synalog_test.T_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_delta AS T_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_step AS (SELECT
  T_MultBodyAggAux_f8.a AS a,
  T_MultBodyAggAux_f8.b AS b
FROM
  t_1_T_MultBodyAggAux_f8 AS T_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  T_sn_step.a AS a,
  T_sn_step.b AS b
FROM
  t_0_T_sn_step AS T_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_step.a) AND
    (T_sn_full.b <=> T_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_new;

DROP TABLE IF EXISTS synalog_test.T_sn_delta;
CREATE TABLE synalog_test.T_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_new AS T_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_back_step AS (SELECT
  T_MultBodyAggAux_f1.a AS a,
  T_MultBodyAggAux_f1.b AS b
FROM
  t_1_T_MultBodyAggAux_f1 AS T_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  T_sn_back_step.a AS a,
  T_sn_back_step.b AS b
FROM
  t_0_T_sn_back_step AS T_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_back_step.a) AND
    (T_sn_full.b <=> T_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_delta;

DROP TABLE IF EXISTS synalog_test.T_sn_new;
CREATE TABLE synalog_test.T_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_delta AS T_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_step AS (SELECT
  T_MultBodyAggAux_f8.a AS a,
  T_MultBodyAggAux_f8.b AS b
FROM
  t_1_T_MultBodyAggAux_f8 AS T_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  T_sn_step.a AS a,
  T_sn_step.b AS b
FROM
  t_0_T_sn_step AS T_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_step.a) AND
    (T_sn_full.b <=> T_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_new;

DROP TABLE IF EXISTS synalog_test.T_sn_delta;
CREATE TABLE synalog_test.T_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_new AS T_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_back_step AS (SELECT
  T_MultBodyAggAux_f1.a AS a,
  T_MultBodyAggAux_f1.b AS b
FROM
  t_1_T_MultBodyAggAux_f1 AS T_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  T_sn_back_step.a AS a,
  T_sn_back_step.b AS b
FROM
  t_0_T_sn_back_step AS T_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_back_step.a) AND
    (T_sn_full.b <=> T_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_delta;

DROP TABLE IF EXISTS synalog_test.T_sn_new;
CREATE TABLE synalog_test.T_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_delta AS T_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_step AS (SELECT
  T_MultBodyAggAux_f8.a AS a,
  T_MultBodyAggAux_f8.b AS b
FROM
  t_1_T_MultBodyAggAux_f8 AS T_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  T_sn_step.a AS a,
  T_sn_step.b AS b
FROM
  t_0_T_sn_step AS T_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_step.a) AND
    (T_sn_full.b <=> T_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_new;

DROP TABLE IF EXISTS synalog_test.T_sn_delta;
CREATE TABLE synalog_test.T_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_new AS T_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_back_step AS (SELECT
  T_MultBodyAggAux_f1.a AS a,
  T_MultBodyAggAux_f1.b AS b
FROM
  t_1_T_MultBodyAggAux_f1 AS T_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  T_sn_back_step.a AS a,
  T_sn_back_step.b AS b
FROM
  t_0_T_sn_back_step AS T_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_back_step.a) AND
    (T_sn_full.b <=> T_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_delta;

DROP TABLE IF EXISTS synalog_test.T_sn_new;
CREATE TABLE synalog_test.T_sn_new AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_delta.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_delta AS T_sn_delta, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_step AS (SELECT
  T_MultBodyAggAux_f8.a AS a,
  T_MultBodyAggAux_f8.b AS b
FROM
  t_1_T_MultBodyAggAux_f8 AS T_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  T_sn_step.a AS a,
  T_sn_step.b AS b
FROM
  t_0_T_sn_step AS T_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_step.a) AND
    (T_sn_full.b <=> T_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_new;

DROP TABLE IF EXISTS synalog_test.T_sn_delta;
CREATE TABLE synalog_test.T_sn_delta AS WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (1, 3),
  (3, 4),
  (5, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_1_T_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_sn_new.a AS a,
      t_2_E.b AS b
    FROM
      synalog_test.T_sn_new AS T_sn_new, t_1_E AS t_2_E
    WHERE
      (t_2_E.a <=> T_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_T_sn_back_step AS (SELECT
  T_MultBodyAggAux_f1.a AS a,
  T_MultBodyAggAux_f1.b AS b
FROM
  t_1_T_MultBodyAggAux_f1 AS T_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  T_sn_back_step.a AS a,
  T_sn_back_step.b AS b
FROM
  t_0_T_sn_back_step AS T_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.T_sn_full AS T_sn_full
  WHERE
    (T_sn_full.a <=> T_sn_back_step.a) AND
    (T_sn_full.b <=> T_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.T_sn_full SELECT * FROM synalog_test.T_sn_delta;

SELECT
  T_sn_full.a AS a,
  T_sn_full.b AS b
FROM
  synalog_test.T_sn_full AS T_sn_full ORDER BY a NULLS LAST, b NULLS LAST;