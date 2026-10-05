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
t_0_Contains_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      t_1_Uses.part AS part,
      t_1_Uses.component AS component
    FROM
      t_2_Uses AS t_1_Uses
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Contains_MultBodyAggAux_f1.part AS part,
  Contains_MultBodyAggAux_f1.component AS component
FROM
  t_0_Contains_MultBodyAggAux_f1 AS Contains_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Contains_sn_delta

DROP TABLE IF EXISTS logica_test.Contains_sn_full;
CREATE TABLE logica_test.Contains_sn_full AS WITH t_2_Uses AS (SELECT * FROM (
  
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
t_1_Contains_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Contains_sn_delta.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_delta AS t_2_Contains_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Contains_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_step AS (SELECT
  Contains_MultBodyAggAux_f2.part AS part,
  Contains_MultBodyAggAux_f2.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f2 AS Contains_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Contains_sn_delta.part AS part,
      Contains_sn_delta.component AS component
    FROM
      logica_test.Contains_sn_delta AS Contains_sn_delta
   UNION ALL
  
    SELECT
      Contains_sn_step.part AS part,
      Contains_sn_step.component AS component
    FROM
      t_0_Contains_sn_step AS Contains_sn_step
    WHERE
      (1 = 0)
  
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
t_1_Contains_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Contains_sn_delta.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_delta AS t_2_Contains_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Contains_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_step AS (SELECT
  Contains_MultBodyAggAux_f2.part AS part,
  Contains_MultBodyAggAux_f2.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f2 AS Contains_MultBodyAggAux_f2
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
CREATE TABLE logica_test.Contains_sn_delta AS SELECT
  Contains_sn_new.part AS part,
  Contains_sn_new.component AS component
FROM
  logica_test.Contains_sn_new AS Contains_sn_new;

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
t_1_Contains_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Contains_sn_delta.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_delta AS t_2_Contains_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Contains_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_step AS (SELECT
  Contains_MultBodyAggAux_f2.part AS part,
  Contains_MultBodyAggAux_f2.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f2 AS Contains_MultBodyAggAux_f2
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
CREATE TABLE logica_test.Contains_sn_delta AS SELECT
  Contains_sn_new.part AS part,
  Contains_sn_new.component AS component
FROM
  logica_test.Contains_sn_new AS Contains_sn_new;

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
t_1_Contains_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Contains_sn_delta.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_delta AS t_2_Contains_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Contains_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_step AS (SELECT
  Contains_MultBodyAggAux_f2.part AS part,
  Contains_MultBodyAggAux_f2.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f2 AS Contains_MultBodyAggAux_f2
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
CREATE TABLE logica_test.Contains_sn_delta AS SELECT
  Contains_sn_new.part AS part,
  Contains_sn_new.component AS component
FROM
  logica_test.Contains_sn_new AS Contains_sn_new;

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
t_1_Contains_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Contains_sn_delta.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_delta AS t_2_Contains_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Contains_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_step AS (SELECT
  Contains_MultBodyAggAux_f2.part AS part,
  Contains_MultBodyAggAux_f2.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f2 AS Contains_MultBodyAggAux_f2
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
CREATE TABLE logica_test.Contains_sn_delta AS SELECT
  Contains_sn_new.part AS part,
  Contains_sn_new.component AS component
FROM
  logica_test.Contains_sn_new AS Contains_sn_new;

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
t_1_Contains_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Contains_sn_delta.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_delta AS t_2_Contains_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Contains_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_step AS (SELECT
  Contains_MultBodyAggAux_f2.part AS part,
  Contains_MultBodyAggAux_f2.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f2 AS Contains_MultBodyAggAux_f2
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
CREATE TABLE logica_test.Contains_sn_delta AS SELECT
  Contains_sn_new.part AS part,
  Contains_sn_new.component AS component
FROM
  logica_test.Contains_sn_new AS Contains_sn_new;

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
t_1_Contains_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Contains_sn_delta.part AS part,
      Uses.component AS component
    FROM
      logica_test.Contains_sn_delta AS t_2_Contains_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Contains_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains_sn_step AS (SELECT
  Contains_MultBodyAggAux_f2.part AS part,
  Contains_MultBodyAggAux_f2.component AS component
FROM
  t_1_Contains_MultBodyAggAux_f2 AS Contains_MultBodyAggAux_f2
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
CREATE TABLE logica_test.Contains_sn_delta AS SELECT
  Contains_sn_new.part AS part,
  Contains_sn_new.component AS component
FROM
  logica_test.Contains_sn_new AS Contains_sn_new;

SELECT
  Contains_sn_full.component AS component
FROM
  logica_test.Contains_sn_full AS Contains_sn_full
WHERE
  ('tube' = Contains_sn_full.part)
GROUP BY 1 ORDER BY component;