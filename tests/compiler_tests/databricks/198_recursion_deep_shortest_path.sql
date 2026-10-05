DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS WITH t_0_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Hop_sn_delta

DROP TABLE IF EXISTS logica_test.Hop_sn_full;
CREATE TABLE logica_test.Hop_sn_full AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Hop_sn_delta.node AS node,
      Hop_sn_delta.d AS d
    FROM
      logica_test.Hop_sn_delta AS Hop_sn_delta
   UNION ALL
  
    SELECT
      Hop_sn_step.node AS node,
      Hop_sn_step.d AS d
    FROM
      t_0_Hop_sn_step AS Hop_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Hop_sn_full

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_new;
CREATE TABLE logica_test.Hop_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (0, 1),
  (0, 2),
  (1, 3),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((t_2_Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_test.Hop_sn_delta AS t_2_Hop_sn_delta, t_3_Edge AS Edge
    WHERE
      (t_2_Hop_sn_delta.d < 5) AND
      (Edge.a = t_2_Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY 1, 2)
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
GROUP BY 1, 2;

INSERT INTO logica_test.Hop_sn_full SELECT * FROM logica_test.Hop_sn_new;

DROP TABLE IF EXISTS logica_test.Hop_sn_delta;
CREATE TABLE logica_test.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_test.Hop_sn_new AS Hop_sn_new;

SELECT
  Hop_sn_full.node AS node,
  MIN(Hop_sn_full.d) AS d
FROM
  logica_test.Hop_sn_full AS Hop_sn_full
GROUP BY 1 ORDER BY node NULLS LAST;