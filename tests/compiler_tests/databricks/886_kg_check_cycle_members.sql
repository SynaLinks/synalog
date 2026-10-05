DROP TABLE IF EXISTS logica_test.Anc_sn_delta;
CREATE TABLE logica_test.Anc_sn_delta AS WITH t_2_ParentOf AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4)
AS UNUSED_TABLE_NAME(parent_id, child_id)),
t_0_Anc_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      t_1_ParentOf.parent_id AS a,
      t_1_ParentOf.child_id AS d
    FROM
      t_2_ParentOf AS t_1_ParentOf
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Anc_MultBodyAggAux_f1.a AS a,
  Anc_MultBodyAggAux_f1.d AS d
FROM
  t_0_Anc_MultBodyAggAux_f1 AS Anc_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Anc_sn_delta

DROP TABLE IF EXISTS logica_test.Anc_sn_full;
CREATE TABLE logica_test.Anc_sn_full AS WITH t_2_ParentOf AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4)
AS UNUSED_TABLE_NAME(parent_id, child_id)),
t_1_Anc_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      logica_test.Anc_sn_delta AS t_2_Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = t_2_Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_3_ParentOf.parent_id AS a,
      t_3_ParentOf.child_id AS d
    FROM
      t_2_ParentOf AS t_3_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f2.a AS a,
  Anc_MultBodyAggAux_f2.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f2 AS Anc_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Anc_sn_delta.a AS a,
      Anc_sn_delta.d AS d
    FROM
      logica_test.Anc_sn_delta AS Anc_sn_delta
   UNION ALL
  
    SELECT
      Anc_sn_step.a AS a,
      Anc_sn_step.d AS d
    FROM
      t_0_Anc_sn_step AS Anc_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Anc_sn_full

DROP TABLE IF EXISTS logica_test.Anc_sn_new;
CREATE TABLE logica_test.Anc_sn_new AS WITH t_2_ParentOf AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4)
AS UNUSED_TABLE_NAME(parent_id, child_id)),
t_1_Anc_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      logica_test.Anc_sn_delta AS t_2_Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = t_2_Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_3_ParentOf.parent_id AS a,
      t_3_ParentOf.child_id AS d
    FROM
      t_2_ParentOf AS t_3_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f2.a AS a,
  Anc_MultBodyAggAux_f2.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f2 AS Anc_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Anc_sn_full AS Anc_sn_full
  WHERE
    (Anc_sn_full.a = Anc_sn_step.a) AND
    (Anc_sn_full.d = Anc_sn_step.d)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Anc_sn_full SELECT * FROM logica_test.Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_delta;
CREATE TABLE logica_test.Anc_sn_delta AS SELECT
  Anc_sn_new.a AS a,
  Anc_sn_new.d AS d
FROM
  logica_test.Anc_sn_new AS Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_new;
CREATE TABLE logica_test.Anc_sn_new AS WITH t_2_ParentOf AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4)
AS UNUSED_TABLE_NAME(parent_id, child_id)),
t_1_Anc_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      logica_test.Anc_sn_delta AS t_2_Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = t_2_Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_3_ParentOf.parent_id AS a,
      t_3_ParentOf.child_id AS d
    FROM
      t_2_ParentOf AS t_3_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f2.a AS a,
  Anc_MultBodyAggAux_f2.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f2 AS Anc_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Anc_sn_full AS Anc_sn_full
  WHERE
    (Anc_sn_full.a = Anc_sn_step.a) AND
    (Anc_sn_full.d = Anc_sn_step.d)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Anc_sn_full SELECT * FROM logica_test.Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_delta;
CREATE TABLE logica_test.Anc_sn_delta AS SELECT
  Anc_sn_new.a AS a,
  Anc_sn_new.d AS d
FROM
  logica_test.Anc_sn_new AS Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_new;
CREATE TABLE logica_test.Anc_sn_new AS WITH t_2_ParentOf AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4)
AS UNUSED_TABLE_NAME(parent_id, child_id)),
t_1_Anc_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      logica_test.Anc_sn_delta AS t_2_Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = t_2_Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_3_ParentOf.parent_id AS a,
      t_3_ParentOf.child_id AS d
    FROM
      t_2_ParentOf AS t_3_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f2.a AS a,
  Anc_MultBodyAggAux_f2.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f2 AS Anc_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Anc_sn_full AS Anc_sn_full
  WHERE
    (Anc_sn_full.a = Anc_sn_step.a) AND
    (Anc_sn_full.d = Anc_sn_step.d)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Anc_sn_full SELECT * FROM logica_test.Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_delta;
CREATE TABLE logica_test.Anc_sn_delta AS SELECT
  Anc_sn_new.a AS a,
  Anc_sn_new.d AS d
FROM
  logica_test.Anc_sn_new AS Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_new;
CREATE TABLE logica_test.Anc_sn_new AS WITH t_2_ParentOf AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4)
AS UNUSED_TABLE_NAME(parent_id, child_id)),
t_1_Anc_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      logica_test.Anc_sn_delta AS t_2_Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = t_2_Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_3_ParentOf.parent_id AS a,
      t_3_ParentOf.child_id AS d
    FROM
      t_2_ParentOf AS t_3_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f2.a AS a,
  Anc_MultBodyAggAux_f2.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f2 AS Anc_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Anc_sn_full AS Anc_sn_full
  WHERE
    (Anc_sn_full.a = Anc_sn_step.a) AND
    (Anc_sn_full.d = Anc_sn_step.d)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Anc_sn_full SELECT * FROM logica_test.Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_delta;
