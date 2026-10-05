DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.s AS s,
  Reach_MultBodyAggAux_f1.t AS t
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Reach_sn_delta

DROP TABLE IF EXISTS logica_test.Reach_sn_full;
CREATE TABLE logica_test.Reach_sn_full AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.s AS s,
      t_3_E.b AS t
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_Reach_sn_delta.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.s AS s,
  Reach_MultBodyAggAux_f2.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Reach_sn_delta.s AS s,
      Reach_sn_delta.t AS t
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_step.s AS s,
      Reach_sn_step.t AS t
    FROM
      t_0_Reach_sn_step AS Reach_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reach_sn_full

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.s AS s,
      t_3_E.b AS t
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_Reach_sn_delta.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.s AS s,
  Reach_MultBodyAggAux_f2.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.s AS s,
  Reach_sn_step.t AS t
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.s = Reach_sn_step.s) AND
    (Reach_sn_full.t = Reach_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.s AS s,
  Reach_sn_new.t AS t
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.s AS s,
      t_3_E.b AS t
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_Reach_sn_delta.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.s AS s,
  Reach_MultBodyAggAux_f2.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.s AS s,
  Reach_sn_step.t AS t
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.s = Reach_sn_step.s) AND
    (Reach_sn_full.t = Reach_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.s AS s,
  Reach_sn_new.t AS t
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.s AS s,
      t_3_E.b AS t
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_Reach_sn_delta.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.s AS s,
  Reach_MultBodyAggAux_f2.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.s AS s,
  Reach_sn_step.t AS t
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.s = Reach_sn_step.s) AND
    (Reach_sn_full.t = Reach_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.s AS s,
  Reach_sn_new.t AS t
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.s AS s,
      t_3_E.b AS t
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_Reach_sn_delta.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.s AS s,
  Reach_MultBodyAggAux_f2.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.s AS s,
  Reach_sn_step.t AS t
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.s = Reach_sn_step.s) AND
    (Reach_sn_full.t = Reach_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.s AS s,
  Reach_sn_new.t AS t
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_Reach_sn_delta.s AS s,
      t_3_E.b AS t
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_Reach_sn_delta.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.s AS s,
  Reach_MultBodyAggAux_f2.t AS t
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Reach_sn_step.s AS s,
  Reach_sn_step.t AS t
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.s = Reach_sn_step.s) AND
    (Reach_sn_full.t = Reach_sn_step.t)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.s AS s,
  Reach_sn_new.t AS t
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

SELECT
  Reach_sn_full.s AS s,
  SUM(1) AS n
FROM
  logica_test.Reach_sn_full AS Reach_sn_full
GROUP BY 1 ORDER BY s NULLS LAST;