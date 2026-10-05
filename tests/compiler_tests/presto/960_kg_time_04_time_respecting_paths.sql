DROP TABLE IF EXISTS logica_test.ReachedBy_sn_delta;
CREATE TABLE logica_test.ReachedBy_sn_delta AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ReachedBy_MultBodyAggAux_f1.source AS source,
  ReachedBy_MultBodyAggAux_f1.target AS target,
  ReachedBy_MultBodyAggAux_f1.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f1.valid_to AS valid_to
FROM
  t_0_ReachedBy_MultBodyAggAux_f1 AS ReachedBy_MultBodyAggAux_f1
GROUP BY 1, 2, 3, 4;

-- Interacting with table logica_test.ReachedBy_sn_delta

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_full;
CREATE TABLE logica_test.ReachedBy_sn_full AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_1_ReachedBy_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      t_2_ReachedBy_sn_delta.source AS source,
      t_3_HandedOver.target AS target,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END AS valid_from,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS t_2_ReachedBy_sn_delta, t_1_HandedOver AS t_3_HandedOver
    WHERE
      (CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END < CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END) AND
      (t_3_HandedOver.source = t_2_ReachedBy_sn_delta.target)
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_sn_step AS (SELECT
  ReachedBy_MultBodyAggAux_f2.source AS source,
  ReachedBy_MultBodyAggAux_f2.target AS target,
  ReachedBy_MultBodyAggAux_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f2.valid_to AS valid_to
FROM
  t_1_ReachedBy_MultBodyAggAux_f2 AS ReachedBy_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT * FROM (
  
    SELECT
      ReachedBy_sn_delta.source AS source,
      ReachedBy_sn_delta.target AS target,
      ReachedBy_sn_delta.valid_from AS valid_from,
      ReachedBy_sn_delta.valid_to AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS ReachedBy_sn_delta
   UNION ALL
  
    SELECT
      ReachedBy_sn_step.source AS source,
      ReachedBy_sn_step.target AS target,
      ReachedBy_sn_step.valid_from AS valid_from,
      ReachedBy_sn_step.valid_to AS valid_to
    FROM
      t_0_ReachedBy_sn_step AS ReachedBy_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.ReachedBy_sn_full

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_new;
CREATE TABLE logica_test.ReachedBy_sn_new AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_1_ReachedBy_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      t_2_ReachedBy_sn_delta.source AS source,
      t_3_HandedOver.target AS target,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END AS valid_from,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS t_2_ReachedBy_sn_delta, t_1_HandedOver AS t_3_HandedOver
    WHERE
      (CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END < CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END) AND
      (t_3_HandedOver.source = t_2_ReachedBy_sn_delta.target)
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_sn_step AS (SELECT
  ReachedBy_MultBodyAggAux_f2.source AS source,
  ReachedBy_MultBodyAggAux_f2.target AS target,
  ReachedBy_MultBodyAggAux_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f2.valid_to AS valid_to
FROM
  t_1_ReachedBy_MultBodyAggAux_f2 AS ReachedBy_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  ReachedBy_sn_step.source AS source,
  ReachedBy_sn_step.target AS target,
  ReachedBy_sn_step.valid_from AS valid_from,
  ReachedBy_sn_step.valid_to AS valid_to
FROM
  t_0_ReachedBy_sn_step AS ReachedBy_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.ReachedBy_sn_full AS ReachedBy_sn_full
  WHERE
    (ReachedBy_sn_full.source = ReachedBy_sn_step.source) AND
    (ReachedBy_sn_full.target = ReachedBy_sn_step.target) AND
    (ReachedBy_sn_full.valid_from = ReachedBy_sn_step.valid_from) AND
    (ReachedBy_sn_full.valid_to = ReachedBy_sn_step.valid_to)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.ReachedBy_sn_full SELECT * FROM logica_test.ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_delta;
CREATE TABLE logica_test.ReachedBy_sn_delta AS SELECT
  ReachedBy_sn_new.source AS source,
  ReachedBy_sn_new.target AS target,
  ReachedBy_sn_new.valid_from AS valid_from,
  ReachedBy_sn_new.valid_to AS valid_to
FROM
  logica_test.ReachedBy_sn_new AS ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_new;
CREATE TABLE logica_test.ReachedBy_sn_new AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_1_ReachedBy_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      t_2_ReachedBy_sn_delta.source AS source,
      t_3_HandedOver.target AS target,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END AS valid_from,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS t_2_ReachedBy_sn_delta, t_1_HandedOver AS t_3_HandedOver
    WHERE
      (CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END < CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END) AND
      (t_3_HandedOver.source = t_2_ReachedBy_sn_delta.target)
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_sn_step AS (SELECT
  ReachedBy_MultBodyAggAux_f2.source AS source,
  ReachedBy_MultBodyAggAux_f2.target AS target,
  ReachedBy_MultBodyAggAux_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f2.valid_to AS valid_to
FROM
  t_1_ReachedBy_MultBodyAggAux_f2 AS ReachedBy_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  ReachedBy_sn_step.source AS source,
  ReachedBy_sn_step.target AS target,
  ReachedBy_sn_step.valid_from AS valid_from,
  ReachedBy_sn_step.valid_to AS valid_to
FROM
  t_0_ReachedBy_sn_step AS ReachedBy_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.ReachedBy_sn_full AS ReachedBy_sn_full
  WHERE
    (ReachedBy_sn_full.source = ReachedBy_sn_step.source) AND
    (ReachedBy_sn_full.target = ReachedBy_sn_step.target) AND
    (ReachedBy_sn_full.valid_from = ReachedBy_sn_step.valid_from) AND
    (ReachedBy_sn_full.valid_to = ReachedBy_sn_step.valid_to)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.ReachedBy_sn_full SELECT * FROM logica_test.ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_delta;
CREATE TABLE logica_test.ReachedBy_sn_delta AS SELECT
  ReachedBy_sn_new.source AS source,
  ReachedBy_sn_new.target AS target,
  ReachedBy_sn_new.valid_from AS valid_from,
  ReachedBy_sn_new.valid_to AS valid_to
FROM
  logica_test.ReachedBy_sn_new AS ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_new;
CREATE TABLE logica_test.ReachedBy_sn_new AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_1_ReachedBy_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      t_2_ReachedBy_sn_delta.source AS source,
      t_3_HandedOver.target AS target,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END AS valid_from,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS t_2_ReachedBy_sn_delta, t_1_HandedOver AS t_3_HandedOver
    WHERE
      (CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END < CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END) AND
      (t_3_HandedOver.source = t_2_ReachedBy_sn_delta.target)
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_sn_step AS (SELECT
  ReachedBy_MultBodyAggAux_f2.source AS source,
  ReachedBy_MultBodyAggAux_f2.target AS target,
  ReachedBy_MultBodyAggAux_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f2.valid_to AS valid_to
FROM
  t_1_ReachedBy_MultBodyAggAux_f2 AS ReachedBy_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  ReachedBy_sn_step.source AS source,
  ReachedBy_sn_step.target AS target,
  ReachedBy_sn_step.valid_from AS valid_from,
  ReachedBy_sn_step.valid_to AS valid_to
FROM
  t_0_ReachedBy_sn_step AS ReachedBy_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.ReachedBy_sn_full AS ReachedBy_sn_full
  WHERE
    (ReachedBy_sn_full.source = ReachedBy_sn_step.source) AND
    (ReachedBy_sn_full.target = ReachedBy_sn_step.target) AND
    (ReachedBy_sn_full.valid_from = ReachedBy_sn_step.valid_from) AND
    (ReachedBy_sn_full.valid_to = ReachedBy_sn_step.valid_to)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.ReachedBy_sn_full SELECT * FROM logica_test.ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_delta;
CREATE TABLE logica_test.ReachedBy_sn_delta AS SELECT
  ReachedBy_sn_new.source AS source,
  ReachedBy_sn_new.target AS target,
  ReachedBy_sn_new.valid_from AS valid_from,
  ReachedBy_sn_new.valid_to AS valid_to
FROM
  logica_test.ReachedBy_sn_new AS ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_new;
CREATE TABLE logica_test.ReachedBy_sn_new AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_1_ReachedBy_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      t_2_ReachedBy_sn_delta.source AS source,
      t_3_HandedOver.target AS target,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END AS valid_from,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS t_2_ReachedBy_sn_delta, t_1_HandedOver AS t_3_HandedOver
    WHERE
      (CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END < CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END) AND
      (t_3_HandedOver.source = t_2_ReachedBy_sn_delta.target)
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_sn_step AS (SELECT
  ReachedBy_MultBodyAggAux_f2.source AS source,
  ReachedBy_MultBodyAggAux_f2.target AS target,
  ReachedBy_MultBodyAggAux_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f2.valid_to AS valid_to
FROM
  t_1_ReachedBy_MultBodyAggAux_f2 AS ReachedBy_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  ReachedBy_sn_step.source AS source,
  ReachedBy_sn_step.target AS target,
  ReachedBy_sn_step.valid_from AS valid_from,
  ReachedBy_sn_step.valid_to AS valid_to
FROM
  t_0_ReachedBy_sn_step AS ReachedBy_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.ReachedBy_sn_full AS ReachedBy_sn_full
  WHERE
    (ReachedBy_sn_full.source = ReachedBy_sn_step.source) AND
    (ReachedBy_sn_full.target = ReachedBy_sn_step.target) AND
    (ReachedBy_sn_full.valid_from = ReachedBy_sn_step.valid_from) AND
    (ReachedBy_sn_full.valid_to = ReachedBy_sn_step.valid_to)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.ReachedBy_sn_full SELECT * FROM logica_test.ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_delta;
CREATE TABLE logica_test.ReachedBy_sn_delta AS SELECT
  ReachedBy_sn_new.source AS source,
  ReachedBy_sn_new.target AS target,
  ReachedBy_sn_new.valid_from AS valid_from,
  ReachedBy_sn_new.valid_to AS valid_to
FROM
  logica_test.ReachedBy_sn_new AS ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_new;
CREATE TABLE logica_test.ReachedBy_sn_new AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_1_ReachedBy_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      t_2_ReachedBy_sn_delta.source AS source,
      t_3_HandedOver.target AS target,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END AS valid_from,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS t_2_ReachedBy_sn_delta, t_1_HandedOver AS t_3_HandedOver
    WHERE
      (CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END < CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END) AND
      (t_3_HandedOver.source = t_2_ReachedBy_sn_delta.target)
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_sn_step AS (SELECT
  ReachedBy_MultBodyAggAux_f2.source AS source,
  ReachedBy_MultBodyAggAux_f2.target AS target,
  ReachedBy_MultBodyAggAux_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f2.valid_to AS valid_to
FROM
  t_1_ReachedBy_MultBodyAggAux_f2 AS ReachedBy_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  ReachedBy_sn_step.source AS source,
  ReachedBy_sn_step.target AS target,
  ReachedBy_sn_step.valid_from AS valid_from,
  ReachedBy_sn_step.valid_to AS valid_to
FROM
  t_0_ReachedBy_sn_step AS ReachedBy_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.ReachedBy_sn_full AS ReachedBy_sn_full
  WHERE
    (ReachedBy_sn_full.source = ReachedBy_sn_step.source) AND
    (ReachedBy_sn_full.target = ReachedBy_sn_step.target) AND
    (ReachedBy_sn_full.valid_from = ReachedBy_sn_step.valid_from) AND
    (ReachedBy_sn_full.valid_to = ReachedBy_sn_step.valid_to)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.ReachedBy_sn_full SELECT * FROM logica_test.ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_delta;
CREATE TABLE logica_test.ReachedBy_sn_delta AS SELECT
  ReachedBy_sn_new.source AS source,
  ReachedBy_sn_new.target AS target,
  ReachedBy_sn_new.valid_from AS valid_from,
  ReachedBy_sn_new.valid_to AS valid_to
FROM
  logica_test.ReachedBy_sn_new AS ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_new;
CREATE TABLE logica_test.ReachedBy_sn_new AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_1_ReachedBy_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      t_2_ReachedBy_sn_delta.source AS source,
      t_3_HandedOver.target AS target,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END AS valid_from,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS t_2_ReachedBy_sn_delta, t_1_HandedOver AS t_3_HandedOver
    WHERE
      (CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END < CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END) AND
      (t_3_HandedOver.source = t_2_ReachedBy_sn_delta.target)
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_sn_step AS (SELECT
  ReachedBy_MultBodyAggAux_f2.source AS source,
  ReachedBy_MultBodyAggAux_f2.target AS target,
  ReachedBy_MultBodyAggAux_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f2.valid_to AS valid_to
FROM
  t_1_ReachedBy_MultBodyAggAux_f2 AS ReachedBy_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  ReachedBy_sn_step.source AS source,
  ReachedBy_sn_step.target AS target,
  ReachedBy_sn_step.valid_from AS valid_from,
  ReachedBy_sn_step.valid_to AS valid_to
FROM
  t_0_ReachedBy_sn_step AS ReachedBy_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.ReachedBy_sn_full AS ReachedBy_sn_full
  WHERE
    (ReachedBy_sn_full.source = ReachedBy_sn_step.source) AND
    (ReachedBy_sn_full.target = ReachedBy_sn_step.target) AND
    (ReachedBy_sn_full.valid_from = ReachedBy_sn_step.valid_from) AND
    (ReachedBy_sn_full.valid_to = ReachedBy_sn_step.valid_to)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.ReachedBy_sn_full SELECT * FROM logica_test.ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_delta;
CREATE TABLE logica_test.ReachedBy_sn_delta AS SELECT
  ReachedBy_sn_new.source AS source,
  ReachedBy_sn_new.target AS target,
  ReachedBy_sn_new.valid_from AS valid_from,
  ReachedBy_sn_new.valid_to AS valid_to
FROM
  logica_test.ReachedBy_sn_new AS ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_new;
CREATE TABLE logica_test.ReachedBy_sn_new AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_1_ReachedBy_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      t_2_ReachedBy_sn_delta.source AS source,
      t_3_HandedOver.target AS target,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END AS valid_from,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS t_2_ReachedBy_sn_delta, t_1_HandedOver AS t_3_HandedOver
    WHERE
      (CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END < CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END) AND
      (t_3_HandedOver.source = t_2_ReachedBy_sn_delta.target)
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_sn_step AS (SELECT
  ReachedBy_MultBodyAggAux_f2.source AS source,
  ReachedBy_MultBodyAggAux_f2.target AS target,
  ReachedBy_MultBodyAggAux_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f2.valid_to AS valid_to
FROM
  t_1_ReachedBy_MultBodyAggAux_f2 AS ReachedBy_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  ReachedBy_sn_step.source AS source,
  ReachedBy_sn_step.target AS target,
  ReachedBy_sn_step.valid_from AS valid_from,
  ReachedBy_sn_step.valid_to AS valid_to
FROM
  t_0_ReachedBy_sn_step AS ReachedBy_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.ReachedBy_sn_full AS ReachedBy_sn_full
  WHERE
    (ReachedBy_sn_full.source = ReachedBy_sn_step.source) AND
    (ReachedBy_sn_full.target = ReachedBy_sn_step.target) AND
    (ReachedBy_sn_full.valid_from = ReachedBy_sn_step.valid_from) AND
    (ReachedBy_sn_full.valid_to = ReachedBy_sn_step.valid_to)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.ReachedBy_sn_full SELECT * FROM logica_test.ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_delta;
CREATE TABLE logica_test.ReachedBy_sn_delta AS SELECT
  ReachedBy_sn_new.source AS source,
  ReachedBy_sn_new.target AS target,
  ReachedBy_sn_new.valid_from AS valid_from,
  ReachedBy_sn_new.valid_to AS valid_to
FROM
  logica_test.ReachedBy_sn_new AS ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_new;
CREATE TABLE logica_test.ReachedBy_sn_new AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_1_ReachedBy_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      t_2_ReachedBy_sn_delta.source AS source,
      t_3_HandedOver.target AS target,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END AS valid_from,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS t_2_ReachedBy_sn_delta, t_1_HandedOver AS t_3_HandedOver
    WHERE
      (CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END < CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END) AND
      (t_3_HandedOver.source = t_2_ReachedBy_sn_delta.target)
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_sn_step AS (SELECT
  ReachedBy_MultBodyAggAux_f2.source AS source,
  ReachedBy_MultBodyAggAux_f2.target AS target,
  ReachedBy_MultBodyAggAux_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f2.valid_to AS valid_to
FROM
  t_1_ReachedBy_MultBodyAggAux_f2 AS ReachedBy_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  ReachedBy_sn_step.source AS source,
  ReachedBy_sn_step.target AS target,
  ReachedBy_sn_step.valid_from AS valid_from,
  ReachedBy_sn_step.valid_to AS valid_to
FROM
  t_0_ReachedBy_sn_step AS ReachedBy_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.ReachedBy_sn_full AS ReachedBy_sn_full
  WHERE
    (ReachedBy_sn_full.source = ReachedBy_sn_step.source) AND
    (ReachedBy_sn_full.target = ReachedBy_sn_step.target) AND
    (ReachedBy_sn_full.valid_from = ReachedBy_sn_step.valid_from) AND
    (ReachedBy_sn_full.valid_to = ReachedBy_sn_step.valid_to)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.ReachedBy_sn_full SELECT * FROM logica_test.ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_delta;
CREATE TABLE logica_test.ReachedBy_sn_delta AS SELECT
  ReachedBy_sn_new.source AS source,
  ReachedBy_sn_new.target AS target,
  ReachedBy_sn_new.valid_from AS valid_from,
  ReachedBy_sn_new.valid_to AS valid_to
FROM
  logica_test.ReachedBy_sn_new AS ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_new;
CREATE TABLE logica_test.ReachedBy_sn_new AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_1_ReachedBy_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      t_2_ReachedBy_sn_delta.source AS source,
      t_3_HandedOver.target AS target,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END AS valid_from,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS t_2_ReachedBy_sn_delta, t_1_HandedOver AS t_3_HandedOver
    WHERE
      (CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END < CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END) AND
      (t_3_HandedOver.source = t_2_ReachedBy_sn_delta.target)
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_sn_step AS (SELECT
  ReachedBy_MultBodyAggAux_f2.source AS source,
  ReachedBy_MultBodyAggAux_f2.target AS target,
  ReachedBy_MultBodyAggAux_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f2.valid_to AS valid_to
FROM
  t_1_ReachedBy_MultBodyAggAux_f2 AS ReachedBy_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  ReachedBy_sn_step.source AS source,
  ReachedBy_sn_step.target AS target,
  ReachedBy_sn_step.valid_from AS valid_from,
  ReachedBy_sn_step.valid_to AS valid_to
FROM
  t_0_ReachedBy_sn_step AS ReachedBy_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.ReachedBy_sn_full AS ReachedBy_sn_full
  WHERE
    (ReachedBy_sn_full.source = ReachedBy_sn_step.source) AND
    (ReachedBy_sn_full.target = ReachedBy_sn_step.target) AND
    (ReachedBy_sn_full.valid_from = ReachedBy_sn_step.valid_from) AND
    (ReachedBy_sn_full.valid_to = ReachedBy_sn_step.valid_to)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.ReachedBy_sn_full SELECT * FROM logica_test.ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_delta;
CREATE TABLE logica_test.ReachedBy_sn_delta AS SELECT
  ReachedBy_sn_new.source AS source,
  ReachedBy_sn_new.target AS target,
  ReachedBy_sn_new.valid_from AS valid_from,
  ReachedBy_sn_new.valid_to AS valid_to
FROM
  logica_test.ReachedBy_sn_new AS ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_new;
CREATE TABLE logica_test.ReachedBy_sn_new AS WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_1_ReachedBy_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      t_2_ReachedBy_sn_delta.source AS source,
      t_3_HandedOver.target AS target,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END AS valid_from,
      CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END AS valid_to
    FROM
      logica_test.ReachedBy_sn_delta AS t_2_ReachedBy_sn_delta, t_1_HandedOver AS t_3_HandedOver
    WHERE
      (CASE WHEN (t_2_ReachedBy_sn_delta.valid_from > t_3_HandedOver.valid_from) THEN t_2_ReachedBy_sn_delta.valid_from ELSE t_3_HandedOver.valid_from END < CASE WHEN (t_2_ReachedBy_sn_delta.valid_to < t_3_HandedOver.valid_to) THEN t_2_ReachedBy_sn_delta.valid_to ELSE t_3_HandedOver.valid_to END) AND
      (t_3_HandedOver.source = t_2_ReachedBy_sn_delta.target)
  
) AS UNUSED_TABLE_NAME  ),
t_0_ReachedBy_sn_step AS (SELECT
  ReachedBy_MultBodyAggAux_f2.source AS source,
  ReachedBy_MultBodyAggAux_f2.target AS target,
  ReachedBy_MultBodyAggAux_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_f2.valid_to AS valid_to
FROM
  t_1_ReachedBy_MultBodyAggAux_f2 AS ReachedBy_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4)
SELECT
  ReachedBy_sn_step.source AS source,
  ReachedBy_sn_step.target AS target,
  ReachedBy_sn_step.valid_from AS valid_from,
  ReachedBy_sn_step.valid_to AS valid_to
FROM
  t_0_ReachedBy_sn_step AS ReachedBy_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.ReachedBy_sn_full AS ReachedBy_sn_full
  WHERE
    (ReachedBy_sn_full.source = ReachedBy_sn_step.source) AND
    (ReachedBy_sn_full.target = ReachedBy_sn_step.target) AND
    (ReachedBy_sn_full.valid_from = ReachedBy_sn_step.valid_from) AND
    (ReachedBy_sn_full.valid_to = ReachedBy_sn_step.valid_to)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.ReachedBy_sn_full SELECT * FROM logica_test.ReachedBy_sn_new;

DROP TABLE IF EXISTS logica_test.ReachedBy_sn_delta;
CREATE TABLE logica_test.ReachedBy_sn_delta AS SELECT
  ReachedBy_sn_new.source AS source,
  ReachedBy_sn_new.target AS target,
  ReachedBy_sn_new.valid_from AS valid_from,
  ReachedBy_sn_new.valid_to AS valid_to
FROM
  logica_test.ReachedBy_sn_new AS ReachedBy_sn_new;

SELECT
  ReachedBy_sn_full.source AS source,
  ReachedBy_sn_full.target AS target,
  ReachedBy_sn_full.valid_from AS valid_from,
  ReachedBy_sn_full.valid_to AS valid_to
FROM
  logica_test.ReachedBy_sn_full AS ReachedBy_sn_full ORDER BY source, target, valid_from;