DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P_MultBodyAggAux_f1.a AS a,
  P_MultBodyAggAux_f1.b AS b
FROM
  t_0_P_MultBodyAggAux_f1 AS P_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.P_sn_delta

DROP TABLE IF EXISTS logica_test.P_sn_full;
CREATE TABLE logica_test.P_sn_full AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_P_sn_delta.a AS a,
      t_3_E.b AS b
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.a AS a,
  P_MultBodyAggAux_f2.b AS b
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      P_sn_delta.a AS a,
      P_sn_delta.b AS b
    FROM
      logica_test.P_sn_delta AS P_sn_delta
   UNION ALL
  
    SELECT
      P_sn_step.a AS a,
      P_sn_step.b AS b
    FROM
      t_0_P_sn_step AS P_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.P_sn_full

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_P_sn_delta.a AS a,
      t_3_E.b AS b
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.a AS a,
  P_MultBodyAggAux_f2.b AS b
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.a AS a,
  P_sn_step.b AS b
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.a = P_sn_step.a) AND
    (P_sn_full.b = P_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.a AS a,
  P_sn_new.b AS b
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_P_sn_delta.a AS a,
      t_3_E.b AS b
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.a AS a,
  P_MultBodyAggAux_f2.b AS b
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.a AS a,
  P_sn_step.b AS b
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.a = P_sn_step.a) AND
    (P_sn_full.b = P_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.a AS a,
  P_sn_new.b AS b
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_P_sn_delta.a AS a,
      t_3_E.b AS b
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.a AS a,
  P_MultBodyAggAux_f2.b AS b
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.a AS a,
  P_sn_step.b AS b
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.a = P_sn_step.a) AND
    (P_sn_full.b = P_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.a AS a,
  P_sn_new.b AS b
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_P_sn_delta.a AS a,
      t_3_E.b AS b
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.a AS a,
  P_MultBodyAggAux_f2.b AS b
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.a AS a,
  P_sn_step.b AS b
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.a = P_sn_step.a) AND
    (P_sn_full.b = P_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.a AS a,
  P_sn_new.b AS b
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_P_sn_delta.a AS a,
      t_3_E.b AS b
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.a AS a,
  P_MultBodyAggAux_f2.b AS b
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.a AS a,
  P_sn_step.b AS b
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.a = P_sn_step.a) AND
    (P_sn_full.b = P_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.a AS a,
  P_sn_new.b AS b
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_P_sn_delta.a AS a,
      t_3_E.b AS b
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.a AS a,
  P_MultBodyAggAux_f2.b AS b
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.a AS a,
  P_sn_step.b AS b
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.a = P_sn_step.a) AND
    (P_sn_full.b = P_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.a AS a,
  P_sn_new.b AS b
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_P_sn_delta.a AS a,
      t_3_E.b AS b
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.a AS a,
  P_MultBodyAggAux_f2.b AS b
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.a AS a,
  P_sn_step.b AS b
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.a = P_sn_step.a) AND
    (P_sn_full.b = P_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.a AS a,
  P_sn_new.b AS b
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_P_sn_delta.a AS a,
      t_3_E.b AS b
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_1_E AS t_3_E
    WHERE
      (t_3_E.a = t_2_P_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.a AS a,
  P_MultBodyAggAux_f2.b AS b
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.a AS a,
  P_sn_step.b AS b
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.a = P_sn_step.a) AND
    (P_sn_full.b = P_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.a AS a,
  P_sn_new.b AS b
FROM
  logica_test.P_sn_new AS P_sn_new;

SELECT
  P_sn_full.a AS a,
  P_sn_full.b AS b
FROM
  logica_test.P_sn_full AS P_sn_full ORDER BY a, b;