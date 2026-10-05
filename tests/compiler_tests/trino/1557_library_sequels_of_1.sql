DROP TABLE IF EXISTS logica_test.After_sn_delta;
CREATE TABLE logica_test.After_sn_delta AS WITH t_2_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_0_After_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      t_1_Sequel.book AS book,
      t_1_Sequel.next AS next
    FROM
      t_2_Sequel AS t_1_Sequel
  
) AS UNUSED_TABLE_NAME  )
SELECT
  After_MultBodyAggAux_f1.book AS book,
  After_MultBodyAggAux_f1.next AS next
FROM
  t_0_After_MultBodyAggAux_f1 AS After_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.After_sn_delta

DROP TABLE IF EXISTS logica_test.After_sn_full;
CREATE TABLE logica_test.After_sn_full AS WITH t_2_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_After_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_After_sn_delta.book AS book,
      Sequel.next AS next
    FROM
      logica_test.After_sn_delta AS t_2_After_sn_delta, t_2_Sequel AS Sequel
    WHERE
      (Sequel.book = t_2_After_sn_delta.next)
   UNION ALL
  
    SELECT
      t_3_Sequel.book AS book,
      t_3_Sequel.next AS next
    FROM
      t_2_Sequel AS t_3_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_0_After_sn_step AS (SELECT
  After_MultBodyAggAux_f2.book AS book,
  After_MultBodyAggAux_f2.next AS next
FROM
  t_1_After_MultBodyAggAux_f2 AS After_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      After_sn_delta.book AS book,
      After_sn_delta.next AS next
    FROM
      logica_test.After_sn_delta AS After_sn_delta
   UNION ALL
  
    SELECT
      After_sn_step.book AS book,
      After_sn_step.next AS next
    FROM
      t_0_After_sn_step AS After_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.After_sn_full

DROP TABLE IF EXISTS logica_test.After_sn_new;
CREATE TABLE logica_test.After_sn_new AS WITH t_2_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_After_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_After_sn_delta.book AS book,
      Sequel.next AS next
    FROM
      logica_test.After_sn_delta AS t_2_After_sn_delta, t_2_Sequel AS Sequel
    WHERE
      (Sequel.book = t_2_After_sn_delta.next)
   UNION ALL
  
    SELECT
      t_3_Sequel.book AS book,
      t_3_Sequel.next AS next
    FROM
      t_2_Sequel AS t_3_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_0_After_sn_step AS (SELECT
  After_MultBodyAggAux_f2.book AS book,
  After_MultBodyAggAux_f2.next AS next
FROM
  t_1_After_MultBodyAggAux_f2 AS After_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  After_sn_step.book AS book,
  After_sn_step.next AS next
FROM
  t_0_After_sn_step AS After_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.After_sn_full AS After_sn_full
  WHERE
    (After_sn_full.book = After_sn_step.book) AND
    (After_sn_full.next = After_sn_step.next)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.After_sn_full SELECT * FROM logica_test.After_sn_new;

DROP TABLE IF EXISTS logica_test.After_sn_delta;
CREATE TABLE logica_test.After_sn_delta AS SELECT
  After_sn_new.book AS book,
  After_sn_new.next AS next
FROM
  logica_test.After_sn_new AS After_sn_new;

DROP TABLE IF EXISTS logica_test.After_sn_new;
CREATE TABLE logica_test.After_sn_new AS WITH t_2_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_After_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_After_sn_delta.book AS book,
      Sequel.next AS next
    FROM
      logica_test.After_sn_delta AS t_2_After_sn_delta, t_2_Sequel AS Sequel
    WHERE
      (Sequel.book = t_2_After_sn_delta.next)
   UNION ALL
  
    SELECT
      t_3_Sequel.book AS book,
      t_3_Sequel.next AS next
    FROM
      t_2_Sequel AS t_3_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_0_After_sn_step AS (SELECT
  After_MultBodyAggAux_f2.book AS book,
  After_MultBodyAggAux_f2.next AS next
FROM
  t_1_After_MultBodyAggAux_f2 AS After_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  After_sn_step.book AS book,
  After_sn_step.next AS next
FROM
  t_0_After_sn_step AS After_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.After_sn_full AS After_sn_full
  WHERE
    (After_sn_full.book = After_sn_step.book) AND
    (After_sn_full.next = After_sn_step.next)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.After_sn_full SELECT * FROM logica_test.After_sn_new;

DROP TABLE IF EXISTS logica_test.After_sn_delta;
CREATE TABLE logica_test.After_sn_delta AS SELECT
  After_sn_new.book AS book,
  After_sn_new.next AS next
FROM
  logica_test.After_sn_new AS After_sn_new;

DROP TABLE IF EXISTS logica_test.After_sn_new;
CREATE TABLE logica_test.After_sn_new AS WITH t_2_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_After_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_After_sn_delta.book AS book,
      Sequel.next AS next
    FROM
      logica_test.After_sn_delta AS t_2_After_sn_delta, t_2_Sequel AS Sequel
    WHERE
      (Sequel.book = t_2_After_sn_delta.next)
   UNION ALL
  
    SELECT
      t_3_Sequel.book AS book,
      t_3_Sequel.next AS next
    FROM
      t_2_Sequel AS t_3_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_0_After_sn_step AS (SELECT
  After_MultBodyAggAux_f2.book AS book,
  After_MultBodyAggAux_f2.next AS next
FROM
  t_1_After_MultBodyAggAux_f2 AS After_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  After_sn_step.book AS book,
  After_sn_step.next AS next
FROM
  t_0_After_sn_step AS After_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.After_sn_full AS After_sn_full
  WHERE
    (After_sn_full.book = After_sn_step.book) AND
    (After_sn_full.next = After_sn_step.next)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.After_sn_full SELECT * FROM logica_test.After_sn_new;

DROP TABLE IF EXISTS logica_test.After_sn_delta;
CREATE TABLE logica_test.After_sn_delta AS SELECT
  After_sn_new.book AS book,
  After_sn_new.next AS next
FROM
  logica_test.After_sn_new AS After_sn_new;

DROP TABLE IF EXISTS logica_test.After_sn_new;
CREATE TABLE logica_test.After_sn_new AS WITH t_2_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_After_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_After_sn_delta.book AS book,
      Sequel.next AS next
    FROM
      logica_test.After_sn_delta AS t_2_After_sn_delta, t_2_Sequel AS Sequel
    WHERE
      (Sequel.book = t_2_After_sn_delta.next)
   UNION ALL
  
    SELECT
      t_3_Sequel.book AS book,
      t_3_Sequel.next AS next
    FROM
      t_2_Sequel AS t_3_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_0_After_sn_step AS (SELECT
  After_MultBodyAggAux_f2.book AS book,
  After_MultBodyAggAux_f2.next AS next
FROM
  t_1_After_MultBodyAggAux_f2 AS After_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  After_sn_step.book AS book,
  After_sn_step.next AS next
FROM
  t_0_After_sn_step AS After_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.After_sn_full AS After_sn_full
  WHERE
    (After_sn_full.book = After_sn_step.book) AND
    (After_sn_full.next = After_sn_step.next)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.After_sn_full SELECT * FROM logica_test.After_sn_new;

DROP TABLE IF EXISTS logica_test.After_sn_delta;
CREATE TABLE logica_test.After_sn_delta AS SELECT
  After_sn_new.book AS book,
  After_sn_new.next AS next
FROM
  logica_test.After_sn_new AS After_sn_new;

DROP TABLE IF EXISTS logica_test.After_sn_new;
CREATE TABLE logica_test.After_sn_new AS WITH t_2_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_After_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_After_sn_delta.book AS book,
      Sequel.next AS next
    FROM
      logica_test.After_sn_delta AS t_2_After_sn_delta, t_2_Sequel AS Sequel
    WHERE
      (Sequel.book = t_2_After_sn_delta.next)
   UNION ALL
  
    SELECT
      t_3_Sequel.book AS book,
      t_3_Sequel.next AS next
    FROM
      t_2_Sequel AS t_3_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_0_After_sn_step AS (SELECT
  After_MultBodyAggAux_f2.book AS book,
  After_MultBodyAggAux_f2.next AS next
FROM
  t_1_After_MultBodyAggAux_f2 AS After_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  After_sn_step.book AS book,
  After_sn_step.next AS next
FROM
  t_0_After_sn_step AS After_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.After_sn_full AS After_sn_full
  WHERE
    (After_sn_full.book = After_sn_step.book) AND
    (After_sn_full.next = After_sn_step.next)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.After_sn_full SELECT * FROM logica_test.After_sn_new;

DROP TABLE IF EXISTS logica_test.After_sn_delta;
CREATE TABLE logica_test.After_sn_delta AS SELECT
  After_sn_new.book AS book,
  After_sn_new.next AS next
FROM
  logica_test.After_sn_new AS After_sn_new;

DROP TABLE IF EXISTS logica_test.After_sn_new;
CREATE TABLE logica_test.After_sn_new AS WITH t_2_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_After_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_After_sn_delta.book AS book,
      Sequel.next AS next
    FROM
      logica_test.After_sn_delta AS t_2_After_sn_delta, t_2_Sequel AS Sequel
    WHERE
      (Sequel.book = t_2_After_sn_delta.next)
   UNION ALL
  
    SELECT
      t_3_Sequel.book AS book,
      t_3_Sequel.next AS next
    FROM
      t_2_Sequel AS t_3_Sequel
  
) AS UNUSED_TABLE_NAME  ),
t_0_After_sn_step AS (SELECT
  After_MultBodyAggAux_f2.book AS book,
  After_MultBodyAggAux_f2.next AS next
FROM
  t_1_After_MultBodyAggAux_f2 AS After_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  After_sn_step.book AS book,
  After_sn_step.next AS next
FROM
  t_0_After_sn_step AS After_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.After_sn_full AS After_sn_full
  WHERE
    (After_sn_full.book = After_sn_step.book) AND
    (After_sn_full.next = After_sn_step.next)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.After_sn_full SELECT * FROM logica_test.After_sn_new;

DROP TABLE IF EXISTS logica_test.After_sn_delta;
CREATE TABLE logica_test.After_sn_delta AS SELECT
  After_sn_new.book AS book,
  After_sn_new.next AS next
FROM
  logica_test.After_sn_new AS After_sn_new;

SELECT
  After_sn_full.next AS next
FROM
  logica_test.After_sn_full AS After_sn_full
WHERE
  (1 = After_sn_full.book) ORDER BY next;