CREATE TABLE logica_test.Anc_sn_delta AS SELECT
  Anc_sn_new.a AS a,
  Anc_sn_new.d AS d
FROM
  logica_test.Anc_sn_new AS Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_new;
CREATE TABLE logica_test.Anc_sn_new AS WITH t_2_ParentOf AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4)
AS UNUSED_TABLE_NAME(parent_id, child_id)),
t_1_Anc_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      logica_test.Anc_sn_delta AS t_2_Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = t_2_Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_3_ParentOf.parent_id AS a,
      t_3_ParentOf.child_id AS d
    FROM
      t_2_ParentOf AS t_3_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f2.a AS a,
  Anc_MultBodyAggAux_f2.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f2 AS Anc_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Anc_sn_full AS Anc_sn_full
  WHERE
    (Anc_sn_full.a = Anc_sn_step.a) AND
    (Anc_sn_full.d = Anc_sn_step.d)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Anc_sn_full SELECT * FROM logica_test.Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_delta;
CREATE TABLE logica_test.Anc_sn_delta AS SELECT
  Anc_sn_new.a AS a,
  Anc_sn_new.d AS d
FROM
  logica_test.Anc_sn_new AS Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_new;
CREATE TABLE logica_test.Anc_sn_new AS WITH t_2_ParentOf AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4)
AS UNUSED_TABLE_NAME(parent_id, child_id)),
t_1_Anc_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      logica_test.Anc_sn_delta AS t_2_Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = t_2_Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_3_ParentOf.parent_id AS a,
      t_3_ParentOf.child_id AS d
    FROM
      t_2_ParentOf AS t_3_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f2.a AS a,
  Anc_MultBodyAggAux_f2.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f2 AS Anc_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Anc_sn_full AS Anc_sn_full
  WHERE
    (Anc_sn_full.a = Anc_sn_step.a) AND
    (Anc_sn_full.d = Anc_sn_step.d)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Anc_sn_full SELECT * FROM logica_test.Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_delta;
CREATE TABLE logica_test.Anc_sn_delta AS SELECT
  Anc_sn_new.a AS a,
  Anc_sn_new.d AS d
FROM
  logica_test.Anc_sn_new AS Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_new;
CREATE TABLE logica_test.Anc_sn_new AS WITH t_2_ParentOf AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4)
AS UNUSED_TABLE_NAME(parent_id, child_id)),
t_1_Anc_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      logica_test.Anc_sn_delta AS t_2_Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = t_2_Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_3_ParentOf.parent_id AS a,
      t_3_ParentOf.child_id AS d
    FROM
      t_2_ParentOf AS t_3_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f2.a AS a,
  Anc_MultBodyAggAux_f2.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f2 AS Anc_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Anc_sn_full AS Anc_sn_full
  WHERE
    (Anc_sn_full.a = Anc_sn_step.a) AND
    (Anc_sn_full.d = Anc_sn_step.d)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Anc_sn_full SELECT * FROM logica_test.Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_delta;
CREATE TABLE logica_test.Anc_sn_delta AS SELECT
  Anc_sn_new.a AS a,
  Anc_sn_new.d AS d
FROM
  logica_test.Anc_sn_new AS Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_new;
CREATE TABLE logica_test.Anc_sn_new AS WITH t_2_ParentOf AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 4)
AS UNUSED_TABLE_NAME(parent_id, child_id)),
t_1_Anc_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Anc_sn_delta.a AS a,
      ParentOf.child_id AS d
    FROM
      logica_test.Anc_sn_delta AS t_2_Anc_sn_delta, t_2_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = t_2_Anc_sn_delta.d)
   UNION ALL
  
    SELECT
      t_3_ParentOf.parent_id AS a,
      t_3_ParentOf.child_id AS d
    FROM
      t_2_ParentOf AS t_3_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc_sn_step AS (SELECT
  Anc_MultBodyAggAux_f2.a AS a,
  Anc_MultBodyAggAux_f2.d AS d
FROM
  t_1_Anc_MultBodyAggAux_f2 AS Anc_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Anc_sn_step.a AS a,
  Anc_sn_step.d AS d
FROM
  t_0_Anc_sn_step AS Anc_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Anc_sn_full AS Anc_sn_full
  WHERE
    (Anc_sn_full.a = Anc_sn_step.a) AND
    (Anc_sn_full.d = Anc_sn_step.d)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Anc_sn_full SELECT * FROM logica_test.Anc_sn_new;

DROP TABLE IF EXISTS logica_test.Anc_sn_delta;
CREATE TABLE logica_test.Anc_sn_delta AS SELECT
  Anc_sn_new.a AS a,
  Anc_sn_new.d AS d
FROM
  logica_test.Anc_sn_new AS Anc_sn_new;

SELECT
  Anc_sn_full.a AS n
FROM
  logica_test.Anc_sn_full AS Anc_sn_full
WHERE
  (Anc_sn_full.d = Anc_sn_full.a)
GROUP BY 1 ORDER BY n NULLS LAST;