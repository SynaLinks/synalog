DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f8;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_MultBodyAggAux_f1_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Graph_Reach_MultBodyAggAux_f1_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f1_f8.b AS b
FROM
  t_0_Graph_Reach_MultBodyAggAux_f1_f8 AS Graph_Reach_MultBodyAggAux_f1_f8
GROUP BY 1, 2;

-- Interacting with table logica_test.Graph_Reach_sn_delta_f8

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t0_f8;
CREATE TABLE logica_test.Graph_Reach_sn_t0_f8 AS SELECT
  Graph_Reach_sn_delta_f8.a AS a,
  Graph_Reach_sn_delta_f8.b AS b
FROM
  logica_test.Graph_Reach_sn_delta_f8 AS Graph_Reach_sn_delta_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t0_f8

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t1_f8;
CREATE TABLE logica_test.Graph_Reach_sn_t1_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f2_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t0_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_t0_f8 AS Graph_Reach_sn_t0_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_t0_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_r1_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f2_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f2_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f2_f8 AS Graph_Reach_MultBodyAggAux_f2_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_r1_f8.a AS a,
  Graph_Reach_sn_r1_f8.b AS b
FROM
  t_0_Graph_Reach_sn_r1_f8 AS Graph_Reach_sn_r1_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t1_f8

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t2_f8;
CREATE TABLE logica_test.Graph_Reach_sn_t2_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f3_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t1_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_t1_f8 AS Graph_Reach_sn_t1_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_t1_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_r2_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f3_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f3_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f3_f8 AS Graph_Reach_MultBodyAggAux_f3_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_r2_f8.a AS a,
  Graph_Reach_sn_r2_f8.b AS b
FROM
  t_0_Graph_Reach_sn_r2_f8 AS Graph_Reach_sn_r2_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t2_f8

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t3_f8;
CREATE TABLE logica_test.Graph_Reach_sn_t3_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f4_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t2_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_t2_f8 AS Graph_Reach_sn_t2_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_t2_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_r3_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f4_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f4_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f4_f8 AS Graph_Reach_MultBodyAggAux_f4_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_r3_f8.a AS a,
  Graph_Reach_sn_r3_f8.b AS b
FROM
  t_0_Graph_Reach_sn_r3_f8 AS Graph_Reach_sn_r3_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t3_f8

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t4_f8;
CREATE TABLE logica_test.Graph_Reach_sn_t4_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f5_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t3_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_t3_f8 AS Graph_Reach_sn_t3_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_t3_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_r4_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f5_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f5_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f5_f8 AS Graph_Reach_MultBodyAggAux_f5_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_r4_f8.a AS a,
  Graph_Reach_sn_r4_f8.b AS b
FROM
  t_0_Graph_Reach_sn_r4_f8 AS Graph_Reach_sn_r4_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t4_f8

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t5_f8;
CREATE TABLE logica_test.Graph_Reach_sn_t5_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f6_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t4_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_t4_f8 AS Graph_Reach_sn_t4_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_t4_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_r5_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f6_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f6_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f6_f8 AS Graph_Reach_MultBodyAggAux_f6_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_r5_f8.a AS a,
  Graph_Reach_sn_r5_f8.b AS b
