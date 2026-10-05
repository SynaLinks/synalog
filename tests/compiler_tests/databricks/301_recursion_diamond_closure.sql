DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.a AS a,
  Reach_MultBodyAggAux_f1.b AS b
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Reach_sn_delta

DROP TABLE IF EXISTS logica_test.Reach_sn_full;
CREATE TABLE logica_test.Reach_sn_full AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.a AS a,
      t_3_Edge.b AS b
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = t_2_Reach_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.a AS a,
  Reach_MultBodyAggAux_f2.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Reach_sn_delta.a AS a,
      Reach_sn_delta.b AS b
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_step.a AS a,
      Reach_sn_step.b AS b
    FROM
      t_0_Reach_sn_step AS Reach_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reach_sn_full

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.a AS a,
      t_3_Edge.b AS b
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = t_2_Reach_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.a AS a,
  Reach_MultBodyAggAux_f2.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.a AS a,
  Reach_sn_step.b AS b
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.a = Reach_sn_step.a) AND
    (Reach_sn_full.b = Reach_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.a AS a,
  Reach_sn_new.b AS b
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.a AS a,
      t_3_Edge.b AS b
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = t_2_Reach_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.a AS a,
  Reach_MultBodyAggAux_f2.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.a AS a,
  Reach_sn_step.b AS b
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.a = Reach_sn_step.a) AND
    (Reach_sn_full.b = Reach_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.a AS a,
  Reach_sn_new.b AS b
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.a AS a,
      t_3_Edge.b AS b
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = t_2_Reach_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.a AS a,
  Reach_MultBodyAggAux_f2.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.a AS a,
  Reach_sn_step.b AS b
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.a = Reach_sn_step.a) AND
    (Reach_sn_full.b = Reach_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.a AS a,
  Reach_sn_new.b AS b
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.a AS a,
      t_3_Edge.b AS b
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = t_2_Reach_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.a AS a,
  Reach_MultBodyAggAux_f2.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.a AS a,
  Reach_sn_step.b AS b
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.a = Reach_sn_step.a) AND
    (Reach_sn_full.b = Reach_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.a AS a,
  Reach_sn_new.b AS b
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.a AS a,
      t_3_Edge.b AS b
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = t_2_Reach_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.a AS a,
  Reach_MultBodyAggAux_f2.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.a AS a,
  Reach_sn_step.b AS b
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.a = Reach_sn_step.a) AND
    (Reach_sn_full.b = Reach_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.a AS a,
  Reach_sn_new.b AS b
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.a AS a,
      t_3_Edge.b AS b
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = t_2_Reach_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.a AS a,
  Reach_MultBodyAggAux_f2.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.a AS a,
  Reach_sn_step.b AS b
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.a = Reach_sn_step.a) AND
    (Reach_sn_full.b = Reach_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.a AS a,
  Reach_sn_new.b AS b
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.a AS a,
      t_3_Edge.b AS b
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = t_2_Reach_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.a AS a,
  Reach_MultBodyAggAux_f2.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.a AS a,
  Reach_sn_step.b AS b
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.a = Reach_sn_step.a) AND
    (Reach_sn_full.b = Reach_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.a AS a,
  Reach_sn_new.b AS b
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.a AS a,
      t_3_Edge.b AS b
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = t_2_Reach_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.a AS a,
  Reach_MultBodyAggAux_f2.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.a AS a,
  Reach_sn_step.b AS b
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.a = Reach_sn_step.a) AND
    (Reach_sn_full.b = Reach_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.a AS a,
  Reach_sn_new.b AS b
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.a AS a,
      t_3_Edge.b AS b
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = t_2_Reach_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.a AS a,
  Reach_MultBodyAggAux_f2.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.a AS a,
  Reach_sn_step.b AS b
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.a = Reach_sn_step.a) AND
    (Reach_sn_full.b = Reach_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.a AS a,
  Reach_sn_new.b AS b
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      "s" AS a,
      "l" AS b
   UNION ALL
  
    SELECT
      "s" AS a,
      "r" AS b
   UNION ALL
  
    SELECT
      "l" AS a,
      "t" AS b
   UNION ALL
  
    SELECT
      "r" AS a,
      "t" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.a AS a,
      t_3_Edge.b AS b
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = t_2_Reach_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.a AS a,
  Reach_MultBodyAggAux_f2.b AS b
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.a AS a,
  Reach_sn_step.b AS b
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.a = Reach_sn_step.a) AND
    (Reach_sn_full.b = Reach_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.a AS a,
  Reach_sn_new.b AS b
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

SELECT
  SUM(1) AS n
FROM
  logica_test.Reach_sn_full AS Reach_sn_full;