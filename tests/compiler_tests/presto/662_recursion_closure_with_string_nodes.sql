DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_0_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      'a' AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_f1.n AS n
FROM
  t_0_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.R_sn_delta

DROP TABLE IF EXISTS logica_test.R_sn_full;
CREATE TABLE logica_test.R_sn_full AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'c' AS b
   UNION ALL
  
    SELECT
      'x' AS a,
      'y' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.n AS n
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      R_sn_delta.n AS n
    FROM
      logica_test.R_sn_delta AS R_sn_delta
   UNION ALL
  
    SELECT
      R_sn_step.n AS n
    FROM
      t_0_R_sn_step AS R_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.R_sn_full

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'c' AS b
   UNION ALL
  
    SELECT
      'x' AS a,
      'y' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.n AS n
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  R_sn_step.n AS n
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full
  WHERE
    (R_sn_full.n = R_sn_step.n)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS SELECT
  R_sn_new.n AS n
FROM
  logica_test.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'c' AS b
   UNION ALL
  
    SELECT
      'x' AS a,
      'y' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.n AS n
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  R_sn_step.n AS n
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full
  WHERE
    (R_sn_full.n = R_sn_step.n)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS SELECT
  R_sn_new.n AS n
FROM
  logica_test.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'c' AS b
   UNION ALL
  
    SELECT
      'x' AS a,
      'y' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.n AS n
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  R_sn_step.n AS n
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full
  WHERE
    (R_sn_full.n = R_sn_step.n)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS SELECT
  R_sn_new.n AS n
FROM
  logica_test.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'c' AS b
   UNION ALL
  
    SELECT
      'x' AS a,
      'y' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.n AS n
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  R_sn_step.n AS n
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full
  WHERE
    (R_sn_full.n = R_sn_step.n)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS SELECT
  R_sn_new.n AS n
FROM
  logica_test.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'c' AS b
   UNION ALL
  
    SELECT
      'x' AS a,
      'y' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.n)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.n AS n
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  R_sn_step.n AS n
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full
  WHERE
    (R_sn_full.n = R_sn_step.n)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS SELECT
  R_sn_new.n AS n
FROM
  logica_test.R_sn_new AS R_sn_new;

SELECT
  R_sn_full.n AS n
FROM
  logica_test.R_sn_full AS R_sn_full ORDER BY n;