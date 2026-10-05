DROP TABLE IF EXISTS logica_test.Shares;
CREATE TABLE logica_test.Shares AS WITH t_1_HasPhone AS (SELECT * FROM (
  
    SELECT
      'a1' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a3' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a4' AS account,
      '555-3' AS phone
   UNION ALL
  
    SELECT
      'a5' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a6' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a7' AS account,
      '555-9' AS phone
  
) AS UNUSED_TABLE_NAME  )
SELECT
  HasPhone.account AS a,
  t_0_HasPhone.account AS b
FROM
  t_1_HasPhone AS HasPhone, t_1_HasPhone AS t_0_HasPhone
WHERE
  (HasPhone.account != t_0_HasPhone.account) AND
  (t_0_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2;

-- Interacting with table logica_test.Shares

DROP TABLE IF EXISTS logica_test.Linked_sn_delta;
CREATE TABLE logica_test.Linked_sn_delta AS WITH t_0_Linked_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      logica_test.Shares AS Shares
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Linked_MultBodyAggAux_f1.a AS a,
  Linked_MultBodyAggAux_f1.b AS b
FROM
  t_0_Linked_MultBodyAggAux_f1 AS Linked_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Linked_sn_delta

DROP TABLE IF EXISTS logica_test.Linked_sn_full;
CREATE TABLE logica_test.Linked_sn_full AS WITH t_1_Linked_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      logica_test.Shares AS Shares
   UNION ALL
  
    SELECT
      t_2_Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS t_2_Linked_sn_delta, logica_test.Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = t_2_Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f2.a AS a,
  Linked_MultBodyAggAux_f2.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f2 AS Linked_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Linked_sn_delta.a AS a,
      Linked_sn_delta.b AS b
    FROM
      logica_test.Linked_sn_delta AS Linked_sn_delta
   UNION ALL
  
    SELECT
      Linked_sn_step.a AS a,
      Linked_sn_step.b AS b
    FROM
      t_0_Linked_sn_step AS Linked_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Linked_sn_full

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_1_Linked_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      logica_test.Shares AS Shares
   UNION ALL
  
    SELECT
      t_2_Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS t_2_Linked_sn_delta, logica_test.Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = t_2_Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f2.a AS a,
  Linked_MultBodyAggAux_f2.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f2 AS Linked_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Linked_sn_step.a AS a,
  Linked_sn_step.b AS b
FROM
  t_0_Linked_sn_step AS Linked_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_step.a) AND
    (Linked_sn_full.b = Linked_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_delta;
CREATE TABLE logica_test.Linked_sn_delta AS SELECT
  Linked_sn_new.a AS a,
  Linked_sn_new.b AS b
FROM
  logica_test.Linked_sn_new AS Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_1_Linked_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      logica_test.Shares AS Shares
   UNION ALL
  
    SELECT
      t_2_Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS t_2_Linked_sn_delta, logica_test.Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = t_2_Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f2.a AS a,
  Linked_MultBodyAggAux_f2.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f2 AS Linked_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Linked_sn_step.a AS a,
  Linked_sn_step.b AS b
FROM
  t_0_Linked_sn_step AS Linked_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_step.a) AND
    (Linked_sn_full.b = Linked_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_delta;
CREATE TABLE logica_test.Linked_sn_delta AS SELECT
  Linked_sn_new.a AS a,
  Linked_sn_new.b AS b
FROM
  logica_test.Linked_sn_new AS Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_1_Linked_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      logica_test.Shares AS Shares
   UNION ALL
  
    SELECT
      t_2_Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS t_2_Linked_sn_delta, logica_test.Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = t_2_Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f2.a AS a,
  Linked_MultBodyAggAux_f2.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f2 AS Linked_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Linked_sn_step.a AS a,
  Linked_sn_step.b AS b
FROM
  t_0_Linked_sn_step AS Linked_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_step.a) AND
    (Linked_sn_full.b = Linked_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_delta;
CREATE TABLE logica_test.Linked_sn_delta AS SELECT
  Linked_sn_new.a AS a,
  Linked_sn_new.b AS b
FROM
  logica_test.Linked_sn_new AS Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_1_Linked_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      logica_test.Shares AS Shares
   UNION ALL
  
    SELECT
      t_2_Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS t_2_Linked_sn_delta, logica_test.Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = t_2_Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f2.a AS a,
  Linked_MultBodyAggAux_f2.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f2 AS Linked_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Linked_sn_step.a AS a,
  Linked_sn_step.b AS b
FROM
  t_0_Linked_sn_step AS Linked_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_step.a) AND
    (Linked_sn_full.b = Linked_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_delta;
CREATE TABLE logica_test.Linked_sn_delta AS SELECT
  Linked_sn_new.a AS a,
  Linked_sn_new.b AS b
FROM
  logica_test.Linked_sn_new AS Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_1_Linked_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      logica_test.Shares AS Shares
   UNION ALL
  
    SELECT
      t_2_Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS t_2_Linked_sn_delta, logica_test.Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = t_2_Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f2.a AS a,
  Linked_MultBodyAggAux_f2.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f2 AS Linked_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Linked_sn_step.a AS a,
  Linked_sn_step.b AS b
FROM
  t_0_Linked_sn_step AS Linked_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_step.a) AND
    (Linked_sn_full.b = Linked_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_delta;
CREATE TABLE logica_test.Linked_sn_delta AS SELECT
  Linked_sn_new.a AS a,
  Linked_sn_new.b AS b
FROM
  logica_test.Linked_sn_new AS Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_1_Linked_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      logica_test.Shares AS Shares
   UNION ALL
  
    SELECT
      t_2_Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS t_2_Linked_sn_delta, logica_test.Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = t_2_Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f2.a AS a,
  Linked_MultBodyAggAux_f2.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f2 AS Linked_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Linked_sn_step.a AS a,
  Linked_sn_step.b AS b
FROM
  t_0_Linked_sn_step AS Linked_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_step.a) AND
    (Linked_sn_full.b = Linked_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_delta;
CREATE TABLE logica_test.Linked_sn_delta AS SELECT
  Linked_sn_new.a AS a,
  Linked_sn_new.b AS b
FROM
  logica_test.Linked_sn_new AS Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_1_Linked_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      logica_test.Shares AS Shares
   UNION ALL
  
    SELECT
      t_2_Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS t_2_Linked_sn_delta, logica_test.Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = t_2_Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f2.a AS a,
  Linked_MultBodyAggAux_f2.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f2 AS Linked_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Linked_sn_step.a AS a,
  Linked_sn_step.b AS b
FROM
  t_0_Linked_sn_step AS Linked_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_step.a) AND
    (Linked_sn_full.b = Linked_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_delta;
CREATE TABLE logica_test.Linked_sn_delta AS SELECT
  Linked_sn_new.a AS a,
  Linked_sn_new.b AS b
FROM
  logica_test.Linked_sn_new AS Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_1_Linked_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      logica_test.Shares AS Shares
   UNION ALL
  
    SELECT
      t_2_Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS t_2_Linked_sn_delta, logica_test.Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = t_2_Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f2.a AS a,
  Linked_MultBodyAggAux_f2.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f2 AS Linked_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Linked_sn_step.a AS a,
  Linked_sn_step.b AS b
FROM
  t_0_Linked_sn_step AS Linked_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_step.a) AND
    (Linked_sn_full.b = Linked_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_new;

DROP TABLE IF EXISTS logica_test.Linked_sn_delta;
CREATE TABLE logica_test.Linked_sn_delta AS SELECT
  Linked_sn_new.a AS a,
  Linked_sn_new.b AS b
FROM
  logica_test.Linked_sn_new AS Linked_sn_new;

SELECT
  Linked_sn_full.b AS b
FROM
  logica_test.Linked_sn_full AS Linked_sn_full
WHERE
  (Linked_sn_full.b != 'a2') AND
  ('a2' = Linked_sn_full.a)
GROUP BY 1 ORDER BY b;