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
CREATE TABLE logica_test.Contains_sn_t1 AS WITH t_2_Uses AS (SELECT * FROM VALUES
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
CREATE TABLE logica_test.Contains_sn_t2 AS WITH t_2_Uses AS (SELECT * FROM VALUES
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
CREATE TABLE logica_test.Contains_sn_t3 AS WITH t_2_Uses AS (SELECT * FROM VALUES
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
CREATE TABLE logica_test.Contains_sn_t4 AS WITH t_2_Uses AS (SELECT * FROM VALUES
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
CREATE TABLE logica_test.Contains_sn_t5 AS WITH t_2_Uses AS (SELECT * FROM VALUES
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

WITH t_0_Product AS (SELECT * FROM VALUES
  ("bike"),
  ("scooter")
AS UNUSED_TABLE_NAME(part))
SELECT
  Product.part AS part
FROM
  t_0_Product AS Product, logica_test.Contains_sn_full AS Contains_sn_full
WHERE
  (Product.part = Contains_sn_full.part) AND
  ("bearing" = Contains_sn_full.component)
GROUP BY 1 ORDER BY part NULLS LAST;