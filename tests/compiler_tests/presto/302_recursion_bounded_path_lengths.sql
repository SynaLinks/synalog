DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f1.a AS a,
  Path_MultBodyAggAux_f1.b AS b,
  Path_MultBodyAggAux_f1.n AS n
FROM
  t_0_Path_MultBodyAggAux_f1 AS Path_MultBodyAggAux_f1
GROUP BY 1, 2, 3;

-- Interacting with table logica_test.Path_sn_delta

DROP TABLE IF EXISTS logica_test.Path_sn_t0;
CREATE TABLE logica_test.Path_sn_t0 AS SELECT
  Path_sn_delta.a AS a,
  Path_sn_delta.b AS b,
  Path_sn_delta.n AS n
FROM
  logica_test.Path_sn_delta AS Path_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Path_sn_t0

DROP TABLE IF EXISTS logica_test.Path_sn_t1;
CREATE TABLE logica_test.Path_sn_t1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_t0.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_t0.n) + (1)) AS n
    FROM
      logica_test.Path_sn_t0 AS Path_sn_t0, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_t0.n < 3) AND
      (t_2_Edge.a = Path_sn_t0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_r1 AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY 1, 2, 3)
SELECT
  Path_sn_r1.a AS a,
  Path_sn_r1.b AS b,
  Path_sn_r1.n AS n
FROM
  t_0_Path_sn_r1 AS Path_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Path_sn_t1

