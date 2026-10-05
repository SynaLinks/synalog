DROP TABLE IF EXISTS logica_test.Select_sn_delta;
CREATE TABLE logica_test.Select_sn_delta AS WITH t_0_Select_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Select_MultBodyAggAux_f1.x AS x
FROM
  t_0_Select_MultBodyAggAux_f1 AS Select_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.Select_sn_delta

DROP TABLE IF EXISTS logica_test.Select_sn_full;
CREATE TABLE logica_test.Select_sn_full AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_delta AS t_2_Select_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Select_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_step AS (SELECT
  Select_MultBodyAggAux_f2.x AS x
FROM
  t_1_Select_MultBodyAggAux_f2 AS Select_MultBodyAggAux_f2
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      Select_sn_delta.x AS x
    FROM
      logica_test.Select_sn_delta AS Select_sn_delta
   UNION ALL
  
    SELECT
      Select_sn_step.x AS x
    FROM
      t_0_Select_sn_step AS Select_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Select_sn_full

DROP TABLE IF EXISTS logica_test.Select_sn_new;
CREATE TABLE logica_test.Select_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_delta AS t_2_Select_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Select_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_step AS (SELECT
  Select_MultBodyAggAux_f2.x AS x
FROM
  t_1_Select_MultBodyAggAux_f2 AS Select_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Select_sn_step.x AS x
FROM
  t_0_Select_sn_step AS Select_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Select_sn_full AS Select_sn_full
  WHERE
    (Select_sn_full.x = Select_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Select_sn_full SELECT * FROM logica_test.Select_sn_new;

DROP TABLE IF EXISTS logica_test.Select_sn_delta;
CREATE TABLE logica_test.Select_sn_delta AS SELECT
  Select_sn_new.x AS x
FROM
  logica_test.Select_sn_new AS Select_sn_new;

DROP TABLE IF EXISTS logica_test.Select_sn_new;
CREATE TABLE logica_test.Select_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_delta AS t_2_Select_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Select_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_step AS (SELECT
  Select_MultBodyAggAux_f2.x AS x
FROM
  t_1_Select_MultBodyAggAux_f2 AS Select_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Select_sn_step.x AS x
FROM
  t_0_Select_sn_step AS Select_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Select_sn_full AS Select_sn_full
  WHERE
    (Select_sn_full.x = Select_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Select_sn_full SELECT * FROM logica_test.Select_sn_new;

DROP TABLE IF EXISTS logica_test.Select_sn_delta;
CREATE TABLE logica_test.Select_sn_delta AS SELECT
  Select_sn_new.x AS x
FROM
  logica_test.Select_sn_new AS Select_sn_new;

DROP TABLE IF EXISTS logica_test.Select_sn_new;
CREATE TABLE logica_test.Select_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_delta AS t_2_Select_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Select_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_step AS (SELECT
  Select_MultBodyAggAux_f2.x AS x
FROM
  t_1_Select_MultBodyAggAux_f2 AS Select_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Select_sn_step.x AS x
FROM
  t_0_Select_sn_step AS Select_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Select_sn_full AS Select_sn_full
  WHERE
    (Select_sn_full.x = Select_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Select_sn_full SELECT * FROM logica_test.Select_sn_new;

DROP TABLE IF EXISTS logica_test.Select_sn_delta;
CREATE TABLE logica_test.Select_sn_delta AS SELECT
  Select_sn_new.x AS x
FROM
  logica_test.Select_sn_new AS Select_sn_new;

DROP TABLE IF EXISTS logica_test.Select_sn_new;
CREATE TABLE logica_test.Select_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_delta AS t_2_Select_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Select_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_step AS (SELECT
  Select_MultBodyAggAux_f2.x AS x
FROM
  t_1_Select_MultBodyAggAux_f2 AS Select_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Select_sn_step.x AS x
FROM
  t_0_Select_sn_step AS Select_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Select_sn_full AS Select_sn_full
  WHERE
    (Select_sn_full.x = Select_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Select_sn_full SELECT * FROM logica_test.Select_sn_new;

DROP TABLE IF EXISTS logica_test.Select_sn_delta;
CREATE TABLE logica_test.Select_sn_delta AS SELECT
  Select_sn_new.x AS x
FROM
  logica_test.Select_sn_new AS Select_sn_new;

DROP TABLE IF EXISTS logica_test.Select_sn_new;
CREATE TABLE logica_test.Select_sn_new AS WITH t_3_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_delta AS t_2_Select_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Select_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_step AS (SELECT
  Select_MultBodyAggAux_f2.x AS x
FROM
  t_1_Select_MultBodyAggAux_f2 AS Select_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Select_sn_step.x AS x
FROM
  t_0_Select_sn_step AS Select_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Select_sn_full AS Select_sn_full
  WHERE
    (Select_sn_full.x = Select_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Select_sn_full SELECT * FROM logica_test.Select_sn_new;

DROP TABLE IF EXISTS logica_test.Select_sn_delta;
CREATE TABLE logica_test.Select_sn_delta AS SELECT
  Select_sn_new.x AS x
FROM
  logica_test.Select_sn_new AS Select_sn_new;

SELECT
  SUM(1) AS n
FROM
  logica_test.Select_sn_full AS Select_sn_full;