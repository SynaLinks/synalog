DROP TABLE IF EXISTS logica_test.Contains_sn_delta;
CREATE TABLE logica_test.Contains_sn_delta AS WITH t_2_Uses AS (SELECT * FROM VALUES
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
CREATE TABLE logica_test.Contains_sn_full AS WITH t_2_Uses AS (SELECT * FROM VALUES
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
CREATE TABLE logica_test.Contains_sn_new AS WITH t_2_Uses AS (SELECT * FROM VALUES
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
CREATE TABLE logica_test.Contains_sn_new AS WITH t_2_Uses AS (SELECT * FROM VALUES
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
CREATE TABLE logica_test.Contains_sn_new AS WITH t_2_Uses AS (SELECT * FROM VALUES
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
CREATE TABLE logica_test.Contains_sn_new AS WITH t_2_Uses AS (SELECT * FROM VALUES
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
CREATE TABLE logica_test.Contains_sn_new AS WITH t_2_Uses AS (SELECT * FROM VALUES
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
CREATE TABLE logica_test.Contains_sn_new AS WITH t_2_Uses AS (SELECT * FROM VALUES
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

WITH t_1_Supplies AS (SELECT * FROM VALUES
  ("rim", "acme"),
  ("spoke", "acme"),
  ("bearing", "bolt"),
  ("tube", "steelco"),
  ("deck", "steelco"),
  ("hub", "bolt")
AS UNUSED_TABLE_NAME(component, supplier)),
t_0_S_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Supplies.supplier AS supplier
    FROM
      logica_test.Contains_sn_full AS Contains_sn_full, t_1_Supplies AS Supplies
    WHERE
      ("scooter" = Contains_sn_full.part) AND
      (Supplies.component = Contains_sn_full.component)
   UNION ALL
  
    SELECT
      t_2_Supplies.supplier AS supplier
    FROM
      t_1_Supplies AS t_2_Supplies
    WHERE
      (t_2_Supplies.component = "scooter")
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S_MultBodyAggAux.supplier AS supplier
FROM
  t_0_S_MultBodyAggAux AS S_MultBodyAggAux
GROUP BY 1 ORDER BY supplier NULLS LAST;