DROP TABLE IF EXISTS logica_test.Path_sn_t2;
CREATE TABLE logica_test.Path_sn_t2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_t1.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_t1.n) + (1)) AS n
    FROM
      logica_test.Path_sn_t1 AS Path_sn_t1, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_t1.n < 3) AND
      (t_2_Edge.a = Path_sn_t1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_r2 AS (SELECT
  Path_MultBodyAggAux_f3.a AS a,
  Path_MultBodyAggAux_f3.b AS b,
  Path_MultBodyAggAux_f3.n AS n
FROM
  t_1_Path_MultBodyAggAux_f3 AS Path_MultBodyAggAux_f3
GROUP BY 1, 2, 3)
SELECT
  Path_sn_r2.a AS a,
  Path_sn_r2.b AS b,
  Path_sn_r2.n AS n
FROM
  t_0_Path_sn_r2 AS Path_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Path_sn_t2

DROP TABLE IF EXISTS logica_test.Path_sn_t3;
CREATE TABLE logica_test.Path_sn_t3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_t2.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_t2.n) + (1)) AS n
    FROM
      logica_test.Path_sn_t2 AS Path_sn_t2, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_t2.n < 3) AND
      (t_2_Edge.a = Path_sn_t2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_r3 AS (SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b,
  Path_MultBodyAggAux_f4.n AS n
FROM
  t_1_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2, 3)
SELECT
  Path_sn_r3.a AS a,
  Path_sn_r3.b AS b,
  Path_sn_r3.n AS n
FROM
  t_0_Path_sn_r3 AS Path_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Path_sn_t3

DROP TABLE IF EXISTS logica_test.Path_sn_t4;
CREATE TABLE logica_test.Path_sn_t4 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_t3.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_t3.n) + (1)) AS n
    FROM
      logica_test.Path_sn_t3 AS Path_sn_t3, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_t3.n < 3) AND
      (t_2_Edge.a = Path_sn_t3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_r4 AS (SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b,
  Path_MultBodyAggAux_f5.n AS n
FROM
  t_1_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2, 3)
SELECT
  Path_sn_r4.a AS a,
  Path_sn_r4.b AS b,
  Path_sn_r4.n AS n
FROM
  t_0_Path_sn_r4 AS Path_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.Path_sn_t4

DROP TABLE IF EXISTS logica_test.Path_sn_t5;
CREATE TABLE logica_test.Path_sn_t5 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_t4.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_t4.n) + (1)) AS n
    FROM
      logica_test.Path_sn_t4 AS Path_sn_t4, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_t4.n < 3) AND
      (t_2_Edge.a = Path_sn_t4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_r5 AS (SELECT
  Path_MultBodyAggAux_f6.a AS a,
  Path_MultBodyAggAux_f6.b AS b,
  Path_MultBodyAggAux_f6.n AS n
FROM
  t_1_Path_MultBodyAggAux_f6 AS Path_MultBodyAggAux_f6
GROUP BY 1, 2, 3)
SELECT
  Path_sn_r5.a AS a,
  Path_sn_r5.b AS b,
  Path_sn_r5.n AS n
FROM
  t_0_Path_sn_r5 AS Path_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.Path_sn_t5

DROP TABLE IF EXISTS logica_test.Path_sn_t6;
CREATE TABLE logica_test.Path_sn_t6 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_t5.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_t5.n) + (1)) AS n
    FROM
      logica_test.Path_sn_t5 AS Path_sn_t5, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_t5.n < 3) AND
      (t_2_Edge.a = Path_sn_t5.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_r6 AS (SELECT
  Path_MultBodyAggAux_f7.a AS a,
  Path_MultBodyAggAux_f7.b AS b,
  Path_MultBodyAggAux_f7.n AS n
FROM
  t_1_Path_MultBodyAggAux_f7 AS Path_MultBodyAggAux_f7
GROUP BY 1, 2, 3)
SELECT
  Path_sn_r6.a AS a,
  Path_sn_r6.b AS b,
  Path_sn_r6.n AS n
FROM
  t_0_Path_sn_r6 AS Path_sn_r6
WHERE
  (1 = 0);

-- Interacting with table logica_test.Path_sn_t6

DROP TABLE IF EXISTS logica_test.Path_sn_t7;
CREATE TABLE logica_test.Path_sn_t7 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_t6.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_t6.n) + (1)) AS n
    FROM
      logica_test.Path_sn_t6 AS Path_sn_t6, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_t6.n < 3) AND
      (t_2_Edge.a = Path_sn_t6.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_r7 AS (SELECT
  Path_MultBodyAggAux_f8.a AS a,
  Path_MultBodyAggAux_f8.b AS b,
  Path_MultBodyAggAux_f8.n AS n
FROM
  t_1_Path_MultBodyAggAux_f8 AS Path_MultBodyAggAux_f8
GROUP BY 1, 2, 3)
SELECT
  Path_sn_r7.a AS a,
  Path_sn_r7.b AS b,
  Path_sn_r7.n AS n
FROM
  t_0_Path_sn_r7 AS Path_sn_r7
WHERE
  (1 = 0);

-- Interacting with table logica_test.Path_sn_t7

DROP TABLE IF EXISTS logica_test.Path_sn_full;
CREATE TABLE logica_test.Path_sn_full AS SELECT * FROM (
  
    SELECT
      Path_sn_delta.a AS a,
      Path_sn_delta.b AS b,
      Path_sn_delta.n AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta
   UNION ALL
  
    SELECT
      Path_sn_t1.a AS a,
      Path_sn_t1.b AS b,
      Path_sn_t1.n AS n
    FROM
      logica_test.Path_sn_t1 AS Path_sn_t1
   UNION ALL
  
    SELECT
      Path_sn_t2.a AS a,
      Path_sn_t2.b AS b,
      Path_sn_t2.n AS n
    FROM
      logica_test.Path_sn_t2 AS Path_sn_t2
   UNION ALL
  
    SELECT
      Path_sn_t3.a AS a,
      Path_sn_t3.b AS b,
      Path_sn_t3.n AS n
    FROM
      logica_test.Path_sn_t3 AS Path_sn_t3
   UNION ALL
  
    SELECT
      Path_sn_t4.a AS a,
      Path_sn_t4.b AS b,
      Path_sn_t4.n AS n
    FROM
      logica_test.Path_sn_t4 AS Path_sn_t4
   UNION ALL
  
    SELECT
      Path_sn_t5.a AS a,
      Path_sn_t5.b AS b,
      Path_sn_t5.n AS n
    FROM
      logica_test.Path_sn_t5 AS Path_sn_t5
   UNION ALL
  
    SELECT
      Path_sn_t6.a AS a,
      Path_sn_t6.b AS b,
      Path_sn_t6.n AS n
    FROM
      logica_test.Path_sn_t6 AS Path_sn_t6
   UNION ALL
  
    SELECT
      Path_sn_t7.a AS a,
      Path_sn_t7.b AS b,
      Path_sn_t7.n AS n
    FROM
      logica_test.Path_sn_t7 AS Path_sn_t7
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Path_sn_full

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_new;
CREATE TABLE logica_test.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Path_sn_delta.a AS a,
      t_2_Edge.b AS b,
      ((Path_sn_delta.n) + (1)) AS n
    FROM
      logica_test.Path_sn_delta AS Path_sn_delta, t_1_Edge AS t_2_Edge
    WHERE
      (Path_sn_delta.n < 3) AND
      (t_2_Edge.a = Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f9.a AS a,
  Path_MultBodyAggAux_f9.b AS b,
  Path_MultBodyAggAux_f9.n AS n
FROM
  t_1_Path_MultBodyAggAux_f9 AS Path_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Path_sn_full AS Path_sn_full
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.Path_sn_full SELECT * FROM logica_test.Path_sn_new;

DROP TABLE IF EXISTS logica_test.Path_sn_delta;
CREATE TABLE logica_test.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_test.Path_sn_new AS Path_sn_new;

SELECT
  Path_sn_full.n AS n
FROM
  logica_test.Path_sn_full AS Path_sn_full
GROUP BY 1 ORDER BY n;