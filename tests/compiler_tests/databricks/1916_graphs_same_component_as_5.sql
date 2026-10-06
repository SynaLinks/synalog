DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_0_Conn_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Conn_MultBodyAggAux_f1.a AS a,
  Conn_MultBodyAggAux_f1.b AS b
FROM
  t_0_Conn_MultBodyAggAux_f1 AS Conn_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Conn_sn_delta

DROP TABLE IF EXISTS logica_test.Conn_sn_t0;
CREATE TABLE logica_test.Conn_sn_t0 AS SELECT
  Conn_sn_delta.a AS a,
  Conn_sn_delta.b AS b
FROM
  logica_test.Conn_sn_delta AS Conn_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Conn_sn_t0

DROP TABLE IF EXISTS logica_test.Conn_sn_t1;
CREATE TABLE logica_test.Conn_sn_t1 AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_t0.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_t0 AS Conn_sn_t0, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_t0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_r1 AS (SELECT
  Conn_MultBodyAggAux_f2.a AS a,
  Conn_MultBodyAggAux_f2.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f2 AS Conn_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Conn_sn_r1.a AS a,
  Conn_sn_r1.b AS b
FROM
  t_0_Conn_sn_r1 AS Conn_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Conn_sn_t1

DROP TABLE IF EXISTS logica_test.Conn_sn_t2;
CREATE TABLE logica_test.Conn_sn_t2 AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_t1.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_t1 AS Conn_sn_t1, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_t1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_r2 AS (SELECT
  Conn_MultBodyAggAux_f3.a AS a,
  Conn_MultBodyAggAux_f3.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f3 AS Conn_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  Conn_sn_r2.a AS a,
  Conn_sn_r2.b AS b
FROM
  t_0_Conn_sn_r2 AS Conn_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Conn_sn_t2

DROP TABLE IF EXISTS logica_test.Conn_sn_t3;
CREATE TABLE logica_test.Conn_sn_t3 AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_t2.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_t2 AS Conn_sn_t2, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_t2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_r3 AS (SELECT
  Conn_MultBodyAggAux_f4.a AS a,
  Conn_MultBodyAggAux_f4.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f4 AS Conn_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  Conn_sn_r3.a AS a,
  Conn_sn_r3.b AS b
FROM
  t_0_Conn_sn_r3 AS Conn_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Conn_sn_t3

DROP TABLE IF EXISTS logica_test.Conn_sn_t4;
CREATE TABLE logica_test.Conn_sn_t4 AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_t3.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_t3 AS Conn_sn_t3, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_t3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_r4 AS (SELECT
  Conn_MultBodyAggAux_f5.a AS a,
  Conn_MultBodyAggAux_f5.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f5 AS Conn_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  Conn_sn_r4.a AS a,
  Conn_sn_r4.b AS b
FROM
  t_0_Conn_sn_r4 AS Conn_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.Conn_sn_t4

DROP TABLE IF EXISTS logica_test.Conn_sn_t5;
CREATE TABLE logica_test.Conn_sn_t5 AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_t4.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_t4 AS Conn_sn_t4, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_t4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_r5 AS (SELECT
  Conn_MultBodyAggAux_f6.a AS a,
  Conn_MultBodyAggAux_f6.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f6 AS Conn_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  Conn_sn_r5.a AS a,
  Conn_sn_r5.b AS b
FROM
  t_0_Conn_sn_r5 AS Conn_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.Conn_sn_t5

DROP TABLE IF EXISTS logica_test.Conn_sn_full;
CREATE TABLE logica_test.Conn_sn_full AS SELECT * FROM (
  
    SELECT
      Conn_sn_delta.a AS a,
      Conn_sn_delta.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta
   UNION ALL
  
    SELECT
      Conn_sn_t1.a AS a,
      Conn_sn_t1.b AS b
    FROM
      logica_test.Conn_sn_t1 AS Conn_sn_t1
   UNION ALL
  
    SELECT
      Conn_sn_t2.a AS a,
      Conn_sn_t2.b AS b
    FROM
      logica_test.Conn_sn_t2 AS Conn_sn_t2
   UNION ALL
  
    SELECT
      Conn_sn_t3.a AS a,
      Conn_sn_t3.b AS b
    FROM
      logica_test.Conn_sn_t3 AS Conn_sn_t3
   UNION ALL
  
    SELECT
      Conn_sn_t4.a AS a,
      Conn_sn_t4.b AS b
    FROM
      logica_test.Conn_sn_t4 AS Conn_sn_t4
   UNION ALL
  
    SELECT
      Conn_sn_t5.a AS a,
      Conn_sn_t5.b AS b
    FROM
      logica_test.Conn_sn_t5 AS Conn_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Conn_sn_full

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_new;
CREATE TABLE logica_test.Conn_sn_new AS WITH t_3_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 5),
  (9, 10),
  (4, 2)
AS UNUSED_TABLE_NAME(a, b)),
t_2_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      t_4_E.b AS a,
      t_4_E.a AS b
    FROM
      t_3_E AS t_4_E
  
) AS UNUSED_TABLE_NAME  ),
t_1_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_2_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1, 2),
t_1_Conn_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_1_U AS U
   UNION ALL
  
    SELECT
      Conn_sn_delta.a AS a,
      t_3_U.b AS b
    FROM
      logica_test.Conn_sn_delta AS Conn_sn_delta, t_1_U AS t_3_U
    WHERE
      (t_3_U.a = Conn_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Conn_sn_step AS (SELECT
  Conn_MultBodyAggAux_f7.a AS a,
  Conn_MultBodyAggAux_f7.b AS b
FROM
  t_1_Conn_MultBodyAggAux_f7 AS Conn_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Conn_sn_step.a AS a,
  Conn_sn_step.b AS b
FROM
  t_0_Conn_sn_step AS Conn_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Conn_sn_full AS Conn_sn_full
  WHERE
    (Conn_sn_full.a = Conn_sn_step.a) AND
    (Conn_sn_full.b = Conn_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Conn_sn_full SELECT * FROM logica_test.Conn_sn_new;

DROP TABLE IF EXISTS logica_test.Conn_sn_delta;
CREATE TABLE logica_test.Conn_sn_delta AS SELECT
  Conn_sn_new.a AS a,
  Conn_sn_new.b AS b
FROM
  logica_test.Conn_sn_new AS Conn_sn_new;

WITH t_3_Node AS (SELECT * FROM VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10),
  (11),
  (12)
AS UNUSED_TABLE_NAME(n)),
t_2_Comp_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Node.n AS n,
      Conn_sn_full.b AS c
    FROM
      t_3_Node AS Node, logica_test.Conn_sn_full AS Conn_sn_full
    WHERE
      (Node.n = Conn_sn_full.a)
   UNION ALL
  
    SELECT
      t_4_Node.n AS n,
      t_4_Node.n AS c
    FROM
      t_3_Node AS t_4_Node
  
) AS UNUSED_TABLE_NAME  ),
t_1_Comp AS (SELECT
  Comp_MultBodyAggAux.n AS n,
  MIN(Comp_MultBodyAggAux.c) AS c
FROM
  t_2_Comp_MultBodyAggAux AS Comp_MultBodyAggAux
GROUP BY 1)
SELECT
  t_0_Comp.n AS m
FROM
  t_1_Comp AS Comp, t_1_Comp AS t_0_Comp
WHERE
  (Comp.n = 5) AND
  (t_0_Comp.c = Comp.c) ORDER BY m NULLS LAST;