DROP TABLE IF EXISTS synalog_test.P_sn_delta;
CREATE TABLE synalog_test.P_sn_delta AS WITH t_0_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P_MultBodyAggAux_f2.n AS n,
  P_MultBodyAggAux_f2.h AS h
FROM
  t_0_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table synalog_test.P_sn_delta

DROP TABLE IF EXISTS synalog_test.P_sn_t0;
CREATE TABLE synalog_test.P_sn_t0 AS SELECT
  P_sn_delta.n AS n,
  P_sn_delta.h AS h
FROM
  synalog_test.P_sn_delta AS P_sn_delta
WHERE
  (1 = 0);

-- Interacting with table synalog_test.P_sn_t0

DROP TABLE IF EXISTS synalog_test.P_sn_t1;
CREATE TABLE synalog_test.P_sn_t1 AS WITH t_2_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1)
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      E.b AS n,
      ((P_sn_t0.h) + (1)) AS h
    FROM
      synalog_test.P_sn_t0 AS P_sn_t0, t_2_E AS E
    WHERE
      (E.a <=> P_sn_t0.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r1 AS (SELECT
  P_MultBodyAggAux_f3.n AS n,
  P_MultBodyAggAux_f3.h AS h
FROM
  t_1_P_MultBodyAggAux_f3 AS P_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  P_sn_r1.n AS n,
  P_sn_r1.h AS h
FROM
  t_0_P_sn_r1 AS P_sn_r1
WHERE
  (1 = 0);

-- Interacting with table synalog_test.P_sn_t1

DROP TABLE IF EXISTS synalog_test.P_sn_t2;
CREATE TABLE synalog_test.P_sn_t2 AS WITH t_2_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1)
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      E.b AS n,
      ((P_sn_t1.h) + (1)) AS h
    FROM
      synalog_test.P_sn_t1 AS P_sn_t1, t_2_E AS E
    WHERE
      (E.a <=> P_sn_t1.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r2 AS (SELECT
  P_MultBodyAggAux_f4.n AS n,
  P_MultBodyAggAux_f4.h AS h
FROM
  t_1_P_MultBodyAggAux_f4 AS P_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  P_sn_r2.n AS n,
  P_sn_r2.h AS h
FROM
  t_0_P_sn_r2 AS P_sn_r2
WHERE
  (1 = 0);

-- Interacting with table synalog_test.P_sn_t2

DROP TABLE IF EXISTS synalog_test.P_sn_t3;
CREATE TABLE synalog_test.P_sn_t3 AS WITH t_2_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1)
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      E.b AS n,
      ((P_sn_t2.h) + (1)) AS h
    FROM
      synalog_test.P_sn_t2 AS P_sn_t2, t_2_E AS E
    WHERE
      (E.a <=> P_sn_t2.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r3 AS (SELECT
  P_MultBodyAggAux_f5.n AS n,
  P_MultBodyAggAux_f5.h AS h
FROM
  t_1_P_MultBodyAggAux_f5 AS P_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  P_sn_r3.n AS n,
  P_sn_r3.h AS h
FROM
  t_0_P_sn_r3 AS P_sn_r3
WHERE
  (1 = 0);

-- Interacting with table synalog_test.P_sn_t3

DROP TABLE IF EXISTS synalog_test.P_sn_t4;
CREATE TABLE synalog_test.P_sn_t4 AS WITH t_2_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1)
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      E.b AS n,
      ((P_sn_t3.h) + (1)) AS h
    FROM
      synalog_test.P_sn_t3 AS P_sn_t3, t_2_E AS E
    WHERE
      (E.a <=> P_sn_t3.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r4 AS (SELECT
  P_MultBodyAggAux_f6.n AS n,
  P_MultBodyAggAux_f6.h AS h
FROM
  t_1_P_MultBodyAggAux_f6 AS P_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  P_sn_r4.n AS n,
  P_sn_r4.h AS h
FROM
  t_0_P_sn_r4 AS P_sn_r4
WHERE
  (1 = 0);

-- Interacting with table synalog_test.P_sn_t4

DROP TABLE IF EXISTS synalog_test.P_sn_t5;
CREATE TABLE synalog_test.P_sn_t5 AS WITH t_2_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1)
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      E.b AS n,
      ((P_sn_t4.h) + (1)) AS h
    FROM
      synalog_test.P_sn_t4 AS P_sn_t4, t_2_E AS E
    WHERE
      (E.a <=> P_sn_t4.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r5 AS (SELECT
  P_MultBodyAggAux_f7.n AS n,
  P_MultBodyAggAux_f7.h AS h
FROM
  t_1_P_MultBodyAggAux_f7 AS P_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  P_sn_r5.n AS n,
  P_sn_r5.h AS h
FROM
  t_0_P_sn_r5 AS P_sn_r5
WHERE
  (1 = 0);

-- Interacting with table synalog_test.P_sn_t5

DROP TABLE IF EXISTS synalog_test.P_sn_full;
CREATE TABLE synalog_test.P_sn_full AS SELECT * FROM (
  
    SELECT
      P_sn_delta.n AS n,
      P_sn_delta.h AS h
    FROM
      synalog_test.P_sn_delta AS P_sn_delta
   UNION ALL
  
    SELECT
      P_sn_t1.n AS n,
      P_sn_t1.h AS h
    FROM
      synalog_test.P_sn_t1 AS P_sn_t1
   UNION ALL
  
    SELECT
      P_sn_t2.n AS n,
      P_sn_t2.h AS h
    FROM
      synalog_test.P_sn_t2 AS P_sn_t2
   UNION ALL
  
    SELECT
      P_sn_t3.n AS n,
      P_sn_t3.h AS h
    FROM
      synalog_test.P_sn_t3 AS P_sn_t3
   UNION ALL
  
    SELECT
      P_sn_t4.n AS n,
      P_sn_t4.h AS h
    FROM
      synalog_test.P_sn_t4 AS P_sn_t4
   UNION ALL
  
    SELECT
      P_sn_t5.n AS n,
      P_sn_t5.h AS h
    FROM
      synalog_test.P_sn_t5 AS P_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_test.P_sn_full

DROP TABLE IF EXISTS synalog_test.P_sn_new;
CREATE TABLE synalog_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1)
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      E.b AS n,
      ((P_sn_delta.h) + (1)) AS h
    FROM
      synalog_test.P_sn_delta AS P_sn_delta, t_2_E AS E
    WHERE
      (E.a <=> P_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f8.n AS n,
  P_MultBodyAggAux_f8.h AS h
FROM
  t_1_P_MultBodyAggAux_f8 AS P_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  P_sn_step.n AS n,
  P_sn_step.h AS h
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n <=> P_sn_step.n) AND
    (P_sn_full.h <=> P_sn_step.h)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.P_sn_full SELECT * FROM synalog_test.P_sn_new;

DROP TABLE IF EXISTS synalog_test.P_sn_delta;
CREATE TABLE synalog_test.P_sn_delta AS WITH t_2_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1)
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      E.b AS n,
      ((P_sn_new.h) + (1)) AS h
    FROM
      synalog_test.P_sn_new AS P_sn_new, t_2_E AS E
    WHERE
      (E.a <=> P_sn_new.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_back_step AS (SELECT
  P_MultBodyAggAux_f1.n AS n,
  P_MultBodyAggAux_f1.h AS h
FROM
  t_1_P_MultBodyAggAux_f1 AS P_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  P_sn_back_step.n AS n,
  P_sn_back_step.h AS h
FROM
  t_0_P_sn_back_step AS P_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n <=> P_sn_back_step.n) AND
    (P_sn_full.h <=> P_sn_back_step.h)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.P_sn_full SELECT * FROM synalog_test.P_sn_delta;

DROP TABLE IF EXISTS synalog_test.P_sn_new;
CREATE TABLE synalog_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1)
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      E.b AS n,
      ((P_sn_delta.h) + (1)) AS h
    FROM
      synalog_test.P_sn_delta AS P_sn_delta, t_2_E AS E
    WHERE
      (E.a <=> P_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f8.n AS n,
  P_MultBodyAggAux_f8.h AS h
FROM
  t_1_P_MultBodyAggAux_f8 AS P_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  P_sn_step.n AS n,
  P_sn_step.h AS h
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n <=> P_sn_step.n) AND
    (P_sn_full.h <=> P_sn_step.h)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.P_sn_full SELECT * FROM synalog_test.P_sn_new;

DROP TABLE IF EXISTS synalog_test.P_sn_delta;
CREATE TABLE synalog_test.P_sn_delta AS WITH t_2_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1)
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      E.b AS n,
      ((P_sn_new.h) + (1)) AS h
    FROM
      synalog_test.P_sn_new AS P_sn_new, t_2_E AS E
    WHERE
      (E.a <=> P_sn_new.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_back_step AS (SELECT
  P_MultBodyAggAux_f1.n AS n,
  P_MultBodyAggAux_f1.h AS h
FROM
  t_1_P_MultBodyAggAux_f1 AS P_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  P_sn_back_step.n AS n,
  P_sn_back_step.h AS h
FROM
  t_0_P_sn_back_step AS P_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n <=> P_sn_back_step.n) AND
    (P_sn_full.h <=> P_sn_back_step.h)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.P_sn_full SELECT * FROM synalog_test.P_sn_delta;

DROP TABLE IF EXISTS synalog_test.P_sn_new;
CREATE TABLE synalog_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1)
AS UNUSED_TABLE_NAME(a, b)),
t_1_P_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      E.b AS n,
      ((P_sn_delta.h) + (1)) AS h
    FROM
      synalog_test.P_sn_delta AS P_sn_delta, t_2_E AS E
    WHERE
      (E.a <=> P_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f8.n AS n,
  P_MultBodyAggAux_f8.h AS h
FROM
  t_1_P_MultBodyAggAux_f8 AS P_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  P_sn_step.n AS n,
  P_sn_step.h AS h
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n <=> P_sn_step.n) AND
    (P_sn_full.h <=> P_sn_step.h)) IS NULL)
GROUP BY 1, 2;

INSERT INTO synalog_test.P_sn_full SELECT * FROM synalog_test.P_sn_new;

SELECT
  P_sn_full.n AS n,
  P_sn_full.h AS h
FROM
  synalog_test.P_sn_full AS P_sn_full ORDER BY h NULLS LAST;