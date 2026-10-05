DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f3;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f3 AS WITH t_1_Local AS (SELECT * FROM (
  
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
t_0_Graph_Reach_MultBodyAggAux_f1_f3 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Graph_Reach_MultBodyAggAux_f1_f3.a AS a,
  Graph_Reach_MultBodyAggAux_f1_f3.b AS b
FROM
  t_0_Graph_Reach_MultBodyAggAux_f1_f3 AS Graph_Reach_MultBodyAggAux_f1_f3
GROUP BY 1, 2;

-- Interacting with table logica_test.Graph_Reach_sn_delta_f3

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_full_f3;
CREATE TABLE logica_test.Graph_Reach_sn_full_f3 AS WITH t_1_Local AS (SELECT * FROM (
  
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
t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      t_2_Graph_Reach_sn_delta_f3.a AS a,
      t_3_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f3 AS t_2_Graph_Reach_sn_delta_f3, t_1_Local AS t_3_Local
    WHERE
      (t_3_Local.a = t_2_Graph_Reach_sn_delta_f3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f3 AS (SELECT
  Graph_Reach_MultBodyAggAux_f2_f3.a AS a,
  Graph_Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS Graph_Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Graph_Reach_sn_delta_f3.a AS a,
      Graph_Reach_sn_delta_f3.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f3 AS Graph_Reach_sn_delta_f3
   UNION ALL
  
    SELECT
      Graph_Reach_sn_step_f3.a AS a,
      Graph_Reach_sn_step_f3.b AS b
    FROM
      t_0_Graph_Reach_sn_step_f3 AS Graph_Reach_sn_step_f3
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Graph_Reach_sn_full_f3

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f3;
CREATE TABLE logica_test.Graph_Reach_sn_new_f3 AS WITH t_1_Local AS (SELECT * FROM (
  
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
t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      t_2_Graph_Reach_sn_delta_f3.a AS a,
      t_3_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f3 AS t_2_Graph_Reach_sn_delta_f3, t_1_Local AS t_3_Local
    WHERE
      (t_3_Local.a = t_2_Graph_Reach_sn_delta_f3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f3 AS (SELECT
  Graph_Reach_MultBodyAggAux_f2_f3.a AS a,
  Graph_Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS Graph_Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f3.a AS a,
  Graph_Reach_sn_step_f3.b AS b
FROM
  t_0_Graph_Reach_sn_step_f3 AS Graph_Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f3 AS Graph_Reach_sn_full_f3
  WHERE
    (Graph_Reach_sn_full_f3.a = Graph_Reach_sn_step_f3.a) AND
    (Graph_Reach_sn_full_f3.b = Graph_Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f3 SELECT * FROM logica_test.Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f3;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f3 AS SELECT
  Graph_Reach_sn_new_f3.a AS a,
  Graph_Reach_sn_new_f3.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f3 AS Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f3;
CREATE TABLE logica_test.Graph_Reach_sn_new_f3 AS WITH t_1_Local AS (SELECT * FROM (
  
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
t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      t_2_Graph_Reach_sn_delta_f3.a AS a,
      t_3_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f3 AS t_2_Graph_Reach_sn_delta_f3, t_1_Local AS t_3_Local
    WHERE
      (t_3_Local.a = t_2_Graph_Reach_sn_delta_f3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f3 AS (SELECT
  Graph_Reach_MultBodyAggAux_f2_f3.a AS a,
  Graph_Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS Graph_Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f3.a AS a,
  Graph_Reach_sn_step_f3.b AS b
FROM
  t_0_Graph_Reach_sn_step_f3 AS Graph_Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f3 AS Graph_Reach_sn_full_f3
  WHERE
    (Graph_Reach_sn_full_f3.a = Graph_Reach_sn_step_f3.a) AND
    (Graph_Reach_sn_full_f3.b = Graph_Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f3 SELECT * FROM logica_test.Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f3;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f3 AS SELECT
  Graph_Reach_sn_new_f3.a AS a,
  Graph_Reach_sn_new_f3.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f3 AS Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f3;
CREATE TABLE logica_test.Graph_Reach_sn_new_f3 AS WITH t_1_Local AS (SELECT * FROM (
  
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
t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      t_2_Graph_Reach_sn_delta_f3.a AS a,
      t_3_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f3 AS t_2_Graph_Reach_sn_delta_f3, t_1_Local AS t_3_Local
    WHERE
      (t_3_Local.a = t_2_Graph_Reach_sn_delta_f3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f3 AS (SELECT
  Graph_Reach_MultBodyAggAux_f2_f3.a AS a,
  Graph_Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS Graph_Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f3.a AS a,
  Graph_Reach_sn_step_f3.b AS b
FROM
  t_0_Graph_Reach_sn_step_f3 AS Graph_Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f3 AS Graph_Reach_sn_full_f3
  WHERE
    (Graph_Reach_sn_full_f3.a = Graph_Reach_sn_step_f3.a) AND
    (Graph_Reach_sn_full_f3.b = Graph_Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f3 SELECT * FROM logica_test.Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f3;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f3 AS SELECT
  Graph_Reach_sn_new_f3.a AS a,
  Graph_Reach_sn_new_f3.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f3 AS Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f3;
CREATE TABLE logica_test.Graph_Reach_sn_new_f3 AS WITH t_1_Local AS (SELECT * FROM (
  
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
t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      t_2_Graph_Reach_sn_delta_f3.a AS a,
      t_3_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f3 AS t_2_Graph_Reach_sn_delta_f3, t_1_Local AS t_3_Local
    WHERE
      (t_3_Local.a = t_2_Graph_Reach_sn_delta_f3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f3 AS (SELECT
  Graph_Reach_MultBodyAggAux_f2_f3.a AS a,
  Graph_Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS Graph_Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f3.a AS a,
  Graph_Reach_sn_step_f3.b AS b
FROM
  t_0_Graph_Reach_sn_step_f3 AS Graph_Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f3 AS Graph_Reach_sn_full_f3
  WHERE
    (Graph_Reach_sn_full_f3.a = Graph_Reach_sn_step_f3.a) AND
    (Graph_Reach_sn_full_f3.b = Graph_Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f3 SELECT * FROM logica_test.Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f3;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f3 AS SELECT
  Graph_Reach_sn_new_f3.a AS a,
  Graph_Reach_sn_new_f3.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f3 AS Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f3;
CREATE TABLE logica_test.Graph_Reach_sn_new_f3 AS WITH t_1_Local AS (SELECT * FROM (
  
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
t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      t_2_Graph_Reach_sn_delta_f3.a AS a,
      t_3_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f3 AS t_2_Graph_Reach_sn_delta_f3, t_1_Local AS t_3_Local
    WHERE
      (t_3_Local.a = t_2_Graph_Reach_sn_delta_f3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f3 AS (SELECT
  Graph_Reach_MultBodyAggAux_f2_f3.a AS a,
  Graph_Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS Graph_Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f3.a AS a,
  Graph_Reach_sn_step_f3.b AS b
FROM
  t_0_Graph_Reach_sn_step_f3 AS Graph_Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f3 AS Graph_Reach_sn_full_f3
  WHERE
    (Graph_Reach_sn_full_f3.a = Graph_Reach_sn_step_f3.a) AND
    (Graph_Reach_sn_full_f3.b = Graph_Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f3 SELECT * FROM logica_test.Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f3;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f3 AS SELECT
  Graph_Reach_sn_new_f3.a AS a,
  Graph_Reach_sn_new_f3.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f3 AS Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f3;
CREATE TABLE logica_test.Graph_Reach_sn_new_f3 AS WITH t_1_Local AS (SELECT * FROM (
  
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
t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      t_2_Graph_Reach_sn_delta_f3.a AS a,
      t_3_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f3 AS t_2_Graph_Reach_sn_delta_f3, t_1_Local AS t_3_Local
    WHERE
      (t_3_Local.a = t_2_Graph_Reach_sn_delta_f3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f3 AS (SELECT
  Graph_Reach_MultBodyAggAux_f2_f3.a AS a,
  Graph_Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS Graph_Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f3.a AS a,
  Graph_Reach_sn_step_f3.b AS b
FROM
  t_0_Graph_Reach_sn_step_f3 AS Graph_Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f3 AS Graph_Reach_sn_full_f3
  WHERE
    (Graph_Reach_sn_full_f3.a = Graph_Reach_sn_step_f3.a) AND
    (Graph_Reach_sn_full_f3.b = Graph_Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f3 SELECT * FROM logica_test.Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f3;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f3 AS SELECT
  Graph_Reach_sn_new_f3.a AS a,
  Graph_Reach_sn_new_f3.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f3 AS Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f3;
CREATE TABLE logica_test.Graph_Reach_sn_new_f3 AS WITH t_1_Local AS (SELECT * FROM (
  
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
t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      t_2_Graph_Reach_sn_delta_f3.a AS a,
      t_3_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f3 AS t_2_Graph_Reach_sn_delta_f3, t_1_Local AS t_3_Local
    WHERE
      (t_3_Local.a = t_2_Graph_Reach_sn_delta_f3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f3 AS (SELECT
  Graph_Reach_MultBodyAggAux_f2_f3.a AS a,
  Graph_Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS Graph_Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f3.a AS a,
  Graph_Reach_sn_step_f3.b AS b
FROM
  t_0_Graph_Reach_sn_step_f3 AS Graph_Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f3 AS Graph_Reach_sn_full_f3
  WHERE
    (Graph_Reach_sn_full_f3.a = Graph_Reach_sn_step_f3.a) AND
    (Graph_Reach_sn_full_f3.b = Graph_Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f3 SELECT * FROM logica_test.Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f3;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f3 AS SELECT
  Graph_Reach_sn_new_f3.a AS a,
  Graph_Reach_sn_new_f3.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f3 AS Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_new_f3;
CREATE TABLE logica_test.Graph_Reach_sn_new_f3 AS WITH t_1_Local AS (SELECT * FROM (
  
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
t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS (SELECT * FROM (
  
    SELECT
      Local.a AS a,
      Local.b AS b
    FROM
      t_1_Local AS Local
   UNION ALL
  
    SELECT
      t_2_Graph_Reach_sn_delta_f3.a AS a,
      t_3_Local.b AS b
    FROM
      logica_test.Graph_Reach_sn_delta_f3 AS t_2_Graph_Reach_sn_delta_f3, t_1_Local AS t_3_Local
    WHERE
      (t_3_Local.a = t_2_Graph_Reach_sn_delta_f3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Graph_Reach_sn_step_f3 AS (SELECT
  Graph_Reach_MultBodyAggAux_f2_f3.a AS a,
  Graph_Reach_MultBodyAggAux_f2_f3.b AS b
FROM
  t_1_Graph_Reach_MultBodyAggAux_f2_f3 AS Graph_Reach_MultBodyAggAux_f2_f3
GROUP BY 1, 2)
SELECT
  Graph_Reach_sn_step_f3.a AS a,
  Graph_Reach_sn_step_f3.b AS b
FROM
  t_0_Graph_Reach_sn_step_f3 AS Graph_Reach_sn_step_f3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Graph_Reach_sn_full_f3 AS Graph_Reach_sn_full_f3
  WHERE
    (Graph_Reach_sn_full_f3.a = Graph_Reach_sn_step_f3.a) AND
    (Graph_Reach_sn_full_f3.b = Graph_Reach_sn_step_f3.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Graph_Reach_sn_full_f3 SELECT * FROM logica_test.Graph_Reach_sn_new_f3;

DROP TABLE IF EXISTS logica_test.Graph_Reach_sn_delta_f3;
CREATE TABLE logica_test.Graph_Reach_sn_delta_f3 AS SELECT
  Graph_Reach_sn_new_f3.a AS a,
  Graph_Reach_sn_new_f3.b AS b
FROM
  logica_test.Graph_Reach_sn_new_f3 AS Graph_Reach_sn_new_f3;

SELECT
  Graph_Reach_sn_full_f3.b AS b
FROM
  logica_test.Graph_Reach_sn_full_f3 AS Graph_Reach_sn_full_f3
WHERE
  ('x' = Graph_Reach_sn_full_f3.a) ORDER BY b;
