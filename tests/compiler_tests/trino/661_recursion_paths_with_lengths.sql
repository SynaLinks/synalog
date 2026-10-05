DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS WITH t_2_E AS (SELECT * FROM (
  
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
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      t_1_E.b AS n,
      1 AS l
    FROM
      t_2_E AS t_1_E
    WHERE
      (t_1_E.a = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P_MultBodyAggAux_f1.n AS n,
  P_MultBodyAggAux_f1.l AS l
FROM
  t_0_P_MultBodyAggAux_f1 AS P_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.P_sn_delta

DROP TABLE IF EXISTS logica_test.P_sn_full;
CREATE TABLE logica_test.P_sn_full AS WITH t_2_E AS (SELECT * FROM (
  
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
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((t_2_P_sn_delta.l) + (1)) AS l
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (t_2_P_sn_delta.l < 3) AND
      (E.a = t_2_P_sn_delta.n)
   UNION ALL
  
    SELECT
      t_3_E.b AS n,
      1 AS l
    FROM
      t_2_E AS t_3_E
    WHERE
      (t_3_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.n AS n,
  P_MultBodyAggAux_f2.l AS l
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      P_sn_delta.n AS n,
      P_sn_delta.l AS l
    FROM
      logica_test.P_sn_delta AS P_sn_delta
   UNION ALL
  
    SELECT
      P_sn_step.n AS n,
      P_sn_step.l AS l
    FROM
      t_0_P_sn_step AS P_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.P_sn_full

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM (
  
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
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((t_2_P_sn_delta.l) + (1)) AS l
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (t_2_P_sn_delta.l < 3) AND
      (E.a = t_2_P_sn_delta.n)
   UNION ALL
  
    SELECT
      t_3_E.b AS n,
      1 AS l
    FROM
      t_2_E AS t_3_E
    WHERE
      (t_3_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.n AS n,
  P_MultBodyAggAux_f2.l AS l
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.n AS n,
  P_sn_step.l AS l
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n = P_sn_step.n) AND
    (P_sn_full.l = P_sn_step.l)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.n AS n,
  P_sn_new.l AS l
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM (
  
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
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((t_2_P_sn_delta.l) + (1)) AS l
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (t_2_P_sn_delta.l < 3) AND
      (E.a = t_2_P_sn_delta.n)
   UNION ALL
  
    SELECT
      t_3_E.b AS n,
      1 AS l
    FROM
      t_2_E AS t_3_E
    WHERE
      (t_3_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.n AS n,
  P_MultBodyAggAux_f2.l AS l
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.n AS n,
  P_sn_step.l AS l
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n = P_sn_step.n) AND
    (P_sn_full.l = P_sn_step.l)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.n AS n,
  P_sn_new.l AS l
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM (
  
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
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((t_2_P_sn_delta.l) + (1)) AS l
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (t_2_P_sn_delta.l < 3) AND
      (E.a = t_2_P_sn_delta.n)
   UNION ALL
  
    SELECT
      t_3_E.b AS n,
      1 AS l
    FROM
      t_2_E AS t_3_E
    WHERE
      (t_3_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.n AS n,
  P_MultBodyAggAux_f2.l AS l
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.n AS n,
  P_sn_step.l AS l
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n = P_sn_step.n) AND
    (P_sn_full.l = P_sn_step.l)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.n AS n,
  P_sn_new.l AS l
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM (
  
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
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((t_2_P_sn_delta.l) + (1)) AS l
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (t_2_P_sn_delta.l < 3) AND
      (E.a = t_2_P_sn_delta.n)
   UNION ALL
  
    SELECT
      t_3_E.b AS n,
      1 AS l
    FROM
      t_2_E AS t_3_E
    WHERE
      (t_3_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.n AS n,
  P_MultBodyAggAux_f2.l AS l
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.n AS n,
  P_sn_step.l AS l
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n = P_sn_step.n) AND
    (P_sn_full.l = P_sn_step.l)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.n AS n,
  P_sn_new.l AS l
FROM
  logica_test.P_sn_new AS P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_new;
CREATE TABLE logica_test.P_sn_new AS WITH t_2_E AS (SELECT * FROM (
  
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
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      E.b AS n,
      ((t_2_P_sn_delta.l) + (1)) AS l
    FROM
      logica_test.P_sn_delta AS t_2_P_sn_delta, t_2_E AS E
    WHERE
      (t_2_P_sn_delta.l < 3) AND
      (E.a = t_2_P_sn_delta.n)
   UNION ALL
  
    SELECT
      t_3_E.b AS n,
      1 AS l
    FROM
      t_2_E AS t_3_E
    WHERE
      (t_3_E.a = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_sn_step AS (SELECT
  P_MultBodyAggAux_f2.n AS n,
  P_MultBodyAggAux_f2.l AS l
FROM
  t_1_P_MultBodyAggAux_f2 AS P_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  P_sn_step.n AS n,
  P_sn_step.l AS l
FROM
  t_0_P_sn_step AS P_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.P_sn_full AS P_sn_full
  WHERE
    (P_sn_full.n = P_sn_step.n) AND
    (P_sn_full.l = P_sn_step.l)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.P_sn_full SELECT * FROM logica_test.P_sn_new;

DROP TABLE IF EXISTS logica_test.P_sn_delta;
CREATE TABLE logica_test.P_sn_delta AS SELECT
  P_sn_new.n AS n,
  P_sn_new.l AS l
FROM
  logica_test.P_sn_new AS P_sn_new;

SELECT
  P_sn_full.n AS n,
  P_sn_full.l AS l
FROM
  logica_test.P_sn_full AS P_sn_full ORDER BY n, l;