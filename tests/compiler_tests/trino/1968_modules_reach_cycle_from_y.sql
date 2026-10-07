DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f9;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_MultBodyAggAux_f2_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Graph_Reach_MultBodyAggAux_f2_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f2_f9.b AS b
FROM
  t_0_Graph_Reach_MultBodyAggAux_f2_f9 AS Graph_Reach_MultBodyAggAux_f2_f9
GROUP BY 1, 2;

-- Interacting with table logica_test.Graph_Reach_sn_delta_f9

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t0_f9;
CREATE TABLE logica_test.Graph_Reach_sn_t0_f9 AS SELECT
  Graph_Reach_sn_delta_f9.a AS a,
  Graph_Reach_sn_delta_f9.b AS b
FROM
  logica_test.Graph_Reach_sn_delta_f9 AS Graph_Reach_sn_delta_f9
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t0_f9

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t1_f9;
CREATE TABLE logica_test.Graph_Reach_sn_t1_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f3_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t0_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_t0_f9 AS Graph_Reach_sn_t0_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_t0_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_r1_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f3_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f3_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f3_f9 AS Graph_Reach_MultBodyAggAux_f3_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_r1_f9.a AS a,
  Graph_Reach_sn_r1_f9.b AS b
FROM
  t_0_Graph_Reach_sn_r1_f9 AS Graph_Reach_sn_r1_f9
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t1_f9

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t2_f9;
CREATE TABLE logica_test.Graph_Reach_sn_t2_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f4_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t1_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_t1_f9 AS Graph_Reach_sn_t1_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_t1_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_r2_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f4_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f4_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f4_f9 AS Graph_Reach_MultBodyAggAux_f4_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_r2_f9.a AS a,
  Graph_Reach_sn_r2_f9.b AS b
FROM
  t_0_Graph_Reach_sn_r2_f9 AS Graph_Reach_sn_r2_f9
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t2_f9

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t3_f9;
CREATE TABLE logica_test.Graph_Reach_sn_t3_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f5_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t2_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_t2_f9 AS Graph_Reach_sn_t2_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_t2_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_r3_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f5_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f5_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f5_f9 AS Graph_Reach_MultBodyAggAux_f5_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_r3_f9.a AS a,
  Graph_Reach_sn_r3_f9.b AS b
FROM
  t_0_Graph_Reach_sn_r3_f9 AS Graph_Reach_sn_r3_f9
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t3_f9

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t4_f9;
CREATE TABLE logica_test.Graph_Reach_sn_t4_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f6_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t3_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_t3_f9 AS Graph_Reach_sn_t3_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_t3_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_r4_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f6_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f6_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f6_f9 AS Graph_Reach_MultBodyAggAux_f6_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_r4_f9.a AS a,
  Graph_Reach_sn_r4_f9.b AS b
FROM
  t_0_Graph_Reach_sn_r4_f9 AS Graph_Reach_sn_r4_f9
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t4_f9

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_t5_f9;
CREATE TABLE logica_test.Graph_Reach_sn_t5_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f7_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t4_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_t4_f9 AS Graph_Reach_sn_t4_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_t4_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_r5_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f7_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f7_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f7_f9 AS Graph_Reach_MultBodyAggAux_f7_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_r5_f9.a AS a,
  Graph_Reach_sn_r5_f9.b AS b
FROM
  t_0_Graph_Reach_sn_r5_f9 AS Graph_Reach_sn_r5_f9
WHERE
  (1 = 0);