FROM
  t_0_Graph_Reach_sn_r5_f8 AS Graph_Reach_sn_r5_f8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t5_f8

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_full_f8;
CREATE TABLE logica_test.Graph_Reach_sn_full_f8 AS SELECT * FROM (
  
    SELECT
      Graph_Reach_sn_delta_f8.a AS a,
      Graph_Reach_sn_delta_f8.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f8 AS Graph_Reach_sn_delta_f8
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t1_f8.a AS a,
      Graph_Reach_sn_t1_f8.b AS b
    FROM
      logica_test.Graph_Reach_sn_t1_f8 AS Graph_Reach_sn_t1_f8
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t2_f8.a AS a,
      Graph_Reach_sn_t2_f8.b AS b
    FROM
      logica_test.Graph_Reach_sn_t2_f8 AS Graph_Reach_sn_t2_f8
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t3_f8.a AS a,
      Graph_Reach_sn_t3_f8.b AS b
    FROM
      logica_test.Graph_Reach_sn_t3_f8 AS Graph_Reach_sn_t3_f8
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t4_f8.a AS a,
      Graph_Reach_sn_t4_f8.b AS b
    FROM
      logica_test.Graph_Reach_sn_t4_f8 AS Graph_Reach_sn_t4_f8
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t5_f8.a AS a,
      Graph_Reach_sn_t5_f8.b AS b
    FROM
      logica_test.Graph_Reach_sn_t5_f8 AS Graph_Reach_sn_t5_f8
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Graph_Reach_sn_full_f8

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f8;
CREATE TABLE logica_test.Graph_Reach_sn_new_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f8 AS Graph_Reach_sn_delta_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_delta_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f7_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS Graph_Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f8.a AS a,
  Graph_Reach_sn_step_f8.b AS b
FROM
  t_0_Graph_Reach_sn_step_f8 AS Graph_Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f8 AS Graph_Reach_sn_full_f8
  WHERE
    (Graph_Reach_sn_full_f8.a = Graph_Reach_sn_step_f8.a) AND
    (Graph_Reach_sn_full_f8.b = Graph_Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f8 SELECT * FROM logica_test.Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f8;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f8 AS SELECT
  Graph_Reach_sn_new_f8.a AS a,
  Graph_Reach_sn_new_f8.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f8 AS Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f8;
CREATE TABLE logica_test.Graph_Reach_sn_new_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f8 AS Graph_Reach_sn_delta_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_delta_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f7_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS Graph_Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f8.a AS a,
  Graph_Reach_sn_step_f8.b AS b
FROM
  t_0_Graph_Reach_sn_step_f8 AS Graph_Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f8 AS Graph_Reach_sn_full_f8
  WHERE
    (Graph_Reach_sn_full_f8.a = Graph_Reach_sn_step_f8.a) AND
    (Graph_Reach_sn_full_f8.b = Graph_Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f8 SELECT * FROM logica_test.Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f8;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f8 AS SELECT
  Graph_Reach_sn_new_f8.a AS a,
  Graph_Reach_sn_new_f8.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f8 AS Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f8;
CREATE TABLE logica_test.Graph_Reach_sn_new_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f8 AS Graph_Reach_sn_delta_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_delta_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f7_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS Graph_Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f8.a AS a,
  Graph_Reach_sn_step_f8.b AS b
FROM
  t_0_Graph_Reach_sn_step_f8 AS Graph_Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f8 AS Graph_Reach_sn_full_f8
  WHERE
    (Graph_Reach_sn_full_f8.a = Graph_Reach_sn_step_f8.a) AND
    (Graph_Reach_sn_full_f8.b = Graph_Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f8 SELECT * FROM logica_test.Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f8;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f8 AS SELECT
  Graph_Reach_sn_new_f8.a AS a,
  Graph_Reach_sn_new_f8.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f8 AS Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f8;
CREATE TABLE logica_test.Graph_Reach_sn_new_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f8 AS Graph_Reach_sn_delta_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_delta_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f7_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS Graph_Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f8.a AS a,
  Graph_Reach_sn_step_f8.b AS b
FROM
  t_0_Graph_Reach_sn_step_f8 AS Graph_Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f8 AS Graph_Reach_sn_full_f8
  WHERE
    (Graph_Reach_sn_full_f8.a = Graph_Reach_sn_step_f8.a) AND
    (Graph_Reach_sn_full_f8.b = Graph_Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f8 SELECT * FROM logica_test.Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f8;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f8 AS SELECT
  Graph_Reach_sn_new_f8.a AS a,
  Graph_Reach_sn_new_f8.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f8 AS Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f8;
CREATE TABLE logica_test.Graph_Reach_sn_new_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f8 AS Graph_Reach_sn_delta_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_delta_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f7_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS Graph_Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f8.a AS a,
  Graph_Reach_sn_step_f8.b AS b
FROM
  t_0_Graph_Reach_sn_step_f8 AS Graph_Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f8 AS Graph_Reach_sn_full_f8
  WHERE
    (Graph_Reach_sn_full_f8.a = Graph_Reach_sn_step_f8.a) AND
    (Graph_Reach_sn_full_f8.b = Graph_Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f8 SELECT * FROM logica_test.Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f8;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f8 AS SELECT
  Graph_Reach_sn_new_f8.a AS a,
  Graph_Reach_sn_new_f8.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f8 AS Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f8;
CREATE TABLE logica_test.Graph_Reach_sn_new_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f8 AS Graph_Reach_sn_delta_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_delta_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f7_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS Graph_Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f8.a AS a,
  Graph_Reach_sn_step_f8.b AS b
FROM
  t_0_Graph_Reach_sn_step_f8 AS Graph_Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f8 AS Graph_Reach_sn_full_f8
  WHERE
    (Graph_Reach_sn_full_f8.a = Graph_Reach_sn_step_f8.a) AND
    (Graph_Reach_sn_full_f8.b = Graph_Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f8 SELECT * FROM logica_test.Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f8;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f8 AS SELECT
  Graph_Reach_sn_new_f8.a AS a,
  Graph_Reach_sn_new_f8.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f8 AS Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f8;
CREATE TABLE logica_test.Graph_Reach_sn_new_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f8 AS Graph_Reach_sn_delta_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_delta_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f7_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS Graph_Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f8.a AS a,
  Graph_Reach_sn_step_f8.b AS b
FROM
  t_0_Graph_Reach_sn_step_f8 AS Graph_Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f8 AS Graph_Reach_sn_full_f8
  WHERE
    (Graph_Reach_sn_full_f8.a = Graph_Reach_sn_step_f8.a) AND
    (Graph_Reach_sn_full_f8.b = Graph_Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f8 SELECT * FROM logica_test.Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f8;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f8 AS SELECT
  Graph_Reach_sn_new_f8.a AS a,
  Graph_Reach_sn_new_f8.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f8 AS Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f8;
CREATE TABLE logica_test.Graph_Reach_sn_new_f8 AS WITH t_1_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f8.a AS a,
      t_2_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f8 AS Graph_Reach_sn_delta_f8, t_1_Local AS t_2_Local
    WHERE
      (t_2_Local.a = Graph_Reach_sn_delta_f8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f8 AS (SELECT
  Graph_Reach_MultBodyAggAux_f7_f8.a AS a,
  Graph_Reach_MultBodyAggAux_f7_f8.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f7_f8 AS Graph_Reach_MultBodyAggAux_f7_f8
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f8.a AS a,
  Graph_Reach_sn_step_f8.b AS b
FROM
  t_0_Graph_Reach_sn_step_f8 AS Graph_Reach_sn_step_f8
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f8 AS Graph_Reach_sn_full_f8
  WHERE
    (Graph_Reach_sn_full_f8.a = Graph_Reach_sn_step_f8.a) AND
    (Graph_Reach_sn_full_f8.b = Graph_Reach_sn_step_f8.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f8 SELECT * FROM logica_test.Graph_Reach_sn_new_f8;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f8;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f8 AS SELECT
  Graph_Reach_sn_new_f8.a AS a,
  Graph_Reach_sn_new_f8.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f8 AS Graph_Reach_sn_new_f8;

SELECT
  Graph_Reach_sn_full_f8.a AS a,
  Graph_Reach_sn_full_f8.b AS b
FROM
  logica_test.Graph_Reach_sn_full_f8 AS Graph_Reach_sn_full_f8 ORDER BY a, b;