DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS WITH t_2_Uses AS (SELECT * FROM VALUES
  ("bike", "frame", 1),
  ("bike", "wheel", 2),
  ("wheel", "rim", 1),
  ("wheel", "spoke", 32),
  ("wheel", "hub", 1),
  ("hub", "bearing", 2),
  ("frame", "tube", 3),
  ("scooter", "wheel", 2),
  ("scooter", "deck", 1)
AS UNUSED_TABLE_NAME(part, component, qty)),
t_0_Down_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      t_1_Uses.component AS component
    FROM
      t_2_Uses AS t_1_Uses
    WHERE
      (t_1_Uses.part = "bike")
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Down_MultBodyAggAux_f1.component AS component
FROM
  t_0_Down_MultBodyAggAux_f1 AS Down_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.Down_sn_delta

DROP TABLE IF EXISTS logica_test.Down_sn_full;
CREATE TABLE logica_test.Down_sn_full AS WITH t_2_Uses AS (SELECT * FROM VALUES
  ("bike", "frame", 1),
  ("bike", "wheel", 2),
  ("wheel", "rim", 1),
  ("wheel", "spoke", 32),
  ("wheel", "hub", 1),
  ("hub", "bearing", 2),
  ("frame", "tube", 3),
  ("scooter", "wheel", 2),
  ("scooter", "deck", 1)
AS UNUSED_TABLE_NAME(part, component, qty)),
t_1_Down_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Uses.component AS component
    FROM
      logica_test.Down_sn_delta AS t_2_Down_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Down_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.component AS component
    FROM
      t_2_Uses AS t_3_Uses
    WHERE
      (t_3_Uses.part = "bike")
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f2.component AS component
FROM
  t_1_Down_MultBodyAggAux_f2 AS Down_MultBodyAggAux_f2
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      Down_sn_delta.component AS component
    FROM
      logica_test.Down_sn_delta AS Down_sn_delta
   UNION ALL
  
    SELECT
      Down_sn_step.component AS component
    FROM
      t_0_Down_sn_step AS Down_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Down_sn_full

DROP TABLE IF EXISTS logica_test.Down_sn_new;
CREATE TABLE logica_test.Down_sn_new AS WITH t_2_Uses AS (SELECT * FROM VALUES
  ("bike", "frame", 1),
  ("bike", "wheel", 2),
  ("wheel", "rim", 1),
  ("wheel", "spoke", 32),
  ("wheel", "hub", 1),
  ("hub", "bearing", 2),
  ("frame", "tube", 3),
  ("scooter", "wheel", 2),
  ("scooter", "deck", 1)
AS UNUSED_TABLE_NAME(part, component, qty)),
t_1_Down_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Uses.component AS component
    FROM
      logica_test.Down_sn_delta AS t_2_Down_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Down_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.component AS component
    FROM
      t_2_Uses AS t_3_Uses
    WHERE
      (t_3_Uses.part = "bike")
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f2.component AS component
FROM
  t_1_Down_MultBodyAggAux_f2 AS Down_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Down_sn_step.component AS component
FROM
  t_0_Down_sn_step AS Down_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.component = Down_sn_step.component)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS SELECT
  Down_sn_new.component AS component
FROM
  logica_test.Down_sn_new AS Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_new;
CREATE TABLE logica_test.Down_sn_new AS WITH t_2_Uses AS (SELECT * FROM VALUES
  ("bike", "frame", 1),
  ("bike", "wheel", 2),
  ("wheel", "rim", 1),
  ("wheel", "spoke", 32),
  ("wheel", "hub", 1),
  ("hub", "bearing", 2),
  ("frame", "tube", 3),
  ("scooter", "wheel", 2),
  ("scooter", "deck", 1)
AS UNUSED_TABLE_NAME(part, component, qty)),
t_1_Down_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Uses.component AS component
    FROM
      logica_test.Down_sn_delta AS t_2_Down_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = t_2_Down_sn_delta.component)
   UNION ALL
  
    SELECT
      t_3_Uses.component AS component
    FROM
      t_2_Uses AS t_3_Uses
    WHERE
      (t_3_Uses.part = "bike")
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f2.component AS component
FROM
  t_1_Down_MultBodyAggAux_f2 AS Down_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Down_sn_step.component AS component
FROM
  t_0_Down_sn_step AS Down_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.component = Down_sn_step.component)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS SELECT
  Down_sn_new.component AS component
FROM
  logica_test.Down_sn_new AS Down_sn_new;

SELECT
  Down_sn_full.component AS component
FROM
  logica_test.Down_sn_full AS Down_sn_full
GROUP BY 1 ORDER BY component NULLS LAST;