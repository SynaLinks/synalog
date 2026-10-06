DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.Reach_sn_delta

DROP TABLE IF EXISTS logica_test.Reach_sn_t0;
CREATE TABLE logica_test.Reach_sn_t0 AS SELECT
  Reach_sn_delta.y AS y
FROM
  logica_test.Reach_sn_delta AS Reach_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t0

DROP TABLE IF EXISTS logica_test.Reach_sn_t1;
CREATE TABLE logica_test.Reach_sn_t1 AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_t0 AS Reach_sn_t0, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_t0.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r1 AS (SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_r1.y AS y
FROM
  t_0_Reach_sn_r1 AS Reach_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t1

DROP TABLE IF EXISTS logica_test.Reach_sn_t2;
CREATE TABLE logica_test.Reach_sn_t2 AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_t1 AS Reach_sn_t1, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_t1.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r2 AS (SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY 1)
SELECT
  Reach_sn_r2.y AS y
FROM
  t_0_Reach_sn_r2 AS Reach_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t2

DROP TABLE IF EXISTS logica_test.Reach_sn_t3;
CREATE TABLE logica_test.Reach_sn_t3 AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_t2 AS Reach_sn_t2, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_t2.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r3 AS (SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  Reach_sn_r3.y AS y
FROM
  t_0_Reach_sn_r3 AS Reach_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Reach_sn_t3

DROP TABLE IF EXISTS logica_test.Reach_sn_full;
CREATE TABLE logica_test.Reach_sn_full AS SELECT * FROM (
  
    SELECT
      Reach_sn_delta.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_t1.y AS y
    FROM
      logica_test.Reach_sn_t1 AS Reach_sn_t1
   UNION ALL
  
    SELECT
      Reach_sn_t2.y AS y
    FROM
      logica_test.Reach_sn_t2 AS Reach_sn_t2
   UNION ALL
  
    SELECT
      Reach_sn_t3.y AS y
    FROM
      logica_test.Reach_sn_t3 AS Reach_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reach_sn_full

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.x = Reach_sn_delta.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.y = Reach_sn_step.y)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.y AS y
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

SELECT
  Reach_sn_full.y AS y
FROM
  logica_test.Reach_sn_full AS Reach_sn_full ORDER BY y;