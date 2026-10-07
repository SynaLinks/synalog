DROP TABLE IF EXISTS logica_test.Contains_sn_delta;
CREATE TABLE logica_test.Contains_sn_delta AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_1_Uses.part AS part,
      t_1_Uses.component AS component
    FROM
      t_2_Uses AS t_1_Uses
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Contains_MultBodyAggAux_f2.part AS part,
  Contains_MultBodyAggAux_f2.component AS component
FROM
  t_0_Contains_MultBodyAggAux_f2 AS Contains_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table logica_test.Contains_sn_delta

DROP TABLE IF EXISTS logica_test.Contains_sn_t0;
CREATE TABLE logica_test.Contains_sn_t0 AS SELECT
  Contains_sn_delta.part AS part,
  Contains_sn_delta.component AS component
FROM
  logica_test.Contains_sn_delta AS Contains_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Contains_sn_t0

DROP TABLE IF EXISTS logica_test.Contains_sn_t1;
CREATE TABLE logica_test.Contains_sn_t1 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Contains_sn_t0.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_t0 AS Contains_sn_t0, t_2_Uses AS Uses
    WHERE
      (Uses.part = Contains_sn_t0.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_r1 AS (SELECT
  Contains_MultBodyAggAux_f3.part AS part,
  Contains_MultBodyAggAux_f3.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f3 AS Contains_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  Contains_sn_r1.part AS part,
  Contains_sn_r1.component AS component
FROM
  t_0_Contains_sn_r1 AS Contains_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Contains_sn_t1

DROP TABLE IF EXISTS logica_test.Contains_sn_t2;
CREATE TABLE logica_test.Contains_sn_t2 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Contains_sn_t1.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_t1 AS Contains_sn_t1, t_2_Uses AS Uses
    WHERE
      (Uses.part = Contains_sn_t1.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_r2 AS (SELECT
  Contains_MultBodyAggAux_f4.part AS part,
  Contains_MultBodyAggAux_f4.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f4 AS Contains_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  Contains_sn_r2.part AS part,
  Contains_sn_r2.component AS component
FROM
  t_0_Contains_sn_r2 AS Contains_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Contains_sn_t2

DROP TABLE IF EXISTS logica_test.Contains_sn_t3;
CREATE TABLE logica_test.Contains_sn_t3 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Contains_sn_t2.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_t2 AS Contains_sn_t2, t_2_Uses AS Uses
    WHERE
      (Uses.part = Contains_sn_t2.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_r3 AS (SELECT
  Contains_MultBodyAggAux_f5.part AS part,
  Contains_MultBodyAggAux_f5.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f5 AS Contains_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  Contains_sn_r3.part AS part,
  Contains_sn_r3.component AS component
FROM
  t_0_Contains_sn_r3 AS Contains_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Contains_sn_t3

DROP TABLE IF EXISTS logica_test.Contains_sn_t4;
CREATE TABLE logica_test.Contains_sn_t4 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Contains_sn_t3.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_t3 AS Contains_sn_t3, t_2_Uses AS Uses
    WHERE
      (Uses.part = Contains_sn_t3.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_r4 AS (SELECT
  Contains_MultBodyAggAux_f6.part AS part,
  Contains_MultBodyAggAux_f6.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f6 AS Contains_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  Contains_sn_r4.part AS part,
  Contains_sn_r4.component AS component
FROM
  t_0_Contains_sn_r4 AS Contains_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.Contains_sn_t4

DROP TABLE IF EXISTS logica_test.Contains_sn_t5;
CREATE TABLE logica_test.Contains_sn_t5 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Contains_sn_t4.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_t4 AS Contains_sn_t4, t_2_Uses AS Uses
    WHERE
      (Uses.part = Contains_sn_t4.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_r5 AS (SELECT
  Contains_MultBodyAggAux_f7.part AS part,
  Contains_MultBodyAggAux_f7.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f7 AS Contains_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Contains_sn_r5.part AS part,
  Contains_sn_r5.component AS component
FROM
  t_0_Contains_sn_r5 AS Contains_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.Contains_sn_t5

DROP TABLE IF EXISTS logica_test.Contains_sn_full;
CREATE TABLE logica_test.Contains_sn_full AS SELECT * FROM (
  
    SELECT
      Contains_sn_delta.part AS part,
      Contains_sn_delta.component AS component
    FROM
      logica_test.Contains_sn_delta AS Contains_sn_delta
   UNION ALL
  
    SELECT
      Contains_sn_t1.part AS part,
      Contains_sn_t1.component AS component
    FROM
      logica_test.Contains_sn_t1 AS Contains_sn_t1
   UNION ALL
  
    SELECT
      Contains_sn_t2.part AS part,
      Contains_sn_t2.component AS component
    FROM
      logica_test.Contains_sn_t2 AS Contains_sn_t2
   UNION ALL
  
    SELECT
      Contains_sn_t3.part AS part,
      Contains_sn_t3.component AS component
    FROM
      logica_test.Contains_sn_t3 AS Contains_sn_t3
   UNION ALL
  
    SELECT
      Contains_sn_t4.part AS part,
      Contains_sn_t4.component AS component
    FROM
      logica_test.Contains_sn_t4 AS Contains_sn_t4
   UNION ALL
  
    SELECT
      Contains_sn_t5.part AS part,
      Contains_sn_t5.component AS component
    FROM
      logica_test.Contains_sn_t5 AS Contains_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Contains_sn_full

DROP TABLE IF EXISTS logica_test.Contains_sn_new;
CREATE TABLE logica_test.Contains_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Contains_sn_delta.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_delta AS Contains_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = Contains_sn_delta.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_step AS (SELECT
  Contains_MultBodyAggAux_f8.part AS part,
  Contains_MultBodyAggAux_f8.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f8 AS Contains_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Contains_sn_step.part AS part,
  Contains_sn_step.component AS component
FROM
  t_0_Contains_sn_step AS Contains_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Contains_sn_full AS Contains_sn_full
  WHERE
    (Contains_sn_full.part = Contains_sn_step.part) AND
    (Contains_sn_full.component = Contains_sn_step.component)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Contains_sn_full SELECT * FROM logica_test.Contains_sn_new;

DROP TABLE IF EXISTS logica_test.Contains_sn_delta;
CREATE TABLE logica_test.Contains_sn_delta AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Contains_sn_new.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_new AS Contains_sn_new, t_2_Uses AS Uses
    WHERE
      (Uses.part = Contains_sn_new.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_back_step AS (SELECT
  Contains_MultBodyAggAux_f1.part AS part,
  Contains_MultBodyAggAux_f1.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f1 AS Contains_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Contains_sn_back_step.part AS part,
  Contains_sn_back_step.component AS component
FROM
  t_0_Contains_sn_back_step AS Contains_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Contains_sn_full AS Contains_sn_full
  WHERE
    (Contains_sn_full.part = Contains_sn_back_step.part) AND
    (Contains_sn_full.component = Contains_sn_back_step.component)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Contains_sn_full SELECT * FROM logica_test.Contains_sn_delta;

DROP TABLE IF EXISTS logica_test.Contains_sn_new;
CREATE TABLE logica_test.Contains_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Contains_sn_delta.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_delta AS Contains_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = Contains_sn_delta.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_step AS (SELECT
  Contains_MultBodyAggAux_f8.part AS part,
  Contains_MultBodyAggAux_f8.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f8 AS Contains_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Contains_sn_step.part AS part,
  Contains_sn_step.component AS component
FROM
  t_0_Contains_sn_step AS Contains_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Contains_sn_full AS Contains_sn_full
  WHERE
    (Contains_sn_full.part = Contains_sn_step.part) AND
    (Contains_sn_full.component = Contains_sn_step.component)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Contains_sn_full SELECT * FROM logica_test.Contains_sn_new;

DROP TABLE IF EXISTS logica_test.Contains_sn_delta;
CREATE TABLE logica_test.Contains_sn_delta AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Contains_sn_new.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_new AS Contains_sn_new, t_2_Uses AS Uses
    WHERE
      (Uses.part = Contains_sn_new.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_back_step AS (SELECT
  Contains_MultBodyAggAux_f1.part AS part,
  Contains_MultBodyAggAux_f1.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f1 AS Contains_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Contains_sn_back_step.part AS part,
  Contains_sn_back_step.component AS component
FROM
  t_0_Contains_sn_back_step AS Contains_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Contains_sn_full AS Contains_sn_full
  WHERE
    (Contains_sn_full.part = Contains_sn_back_step.part) AND
    (Contains_sn_full.component = Contains_sn_back_step.component)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Contains_sn_full SELECT * FROM logica_test.Contains_sn_delta;

DROP TABLE IF EXISTS logica_test.Contains_sn_new;
CREATE TABLE logica_test.Contains_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Contains_sn_delta.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_delta AS Contains_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = Contains_sn_delta.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_step AS (SELECT
  Contains_MultBodyAggAux_f8.part AS part,
  Contains_MultBodyAggAux_f8.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f8 AS Contains_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Contains_sn_step.part AS part,
  Contains_sn_step.component AS component
FROM
  t_0_Contains_sn_step AS Contains_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Contains_sn_full AS Contains_sn_full
  WHERE
    (Contains_sn_full.part = Contains_sn_step.part) AND
    (Contains_sn_full.component = Contains_sn_step.component)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Contains_sn_full SELECT * FROM logica_test.Contains_sn_new;

DROP TABLE IF EXISTS logica_test.Contains_sn_delta;
CREATE TABLE logica_test.Contains_sn_delta AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Contains_sn_new.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_new AS Contains_sn_new, t_2_Uses AS Uses
    WHERE
      (Uses.part = Contains_sn_new.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_back_step AS (SELECT
  Contains_MultBodyAggAux_f1.part AS part,
  Contains_MultBodyAggAux_f1.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f1 AS Contains_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Contains_sn_back_step.part AS part,
  Contains_sn_back_step.component AS component
FROM
  t_0_Contains_sn_back_step AS Contains_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Contains_sn_full AS Contains_sn_full
  WHERE
    (Contains_sn_full.part = Contains_sn_back_step.part) AND
    (Contains_sn_full.component = Contains_sn_back_step.component)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Contains_sn_full SELECT * FROM logica_test.Contains_sn_delta;

WITH t_1_Supplies AS (SELECT * FROM (
  
    SELECT
      'rim' AS component,
      'acme' AS supplier
   UNION ALL
  
    SELECT
      'spoke' AS component,
      'acme' AS supplier
   UNION ALL
  
    SELECT
      'bearing' AS component,
      'bolt' AS supplier
   UNION ALL
  
    SELECT
      'tube' AS component,
      'steelco' AS supplier
   UNION ALL
  
    SELECT
      'deck' AS component,
      'steelco' AS supplier
   UNION ALL
  
    SELECT
      'hub' AS component,
      'bolt' AS supplier
  
) AS UNUSED_TABLE_NAME  ),
t_0_S_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Supplies.supplier AS supplier
    FROM
      logica_test.Contains_sn_full AS Contains_sn_full, t_1_Supplies AS Supplies
    WHERE
      ('hub' = Contains_sn_full.part) AND
      (Supplies.component = Contains_sn_full.component)
   UNION ALL
  
    SELECT
      t_2_Supplies.supplier AS supplier
    FROM
      t_1_Supplies AS t_2_Supplies
    WHERE
      (t_2_Supplies.component = 'hub')
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S_MultBodyAggAux.supplier AS supplier
FROM
  t_0_S_MultBodyAggAux AS S_MultBodyAggAux
GROUP BY 1 ORDER BY supplier;