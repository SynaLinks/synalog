DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_0_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_0_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.R_sn_delta

DROP TABLE IF EXISTS logica_test.R_sn_t0;
CREATE TABLE logica_test.R_sn_t0 AS SELECT
  R_sn_delta.x AS x
FROM
  logica_test.R_sn_delta AS R_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t0

DROP TABLE IF EXISTS logica_test.R_sn_t1;
CREATE TABLE logica_test.R_sn_t1 AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      logica_test.R_sn_t0 AS R_sn_t0, t_2_E AS E
    WHERE
      (E.a = R_sn_t0.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r1 AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  R_sn_r1.x AS x
FROM
  t_0_R_sn_r1 AS R_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t1

DROP TABLE IF EXISTS logica_test.R_sn_t2;
CREATE TABLE logica_test.R_sn_t2 AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      logica_test.R_sn_t1 AS R_sn_t1, t_2_E AS E
    WHERE
      (E.a = R_sn_t1.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r2 AS (SELECT
  R_MultBodyAggAux_f3.x AS x
FROM
  t_1_R_MultBodyAggAux_f3 AS R_MultBodyAggAux_f3
GROUP BY 1)
SELECT
  R_sn_r2.x AS x
FROM
  t_0_R_sn_r2 AS R_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t2

DROP TABLE IF EXISTS logica_test.R_sn_t3;
CREATE TABLE logica_test.R_sn_t3 AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      logica_test.R_sn_t2 AS R_sn_t2, t_2_E AS E
    WHERE
      (E.a = R_sn_t2.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r3 AS (SELECT
  R_MultBodyAggAux_f4.x AS x
FROM
  t_1_R_MultBodyAggAux_f4 AS R_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  R_sn_r3.x AS x
FROM
  t_0_R_sn_r3 AS R_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t3

DROP TABLE IF EXISTS logica_test.R_sn_full;
CREATE TABLE logica_test.R_sn_full AS SELECT * FROM (
  
    SELECT
      R_sn_delta.x AS x
    FROM
      logica_test.R_sn_delta AS R_sn_delta
   UNION ALL
  
    SELECT
      R_sn_t1.x AS x
    FROM
      logica_test.R_sn_t1 AS R_sn_t1
   UNION ALL
  
    SELECT
      R_sn_t2.x AS x
    FROM
      logica_test.R_sn_t2 AS R_sn_t2
   UNION ALL
  
    SELECT
      R_sn_t3.x AS x
    FROM
      logica_test.R_sn_t3 AS R_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.R_sn_full

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      logica_test.R_sn_delta AS R_sn_delta, t_2_E AS E
    WHERE
      (E.a = R_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f5.x AS x
FROM
  t_1_R_MultBodyAggAux_f5 AS R_MultBodyAggAux_f5
GROUP BY 1)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_test.R_sn_new AS R_sn_new;

SELECT
  R_sn_full.x AS x
FROM
  logica_test.R_sn_full AS R_sn_full ORDER BY x;