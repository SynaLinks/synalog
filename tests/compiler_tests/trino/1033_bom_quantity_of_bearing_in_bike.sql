DROP TABLE IF EXISTS logica_test.Need_sn_delta;
CREATE TABLE logica_test.Need_sn_delta AS WITH t_2_Uses AS (SELECT * FROM (
  
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
t_0_Need_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      t_1_Uses.part AS part,
      t_1_Uses.component AS component,
      t_1_Uses.component AS path_id,
      t_1_Uses.qty AS n
    FROM
      t_2_Uses AS t_1_Uses
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Need_MultBodyAggAux_f1.part AS part,
  Need_MultBodyAggAux_f1.component AS component,
  Need_MultBodyAggAux_f1.path_id AS path_id,
  Need_MultBodyAggAux_f1.n AS n
FROM
  t_0_Need_MultBodyAggAux_f1 AS Need_MultBodyAggAux_f1
GROUP BY 1, 2, 3, 4;

-- Interacting with table logica_test.Need_sn_delta

DROP TABLE IF EXISTS logica_test.Need_sn_full;
CREATE TABLE logica_test.Need_sn_full AS WITH t_2_Uses AS (SELECT * FROM (
  
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
t_1_Need_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Need_sn_delta.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(t_2_Need_sn_delta.path_id, '/')), Uses.component)) AS path_id,
      ((t_2_Need_sn_delta.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_delta AS t_2_Need_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Need_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component,
      t_3_Uses.component AS path_id,
      t_3_Uses.qty AS n
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_step AS (SELECT
  Need_MultBodyAggAux_f2.part AS part,
  Need_MultBodyAggAux_f2.component AS component,
  Need_MultBodyAggAux_f2.path_id AS path_id,
  Need_MultBodyAggAux_f2.n AS n
FROM
  t_1_Need_MultBodyAggAux_f2 AS Need_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT * FROM (
  
    SELECT
      Need_sn_delta.part AS part,
      Need_sn_delta.component AS component,
      Need_sn_delta.path_id AS path_id,
      Need_sn_delta.n AS n
    FROM
      logica_test.Need_sn_delta AS Need_sn_delta
   UNION ALL
  
    SELECT
      Need_sn_step.part AS part,
      Need_sn_step.component AS component,
      Need_sn_step.path_id AS path_id,
      Need_sn_step.n AS n
    FROM
      t_0_Need_sn_step AS Need_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Need_sn_full

DROP TABLE IF EXISTS logica_test.Need_sn_new;
CREATE TABLE logica_test.Need_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
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
t_1_Need_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Need_sn_delta.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(t_2_Need_sn_delta.path_id, '/')), Uses.component)) AS path_id,
      ((t_2_Need_sn_delta.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_delta AS t_2_Need_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Need_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component,
      t_3_Uses.component AS path_id,
      t_3_Uses.qty AS n
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_step AS (SELECT
  Need_MultBodyAggAux_f2.part AS part,
  Need_MultBodyAggAux_f2.component AS component,
  Need_MultBodyAggAux_f2.path_id AS path_id,
  Need_MultBodyAggAux_f2.n AS n
FROM
  t_1_Need_MultBodyAggAux_f2 AS Need_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_step.part AS part,
  Need_sn_step.component AS component,
  Need_sn_step.path_id AS path_id,
  Need_sn_step.n AS n
FROM
  t_0_Need_sn_step AS Need_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_step.part) AND
    (Need_sn_full.component = Need_sn_step.component) AND
    (Need_sn_full.path_id = Need_sn_step.path_id) AND
    (Need_sn_full.n = Need_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_delta;
CREATE TABLE logica_test.Need_sn_delta AS SELECT
  Need_sn_new.part AS part,
  Need_sn_new.component AS component,
  Need_sn_new.path_id AS path_id,
  Need_sn_new.n AS n
FROM
  logica_test.Need_sn_new AS Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_new;
CREATE TABLE logica_test.Need_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
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
t_1_Need_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Need_sn_delta.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(t_2_Need_sn_delta.path_id, '/')), Uses.component)) AS path_id,
      ((t_2_Need_sn_delta.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_delta AS t_2_Need_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Need_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component,
      t_3_Uses.component AS path_id,
      t_3_Uses.qty AS n
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_step AS (SELECT
  Need_MultBodyAggAux_f2.part AS part,
  Need_MultBodyAggAux_f2.component AS component,
  Need_MultBodyAggAux_f2.path_id AS path_id,
  Need_MultBodyAggAux_f2.n AS n
FROM
  t_1_Need_MultBodyAggAux_f2 AS Need_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_step.part AS part,
  Need_sn_step.component AS component,
  Need_sn_step.path_id AS path_id,
  Need_sn_step.n AS n
FROM
  t_0_Need_sn_step AS Need_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_step.part) AND
    (Need_sn_full.component = Need_sn_step.component) AND
    (Need_sn_full.path_id = Need_sn_step.path_id) AND
    (Need_sn_full.n = Need_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_delta;
CREATE TABLE logica_test.Need_sn_delta AS SELECT
  Need_sn_new.part AS part,
  Need_sn_new.component AS component,
  Need_sn_new.path_id AS path_id,
  Need_sn_new.n AS n
FROM
  logica_test.Need_sn_new AS Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_new;
CREATE TABLE logica_test.Need_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
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
t_1_Need_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Need_sn_delta.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(t_2_Need_sn_delta.path_id, '/')), Uses.component)) AS path_id,
      ((t_2_Need_sn_delta.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_delta AS t_2_Need_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Need_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component,
      t_3_Uses.component AS path_id,
      t_3_Uses.qty AS n
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_step AS (SELECT
  Need_MultBodyAggAux_f2.part AS part,
  Need_MultBodyAggAux_f2.component AS component,
  Need_MultBodyAggAux_f2.path_id AS path_id,
  Need_MultBodyAggAux_f2.n AS n
FROM
  t_1_Need_MultBodyAggAux_f2 AS Need_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_step.part AS part,
  Need_sn_step.component AS component,
  Need_sn_step.path_id AS path_id,
  Need_sn_step.n AS n
FROM
  t_0_Need_sn_step AS Need_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_step.part) AND
    (Need_sn_full.component = Need_sn_step.component) AND
    (Need_sn_full.path_id = Need_sn_step.path_id) AND
    (Need_sn_full.n = Need_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_delta;
CREATE TABLE logica_test.Need_sn_delta AS SELECT
  Need_sn_new.part AS part,
  Need_sn_new.component AS component,
  Need_sn_new.path_id AS path_id,
  Need_sn_new.n AS n
FROM
  logica_test.Need_sn_new AS Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_new;
CREATE TABLE logica_test.Need_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
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
t_1_Need_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Need_sn_delta.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(t_2_Need_sn_delta.path_id, '/')), Uses.component)) AS path_id,
      ((t_2_Need_sn_delta.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_delta AS t_2_Need_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Need_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component,
      t_3_Uses.component AS path_id,
      t_3_Uses.qty AS n
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_step AS (SELECT
  Need_MultBodyAggAux_f2.part AS part,
  Need_MultBodyAggAux_f2.component AS component,
  Need_MultBodyAggAux_f2.path_id AS path_id,
  Need_MultBodyAggAux_f2.n AS n
FROM
  t_1_Need_MultBodyAggAux_f2 AS Need_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_step.part AS part,
  Need_sn_step.component AS component,
  Need_sn_step.path_id AS path_id,
  Need_sn_step.n AS n
FROM
  t_0_Need_sn_step AS Need_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_step.part) AND
    (Need_sn_full.component = Need_sn_step.component) AND
    (Need_sn_full.path_id = Need_sn_step.path_id) AND
    (Need_sn_full.n = Need_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_delta;
CREATE TABLE logica_test.Need_sn_delta AS SELECT
  Need_sn_new.part AS part,
  Need_sn_new.component AS component,
  Need_sn_new.path_id AS path_id,
  Need_sn_new.n AS n
FROM
  logica_test.Need_sn_new AS Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_new;
CREATE TABLE logica_test.Need_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
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
t_1_Need_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Need_sn_delta.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(t_2_Need_sn_delta.path_id, '/')), Uses.component)) AS path_id,
      ((t_2_Need_sn_delta.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_delta AS t_2_Need_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Need_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component,
      t_3_Uses.component AS path_id,
      t_3_Uses.qty AS n
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_step AS (SELECT
  Need_MultBodyAggAux_f2.part AS part,
  Need_MultBodyAggAux_f2.component AS component,
  Need_MultBodyAggAux_f2.path_id AS path_id,
  Need_MultBodyAggAux_f2.n AS n
FROM
  t_1_Need_MultBodyAggAux_f2 AS Need_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_step.part AS part,
  Need_sn_step.component AS component,
  Need_sn_step.path_id AS path_id,
  Need_sn_step.n AS n
FROM
  t_0_Need_sn_step AS Need_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_step.part) AND
    (Need_sn_full.component = Need_sn_step.component) AND
    (Need_sn_full.path_id = Need_sn_step.path_id) AND
    (Need_sn_full.n = Need_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_delta;
CREATE TABLE logica_test.Need_sn_delta AS SELECT
  Need_sn_new.part AS part,
  Need_sn_new.component AS component,
  Need_sn_new.path_id AS path_id,
  Need_sn_new.n AS n
FROM
  logica_test.Need_sn_new AS Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_new;
CREATE TABLE logica_test.Need_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
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
t_1_Need_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Need_sn_delta.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(t_2_Need_sn_delta.path_id, '/')), Uses.component)) AS path_id,
      ((t_2_Need_sn_delta.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_delta AS t_2_Need_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Need_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.part AS part,
      t_3_Uses.component AS component,
      t_3_Uses.component AS path_id,
      t_3_Uses.qty AS n
    FROM
      t_2_Uses AS t_3_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_step AS (SELECT
  Need_MultBodyAggAux_f2.part AS part,
  Need_MultBodyAggAux_f2.component AS component,
  Need_MultBodyAggAux_f2.path_id AS path_id,
  Need_MultBodyAggAux_f2.n AS n
FROM
  t_1_Need_MultBodyAggAux_f2 AS Need_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_step.part AS part,
  Need_sn_step.component AS component,
  Need_sn_step.path_id AS path_id,
  Need_sn_step.n AS n
FROM
  t_0_Need_sn_step AS Need_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_step.part) AND
    (Need_sn_full.component = Need_sn_step.component) AND
    (Need_sn_full.path_id = Need_sn_step.path_id) AND
    (Need_sn_full.n = Need_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_delta;
CREATE TABLE logica_test.Need_sn_delta AS SELECT
  Need_sn_new.part AS part,
  Need_sn_new.component AS component,
  Need_sn_new.path_id AS path_id,
  Need_sn_new.n AS n
FROM
  logica_test.Need_sn_new AS Need_sn_new;

SELECT
  SUM(Need_sn_full.n) AS q
FROM
  logica_test.Need_sn_full AS Need_sn_full
WHERE
  ('bike' = Need_sn_full.part) AND
  ('bearing' = Need_sn_full.component);