-- Interacting with table logica_test.Graph_Reach_sn_t5_f9

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_full_f9;
CREATE TABLE logica_test.Graph_Reach_sn_full_f9 AS SELECT * FROM (
  
    SELECT
      Graph_Reach_sn_delta_f9.a AS a,
      Graph_Reach_sn_delta_f9.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f9 AS Graph_Reach_sn_delta_f9
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t1_f9.a AS a,
      Graph_Reach_sn_t1_f9.b AS b
    FROM
      logica_test.Graph_Reach_sn_t1_f9 AS Graph_Reach_sn_t1_f9
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t2_f9.a AS a,
      Graph_Reach_sn_t2_f9.b AS b
    FROM
      logica_test.Graph_Reach_sn_t2_f9 AS Graph_Reach_sn_t2_f9
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t3_f9.a AS a,
      Graph_Reach_sn_t3_f9.b AS b
    FROM
      logica_test.Graph_Reach_sn_t3_f9 AS Graph_Reach_sn_t3_f9
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t4_f9.a AS a,
      Graph_Reach_sn_t4_f9.b AS b
    FROM
      logica_test.Graph_Reach_sn_t4_f9 AS Graph_Reach_sn_t4_f9
   UNION ALL
  
    SELECT
      Graph_Reach_sn_t5_f9.a AS a,
      Graph_Reach_sn_t5_f9.b AS b
    FROM
      logica_test.Graph_Reach_sn_t5_f9 AS Graph_Reach_sn_t5_f9
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Graph_Reach_sn_full_f9

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f9;
CREATE TABLE logica_test.Graph_Reach_sn_new_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f8_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f9 AS Graph_Reach_sn_delta_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_delta_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f8_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f8_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f8_f9 AS Graph_Reach_MultBodyAggAux_f8_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f9.a AS a,
  Graph_Reach_sn_step_f9.b AS b
FROM
  t_0_Graph_Reach_sn_step_f9 AS Graph_Reach_sn_step_f9
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f9 AS Graph_Reach_sn_full_f9
  WHERE
    (Graph_Reach_sn_full_f9.a = Graph_Reach_sn_step_f9.a) AND
    (Graph_Reach_sn_full_f9.b = Graph_Reach_sn_step_f9.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f9 SELECT * FROM logica_test.Graph_Reach_sn_new_f9;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f9;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f1_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_new_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_new_f9 AS Graph_Reach_sn_new_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_new_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_back_step_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f1_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f1_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f1_f9 AS Graph_Reach_MultBodyAggAux_f1_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_back_step_f9.a AS a,
  Graph_Reach_sn_back_step_f9.b AS b
FROM
  t_0_Graph_Reach_sn_back_step_f9 AS Graph_Reach_sn_back_step_f9
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f9 AS Graph_Reach_sn_full_f9
  WHERE
    (Graph_Reach_sn_full_f9.a = Graph_Reach_sn_back_step_f9.a) AND
    (Graph_Reach_sn_full_f9.b = Graph_Reach_sn_back_step_f9.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f9 SELECT * FROM logica_test.Graph_Reach_sn_delta_f9;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f9;
CREATE TABLE logica_test.Graph_Reach_sn_new_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f8_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f9 AS Graph_Reach_sn_delta_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_delta_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f8_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f8_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f8_f9 AS Graph_Reach_MultBodyAggAux_f8_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f9.a AS a,
  Graph_Reach_sn_step_f9.b AS b
FROM
  t_0_Graph_Reach_sn_step_f9 AS Graph_Reach_sn_step_f9
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f9 AS Graph_Reach_sn_full_f9
  WHERE
    (Graph_Reach_sn_full_f9.a = Graph_Reach_sn_step_f9.a) AND
    (Graph_Reach_sn_full_f9.b = Graph_Reach_sn_step_f9.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f9 SELECT * FROM logica_test.Graph_Reach_sn_new_f9;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f9;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f1_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_new_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_new_f9 AS Graph_Reach_sn_new_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_new_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_back_step_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f1_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f1_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f1_f9 AS Graph_Reach_MultBodyAggAux_f1_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_back_step_f9.a AS a,
  Graph_Reach_sn_back_step_f9.b AS b
FROM
  t_0_Graph_Reach_sn_back_step_f9 AS Graph_Reach_sn_back_step_f9
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f9 AS Graph_Reach_sn_full_f9
  WHERE
    (Graph_Reach_sn_full_f9.a = Graph_Reach_sn_back_step_f9.a) AND
    (Graph_Reach_sn_full_f9.b = Graph_Reach_sn_back_step_f9.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f9 SELECT * FROM logica_test.Graph_Reach_sn_delta_f9;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f9;
CREATE TABLE logica_test.Graph_Reach_sn_new_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f8_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f9 AS Graph_Reach_sn_delta_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_delta_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f8_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f8_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f8_f9 AS Graph_Reach_MultBodyAggAux_f8_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f9.a AS a,
  Graph_Reach_sn_step_f9.b AS b
FROM
  t_0_Graph_Reach_sn_step_f9 AS Graph_Reach_sn_step_f9
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f9 AS Graph_Reach_sn_full_f9
  WHERE
    (Graph_Reach_sn_full_f9.a = Graph_Reach_sn_step_f9.a) AND
    (Graph_Reach_sn_full_f9.b = Graph_Reach_sn_step_f9.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f9 SELECT * FROM logica_test.Graph_Reach_sn_new_f9;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f9;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f1_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_new_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_new_f9 AS Graph_Reach_sn_new_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_new_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_back_step_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f1_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f1_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f1_f9 AS Graph_Reach_MultBodyAggAux_f1_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_back_step_f9.a AS a,
  Graph_Reach_sn_back_step_f9.b AS b
FROM
  t_0_Graph_Reach_sn_back_step_f9 AS Graph_Reach_sn_back_step_f9
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f9 AS Graph_Reach_sn_full_f9
  WHERE
    (Graph_Reach_sn_full_f9.a = Graph_Reach_sn_back_step_f9.a) AND
    (Graph_Reach_sn_full_f9.b = Graph_Reach_sn_back_step_f9.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f9 SELECT * FROM logica_test.Graph_Reach_sn_delta_f9;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f9;
CREATE TABLE logica_test.Graph_Reach_sn_new_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f8_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_delta_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f9 AS Graph_Reach_sn_delta_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_delta_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f8_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f8_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f8_f9 AS Graph_Reach_MultBodyAggAux_f8_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f9.a AS a,
  Graph_Reach_sn_step_f9.b AS b
FROM
  t_0_Graph_Reach_sn_step_f9 AS Graph_Reach_sn_step_f9
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f9 AS Graph_Reach_sn_full_f9
  WHERE
    (Graph_Reach_sn_full_f9.a = Graph_Reach_sn_step_f9.a) AND
    (Graph_Reach_sn_full_f9.b = Graph_Reach_sn_step_f9.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f9 SELECT * FROM logica_test.Graph_Reach_sn_new_f9;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f9;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f9 AS WITH t_1_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_MultBodyAggAux_f1_f9 AS (SELECT * FROM (
  
    SELECT
      Loop.a AS a,
      Loop.b AS b
    FROM
      t_1_Loop AS Loop
   UNION ALL
  
    SELECT
      Graph_Reach_sn_new_f9.a AS a,
      t_2_Loop.b AS b
    FROM
      logica_test.Graph_Reach_sn_new_f9 AS Graph_Reach_sn_new_f9, t_1_Loop AS t_2_Loop
    WHERE
      (t_2_Loop.a = Graph_Reach_sn_new_f9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_back_step_f9 AS (SELECT
  Graph_Reach_MultBodyAggAux_f1_f9.a AS a,
  Graph_Reach_MultBodyAggAux_f1_f9.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f1_f9 AS Graph_Reach_MultBodyAggAux_f1_f9
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_back_step_f9.a AS a,
  Graph_Reach_sn_back_step_f9.b AS b
FROM
  t_0_Graph_Reach_sn_back_step_f9 AS Graph_Reach_sn_back_step_f9
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f9 AS Graph_Reach_sn_full_f9
  WHERE
    (Graph_Reach_sn_full_f9.a = Graph_Reach_sn_back_step_f9.a) AND
    (Graph_Reach_sn_full_f9.b = Graph_Reach_sn_back_step_f9.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f9 SELECT * FROM logica_test.Graph_Reach_sn_delta_f9;

SELECT
  Graph_Reach_sn_full_f9.b AS b
FROM
  logica_test.Graph_Reach_sn_full_f9 AS Graph_Reach_sn_full_f9
WHERE
  ('y' = Graph_Reach_sn_full_f9.a) ORDER BY b;