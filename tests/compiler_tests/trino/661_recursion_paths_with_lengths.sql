DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_1_E.b AS n,
      1 AS l
    FROM
      t_2_E AS t_1_E
    WHERE
      (t_1_E.a = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P_MultBodyAggAux_f2.n AS n,
  P_MultBodyAggAux_f2.l AS l
FROM
  t_0_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table logica_test.P_sn_delta

DROP TABLE IF EXISTS logica_test.P_sn_t0;
CREATE TABLE logica_test.P_sn_t0 AS SELECT
  P_sn_delta.n AS n,
  P_sn_delta.l AS l
FROM
  logica_test.P_sn_delta AS P_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t0

DROP TABLE IF EXISTS logica_test.P_sn_t1;
CREATE TABLE logica_test.P_sn_t1 AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((P_sn_t0.l) + (1)) AS l
    FROM
      logica_test.P_sn_t0 AS P_sn_t0, t_2_E AS E
    WHERE
      (P_sn_t0.l < 3) AND
      (E.a = P_sn_t0.n)
   UNION ALL
  
    SELECT
      t_2_E.b AS n,
      1 AS l
    FROM
      t_2_E
    WHERE
      (t_2_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r1 AS (SELECT
  P_MultBodyAggAux_f3.n AS n,
  P_MultBodyAggAux_f3.l AS l
FROM
  t_1_P_MultBodyAggAux_f3 AS P_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  P_sn_r1.n AS n,
  P_sn_r1.l AS l
FROM
  t_0_P_sn_r1 AS P_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t1

DROP TABLE IF EXISTS logica_test.P_sn_t2;
CREATE TABLE logica_test.P_sn_t2 AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((P_sn_t1.l) + (1)) AS l
    FROM
      logica_test.P_sn_t1 AS P_sn_t1, t_2_E AS E
    WHERE
      (P_sn_t1.l < 3) AND
      (E.a = P_sn_t1.n)
   UNION ALL
  
    SELECT
      t_2_E.b AS n,
      1 AS l
    FROM
      t_2_E
    WHERE
      (t_2_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r2 AS (SELECT
  P_MultBodyAggAux_f4.n AS n,
  P_MultBodyAggAux_f4.l AS l
FROM
  t_1_P_MultBodyAggAux_f4 AS P_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  P_sn_r2.n AS n,
  P_sn_r2.l AS l
FROM
  t_0_P_sn_r2 AS P_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t2

DROP TABLE IF EXISTS logica_test.P_sn_t3;
CREATE TABLE logica_test.P_sn_t3 AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((P_sn_t2.l) + (1)) AS l
    FROM
      logica_test.P_sn_t2 AS P_sn_t2, t_2_E AS E
    WHERE
      (P_sn_t2.l < 3) AND
      (E.a = P_sn_t2.n)
   UNION ALL
  
    SELECT
      t_2_E.b AS n,
      1 AS l
    FROM
      t_2_E
    WHERE
      (t_2_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r3 AS (SELECT
  P_MultBodyAggAux_f5.n AS n,
  P_MultBodyAggAux_f5.l AS l
FROM
  t_1_P_MultBodyAggAux_f5 AS P_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  P_sn_r3.n AS n,
  P_sn_r3.l AS l
FROM
  t_0_P_sn_r3 AS P_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t3

DROP TABLE IF EXISTS logica_test.P_sn_t4;
CREATE TABLE logica_test.P_sn_t4 AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((P_sn_t3.l) + (1)) AS l
    FROM
      logica_test.P_sn_t3 AS P_sn_t3, t_2_E AS E
    WHERE
      (P_sn_t3.l < 3) AND
      (E.a = P_sn_t3.n)
   UNION ALL
  
    SELECT
      t_2_E.b AS n,
      1 AS l
    FROM
      t_2_E
    WHERE
      (t_2_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r4 AS (SELECT
  P_MultBodyAggAux_f6.n AS n,
  P_MultBodyAggAux_f6.l AS l
FROM
  t_1_P_MultBodyAggAux_f6 AS P_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  P_sn_r4.n AS n,
  P_sn_r4.l AS l
FROM
  t_0_P_sn_r4 AS P_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t4

DROP TABLE IF EXISTS logica_test.P_sn_t5;
CREATE TABLE logica_test.P_sn_t5 AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((P_sn_t4.l) + (1)) AS l
    FROM
      logica_test.P_sn_t4 AS P_sn_t4, t_2_E AS E
    WHERE
      (P_sn_t4.l < 3) AND
      (E.a = P_sn_t4.n)
   UNION ALL
  
    SELECT
      t_2_E.b AS n,
      1 AS l
    FROM
      t_2_E
    WHERE
      (t_2_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_r5 AS (SELECT
  P_MultBodyAggAux_f7.n AS n,
  P_MultBodyAggAux_f7.l AS l
FROM
  t_1_P_MultBodyAggAux_f7 AS P_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  P_sn_r5.n AS n,
  P_sn_r5.l AS l
FROM
  t_0_P_sn_r5 AS P_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.P_sn_t5

DROP TABLE IF EXISTS logica_test.P_sn_full;
CREATE TABLE logica_test.P_sn_full AS SELECT * FROM (
  
    SELECT
      P_sn_delta.n AS n,
      P_sn_delta.l AS l
    FROM
      logica_test.P_sn_delta AS P_sn_delta
   UNION ALL
  
    SELECT
      P_sn_t1.n AS n,
      P_sn_t1.l AS l
    FROM
      logica_test.P_sn_t1 AS P_sn_t1
   UNION ALL
  
    SELECT
      P_sn_t2.n AS n,
      P_sn_t2.l AS l
    FROM
      logica_test.P_sn_t2 AS P_sn_t2
   UNION ALL
  
    SELECT
      P_sn_t3.n AS n,
      P_sn_t3.l AS l
    FROM
      logica_test.P_sn_t3 AS P_sn_t3
   UNION ALL
  
    SELECT
      P_sn_t4.n AS n,
      P_sn_t4.l AS l
    FROM
      logica_test.P_sn_t4 AS P_sn_t4
   UNION ALL
  
    SELECT
      P_sn_t5.n AS n,
      P_sn_t5.l AS l
    FROM
      logica_test.P_sn_t5 AS P_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.P_sn_full

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((P_sn_delta.l) + (1)) AS l
    FROM
      logica_test.P_sn_delta AS P_sn_delta, t_2_E AS E
    WHERE
      (P_sn_delta.l < 3) AND
      (E.a = P_sn_delta.n)
   UNION ALL
  
    SELECT
      t_2_E.b AS n,
      1 AS l
    FROM
      t_2_E
    WHERE
      (t_2_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f8.n AS n,
  P_MultBodyAggAux_f8.l AS l
FROM
  t_1_P_MultBodyAggAux_f8 AS P_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  P_sn_step.n AS n,
  P_sn_step.l AS l
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n = P_sn_step.n) AND
    (P_sn_full.l = P_sn_step.l)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((P_sn_new.l) + (1)) AS l
    FROM
      logica_test.P_sn_new AS P_sn_new, t_2_E AS E
    WHERE
      (P_sn_new.l < 3) AND
      (E.a = P_sn_new.n)
   UNION ALL
  
    SELECT
      t_2_E.b AS n,
      1 AS l
    FROM
      t_2_E
    WHERE
      (t_2_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_back_step AS (SELECT
  P_MultBodyAggAux_f1.n AS n,
  P_MultBodyAggAux_f1.l AS l
FROM
  t_1_P_MultBodyAggAux_f1 AS P_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  P_sn_back_step.n AS n,
  P_sn_back_step.l AS l
FROM
  t_0_P_sn_back_step AS P_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n = P_sn_back_step.n) AND
    (P_sn_full.l = P_sn_back_step.l)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_delta;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((P_sn_delta.l) + (1)) AS l
    FROM
      logica_test.P_sn_delta AS P_sn_delta, t_2_E AS E
    WHERE
      (P_sn_delta.l < 3) AND
      (E.a = P_sn_delta.n)
   UNION ALL
  
    SELECT
      t_2_E.b AS n,
      1 AS l
    FROM
      t_2_E
    WHERE
      (t_2_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f8.n AS n,
  P_MultBodyAggAux_f8.l AS l
FROM
  t_1_P_MultBodyAggAux_f8 AS P_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  P_sn_step.n AS n,
  P_sn_step.l AS l
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n = P_sn_step.n) AND
    (P_sn_full.l = P_sn_step.l)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((P_sn_new.l) + (1)) AS l
    FROM
      logica_test.P_sn_new AS P_sn_new, t_2_E AS E
    WHERE
      (P_sn_new.l < 3) AND
      (E.a = P_sn_new.n)
   UNION ALL
  
    SELECT
      t_2_E.b AS n,
      1 AS l
    FROM
      t_2_E
    WHERE
      (t_2_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_back_step AS (SELECT
  P_MultBodyAggAux_f1.n AS n,
  P_MultBodyAggAux_f1.l AS l
FROM
  t_1_P_MultBodyAggAux_f1 AS P_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  P_sn_back_step.n AS n,
  P_sn_back_step.l AS l
FROM
  t_0_P_sn_back_step AS P_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n = P_sn_back_step.n) AND
    (P_sn_full.l = P_sn_back_step.l)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_delta;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((P_sn_delta.l) + (1)) AS l
    FROM
      logica_test.P_sn_delta AS P_sn_delta, t_2_E AS E
    WHERE
      (P_sn_delta.l < 3) AND
      (E.a = P_sn_delta.n)
   UNION ALL
  
    SELECT
      t_2_E.b AS n,
      1 AS l
    FROM
      t_2_E
    WHERE
      (t_2_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f8.n AS n,
  P_MultBodyAggAux_f8.l AS l
FROM
  t_1_P_MultBodyAggAux_f8 AS P_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  P_sn_step.n AS n,
  P_sn_step.l AS l
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n = P_sn_step.n) AND
    (P_sn_full.l = P_sn_step.l)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

SELECT
  P_sn_full.n AS n,
  P_sn_full.l AS l
FROM
  logica_test.P_sn_full AS P_sn_full ORDER BY n, l;