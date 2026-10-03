DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1 ORDER BY x;

-- Interacting with table logica_test.Reach_sn_delta

DROP TABLE IF EXISTS logica_test.Reach_sn_full;
CREATE TABLE logica_test.Reach_sn_full AS SELECT
  Reach_sn_delta.x AS x
FROM
  logica_test.Reach_sn_delta AS Reach_sn_delta;

-- Interacting with table logica_test.Reach_sn_full

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1 ORDER BY x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

SELECT
  Reach_sn_full.x AS x
FROM
  logica_test.Reach_sn_full AS Reach_sn_full;