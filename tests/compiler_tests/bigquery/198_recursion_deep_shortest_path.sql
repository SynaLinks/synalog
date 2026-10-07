DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_0_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY node, d;

-- Interacting with table logica_test.Hop_sn_delta

DROP TABLE IF EXISTS logica_test.Hop_sn_t0;
CREATE TABLE logica_test.Hop_sn_t0 AS SELECT
  Hop_sn_delta.node AS node,
  Hop_sn_delta.d AS d
FROM
  logica_test.Hop_sn_delta AS Hop_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Hop_sn_t0

DROP TABLE IF EXISTS logica_test.Hop_sn_t1;
CREATE TABLE logica_test.Hop_sn_t1 AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_t0.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_t0 AS Hop_sn_t0, t_2_Edge AS Edge
    WHERE
      (Hop_sn_t0.d < 5) AND
      (Edge.a = Hop_sn_t0.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_r1 AS (SELECT
  Hop_MultBodyAggAux_f3.node AS node,
  Hop_MultBodyAggAux_f3.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f3 AS Hop_MultBodyAggAux_f3
GROUP BY node, d)
SELECT
  Hop_sn_r1.node AS node,
  Hop_sn_r1.d AS d
FROM
  t_0_Hop_sn_r1 AS Hop_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Hop_sn_t1

DROP TABLE IF EXISTS logica_test.Hop_sn_t2;
CREATE TABLE logica_test.Hop_sn_t2 AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_t1.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_t1 AS Hop_sn_t1, t_2_Edge AS Edge
    WHERE
      (Hop_sn_t1.d < 5) AND
      (Edge.a = Hop_sn_t1.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_r2 AS (SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY node, d)
SELECT
  Hop_sn_r2.node AS node,
  Hop_sn_r2.d AS d
FROM
  t_0_Hop_sn_r2 AS Hop_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Hop_sn_t2

DROP TABLE IF EXISTS logica_test.Hop_sn_t3;
CREATE TABLE logica_test.Hop_sn_t3 AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_t2.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_t2 AS Hop_sn_t2, t_2_Edge AS Edge
    WHERE
      (Hop_sn_t2.d < 5) AND
      (Edge.a = Hop_sn_t2.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_r3 AS (SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY node, d)
SELECT
  Hop_sn_r3.node AS node,
  Hop_sn_r3.d AS d
FROM
  t_0_Hop_sn_r3 AS Hop_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Hop_sn_t3

DROP TABLE IF EXISTS logica_test.Hop_sn_t4;
CREATE TABLE logica_test.Hop_sn_t4 AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_t3.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_t3 AS Hop_sn_t3, t_2_Edge AS Edge
    WHERE
      (Hop_sn_t3.d < 5) AND
      (Edge.a = Hop_sn_t3.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_r4 AS (SELECT
  Hop_MultBodyAggAux_f6.node AS node,
  Hop_MultBodyAggAux_f6.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f6 AS Hop_MultBodyAggAux_f6
GROUP BY node, d)
SELECT
  Hop_sn_r4.node AS node,
  Hop_sn_r4.d AS d
FROM
  t_0_Hop_sn_r4 AS Hop_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.Hop_sn_t4

DROP TABLE IF EXISTS logica_test.Hop_sn_t5;
CREATE TABLE logica_test.Hop_sn_t5 AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_t4.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_t4 AS Hop_sn_t4, t_2_Edge AS Edge
    WHERE
      (Hop_sn_t4.d < 5) AND
      (Edge.a = Hop_sn_t4.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_r5 AS (SELECT
  Hop_MultBodyAggAux_f7.node AS node,
  Hop_MultBodyAggAux_f7.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f7 AS Hop_MultBodyAggAux_f7
GROUP BY node, d)
SELECT
  Hop_sn_r5.node AS node,
  Hop_sn_r5.d AS d
FROM
  t_0_Hop_sn_r5 AS Hop_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.Hop_sn_t5

DROP TABLE IF EXISTS logica_test.Hop_sn_full;
CREATE TABLE logica_test.Hop_sn_full AS SELECT * FROM (
  
    SELECT
      Hop_sn_delta.node AS node,
      Hop_sn_delta.d AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta
   UNION ALL
  
    SELECT
      Hop_sn_t1.node AS node,
      Hop_sn_t1.d AS d
    FROM
      logica_test.Hop_sn_t1 AS Hop_sn_t1
   UNION ALL
  
    SELECT
      Hop_sn_t2.node AS node,
      Hop_sn_t2.d AS d
    FROM
      logica_test.Hop_sn_t2 AS Hop_sn_t2
   UNION ALL
  
    SELECT
      Hop_sn_t3.node AS node,
      Hop_sn_t3.d AS d
    FROM
      logica_test.Hop_sn_t3 AS Hop_sn_t3
   UNION ALL
  
    SELECT
      Hop_sn_t4.node AS node,
      Hop_sn_t4.d AS d
    FROM
      logica_test.Hop_sn_t4 AS Hop_sn_t4
   UNION ALL
  
    SELECT
      Hop_sn_t5.node AS node,
      Hop_sn_t5.d AS d
    FROM
      logica_test.Hop_sn_t5 AS Hop_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Hop_sn_full

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_new.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_new AS Hop_sn_new, t_2_Edge AS Edge
    WHERE
      (Hop_sn_new.d < 5) AND
      (Edge.a = Hop_sn_new.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_back_step AS (SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY node, d)
SELECT
  Hop_sn_back_step.node AS node,
  Hop_sn_back_step.d AS d
FROM
  t_0_Hop_sn_back_step AS Hop_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_back_step.node) AND
    (Hop_sn_full.d = Hop_sn_back_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_delta;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f8.node AS node,
  Hop_MultBodyAggAux_f8.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f8 AS Hop_MultBodyAggAux_f8
GROUP BY node, d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Hop_sn_full AS Hop_sn_full
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) IS NULL)
GROUP BY node, d;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

SELECT
  Hop_sn_full.node AS node,
  MIN(Hop_sn_full.d) AS d
FROM
  logica_test.Hop_sn_full AS Hop_sn_full
GROUP BY node ORDER BY node NULLS LAST;