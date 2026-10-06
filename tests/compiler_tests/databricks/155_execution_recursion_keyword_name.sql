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

DROP TABLE IF EXISTS logica_test.Select_sn_t0;
CREATE TABLE logica_test.Select_sn_t0 AS SELECT
  Select_sn_delta.x AS x
FROM
  logica_test.Select_sn_delta AS Select_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Select_sn_t0

DROP TABLE IF EXISTS logica_test.Select_sn_t1;
CREATE TABLE logica_test.Select_sn_t1 AS WITH t_2_Edge AS (SELECT * FROM VALUES
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
      logica_test.Select_sn_t0 AS Select_sn_t0, t_2_Edge AS Edge
    WHERE
      (Edge.a = Select_sn_t0.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_r1 AS (SELECT
  Select_MultBodyAggAux_f2.x AS x
FROM
  t_1_Select_MultBodyAggAux_f2 AS Select_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Select_sn_r1.x AS x
FROM
  t_0_Select_sn_r1 AS Select_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Select_sn_t1

DROP TABLE IF EXISTS logica_test.Select_sn_t2;
CREATE TABLE logica_test.Select_sn_t2 AS WITH t_2_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_t1 AS Select_sn_t1, t_2_Edge AS Edge
    WHERE
      (Edge.a = Select_sn_t1.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_r2 AS (SELECT
  Select_MultBodyAggAux_f3.x AS x
FROM
  t_1_Select_MultBodyAggAux_f3 AS Select_MultBodyAggAux_f3
GROUP BY 1)
SELECT
  Select_sn_r2.x AS x
FROM
  t_0_Select_sn_r2 AS Select_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Select_sn_t2

DROP TABLE IF EXISTS logica_test.Select_sn_t3;
CREATE TABLE logica_test.Select_sn_t3 AS WITH t_2_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_t2 AS Select_sn_t2, t_2_Edge AS Edge
    WHERE
      (Edge.a = Select_sn_t2.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_r3 AS (SELECT
  Select_MultBodyAggAux_f4.x AS x
FROM
  t_1_Select_MultBodyAggAux_f4 AS Select_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  Select_sn_r3.x AS x
FROM
  t_0_Select_sn_r3 AS Select_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Select_sn_t3

DROP TABLE IF EXISTS logica_test.Select_sn_full;
CREATE TABLE logica_test.Select_sn_full AS SELECT * FROM (
  
    SELECT
      Select_sn_delta.x AS x
    FROM
      logica_test.Select_sn_delta AS Select_sn_delta
   UNION ALL
  
    SELECT
      Select_sn_t1.x AS x
    FROM
      logica_test.Select_sn_t1 AS Select_sn_t1
   UNION ALL
  
    SELECT
      Select_sn_t2.x AS x
    FROM
      logica_test.Select_sn_t2 AS Select_sn_t2
   UNION ALL
  
    SELECT
      Select_sn_t3.x AS x
    FROM
      logica_test.Select_sn_t3 AS Select_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Select_sn_full

DROP TABLE IF EXISTS logica_test.Select_sn_new;
CREATE TABLE logica_test.Select_sn_new AS WITH t_2_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_delta AS Select_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Select_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_step AS (SELECT
  Select_MultBodyAggAux_f5.x AS x
FROM
  t_1_Select_MultBodyAggAux_f5 AS Select_MultBodyAggAux_f5
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
CREATE TABLE logica_test.Select_sn_new AS WITH t_2_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_delta AS Select_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Select_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_step AS (SELECT
  Select_MultBodyAggAux_f5.x AS x
FROM
  t_1_Select_MultBodyAggAux_f5 AS Select_MultBodyAggAux_f5
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
CREATE TABLE logica_test.Select_sn_new AS WITH t_2_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_delta AS Select_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Select_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_step AS (SELECT
  Select_MultBodyAggAux_f5.x AS x
FROM
  t_1_Select_MultBodyAggAux_f5 AS Select_MultBodyAggAux_f5
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
CREATE TABLE logica_test.Select_sn_new AS WITH t_2_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_delta AS Select_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Select_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_step AS (SELECT
  Select_MultBodyAggAux_f5.x AS x
FROM
  t_1_Select_MultBodyAggAux_f5 AS Select_MultBodyAggAux_f5
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
CREATE TABLE logica_test.Select_sn_new AS WITH t_2_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_1_Select_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_test.Select_sn_delta AS Select_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Select_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Select_sn_step AS (SELECT
  Select_MultBodyAggAux_f5.x AS x
FROM
  t_1_Select_MultBodyAggAux_f5 AS Select_MultBodyAggAux_f5
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