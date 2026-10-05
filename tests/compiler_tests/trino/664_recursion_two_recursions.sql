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

DROP TABLE IF EXISTS logica_test.R_sn_full;
CREATE TABLE logica_test.R_sn_full AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      R_sn_delta.x AS x
    FROM
      logica_test.R_sn_delta AS R_sn_delta
   UNION ALL
  
    SELECT
      R_sn_step.x AS x
    FROM
      t_0_R_sn_step AS R_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.R_sn_full

DROP TABLE IF EXISTS logica_test.S_sn_delta;
CREATE TABLE logica_test.S_sn_delta AS WITH t_0_S_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S_MultBodyAggAux_f3.x AS x
FROM
  t_0_S_MultBodyAggAux_f3 AS S_MultBodyAggAux_f3
GROUP BY 1;

-- Interacting with table logica_test.S_sn_delta

DROP TABLE IF EXISTS logica_test.S_sn_full;
CREATE TABLE logica_test.S_sn_full AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_S_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      E.a AS x
    FROM
      logica_test.S_sn_delta AS t_2_S_sn_delta, t_3_E AS E
    WHERE
      (E.b = t_2_S_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_sn_step AS (SELECT
  S_MultBodyAggAux_f4.x AS x
FROM
  t_1_S_MultBodyAggAux_f4 AS S_MultBodyAggAux_f4
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      S_sn_delta.x AS x
    FROM
      logica_test.S_sn_delta AS S_sn_delta
   UNION ALL
  
    SELECT
      S_sn_step.x AS x
    FROM
      t_0_S_sn_step AS S_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.S_sn_full

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
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

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
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

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
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

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
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

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      logica_test.R_sn_delta AS t_2_R_sn_delta, t_3_E AS E
    WHERE
      (E.a = t_2_R_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
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

DROP TABLE IF EXISTS logica_test.S_sn_new;
CREATE TABLE logica_test.S_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_S_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      E.a AS x
    FROM
      logica_test.S_sn_delta AS t_2_S_sn_delta, t_3_E AS E
    WHERE
      (E.b = t_2_S_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_sn_step AS (SELECT
  S_MultBodyAggAux_f4.x AS x
FROM
  t_1_S_MultBodyAggAux_f4 AS S_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  S_sn_step.x AS x
FROM
  t_0_S_sn_step AS S_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.S_sn_full AS S_sn_full
  WHERE
    (S_sn_full.x = S_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.S_sn_full SELECT * FROM logica_test.S_sn_new;

DROP TABLE IF EXISTS logica_test.S_sn_delta;
CREATE TABLE logica_test.S_sn_delta AS SELECT
  S_sn_new.x AS x
FROM
  logica_test.S_sn_new AS S_sn_new;

DROP TABLE IF EXISTS logica_test.S_sn_new;
CREATE TABLE logica_test.S_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_S_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      E.a AS x
    FROM
      logica_test.S_sn_delta AS t_2_S_sn_delta, t_3_E AS E
    WHERE
      (E.b = t_2_S_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_sn_step AS (SELECT
  S_MultBodyAggAux_f4.x AS x
FROM
  t_1_S_MultBodyAggAux_f4 AS S_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  S_sn_step.x AS x
FROM
  t_0_S_sn_step AS S_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.S_sn_full AS S_sn_full
  WHERE
    (S_sn_full.x = S_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.S_sn_full SELECT * FROM logica_test.S_sn_new;

DROP TABLE IF EXISTS logica_test.S_sn_delta;
CREATE TABLE logica_test.S_sn_delta AS SELECT
  S_sn_new.x AS x
FROM
  logica_test.S_sn_new AS S_sn_new;

DROP TABLE IF EXISTS logica_test.S_sn_new;
CREATE TABLE logica_test.S_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_S_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      E.a AS x
    FROM
      logica_test.S_sn_delta AS t_2_S_sn_delta, t_3_E AS E
    WHERE
      (E.b = t_2_S_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_sn_step AS (SELECT
  S_MultBodyAggAux_f4.x AS x
FROM
  t_1_S_MultBodyAggAux_f4 AS S_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  S_sn_step.x AS x
FROM
  t_0_S_sn_step AS S_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.S_sn_full AS S_sn_full
  WHERE
    (S_sn_full.x = S_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.S_sn_full SELECT * FROM logica_test.S_sn_new;

DROP TABLE IF EXISTS logica_test.S_sn_delta;
CREATE TABLE logica_test.S_sn_delta AS SELECT
  S_sn_new.x AS x
FROM
  logica_test.S_sn_new AS S_sn_new;

DROP TABLE IF EXISTS logica_test.S_sn_new;
CREATE TABLE logica_test.S_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_S_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      E.a AS x
    FROM
      logica_test.S_sn_delta AS t_2_S_sn_delta, t_3_E AS E
    WHERE
      (E.b = t_2_S_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_sn_step AS (SELECT
  S_MultBodyAggAux_f4.x AS x
FROM
  t_1_S_MultBodyAggAux_f4 AS S_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  S_sn_step.x AS x
FROM
  t_0_S_sn_step AS S_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.S_sn_full AS S_sn_full
  WHERE
    (S_sn_full.x = S_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.S_sn_full SELECT * FROM logica_test.S_sn_new;

DROP TABLE IF EXISTS logica_test.S_sn_delta;
CREATE TABLE logica_test.S_sn_delta AS SELECT
  S_sn_new.x AS x
FROM
  logica_test.S_sn_new AS S_sn_new;

DROP TABLE IF EXISTS logica_test.S_sn_new;
CREATE TABLE logica_test.S_sn_new AS WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_S_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      E.a AS x
    FROM
      logica_test.S_sn_delta AS t_2_S_sn_delta, t_3_E AS E
    WHERE
      (E.b = t_2_S_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_sn_step AS (SELECT
  S_MultBodyAggAux_f4.x AS x
FROM
  t_1_S_MultBodyAggAux_f4 AS S_MultBodyAggAux_f4
GROUP BY 1)
SELECT
  S_sn_step.x AS x
FROM
  t_0_S_sn_step AS S_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.S_sn_full AS S_sn_full
  WHERE
    (S_sn_full.x = S_sn_step.x)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.S_sn_full SELECT * FROM logica_test.S_sn_new;

DROP TABLE IF EXISTS logica_test.S_sn_delta;
CREATE TABLE logica_test.S_sn_delta AS SELECT
  S_sn_new.x AS x
FROM
  logica_test.S_sn_new AS S_sn_new;

SELECT
  R_sn_full.x AS x
FROM
  logica_test.R_sn_full AS R_sn_full, logica_test.S_sn_full AS S_sn_full
WHERE
  (R_sn_full.x > 2) AND
  (S_sn_full.x = R_sn_full.x);