DROP TABLE IF EXISTS logica_test.Above_sn_delta;
CREATE TABLE logica_test.Above_sn_delta AS WITH t_1_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Above_MultBodyAggAux_f1.approver AS approver,
  Above_MultBodyAggAux_f1.requester AS requester
FROM
  t_0_Above_MultBodyAggAux_f1 AS Above_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Above_sn_delta

DROP TABLE IF EXISTS logica_test.Above_sn_full;
CREATE TABLE logica_test.Above_sn_full AS WITH t_1_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_1_Above_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_3_ApproverOf.approver AS approver,
      t_2_Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS t_2_Above_sn_delta, t_1_ApproverOf AS t_3_ApproverOf
    WHERE
      (t_3_ApproverOf.requester = t_2_Above_sn_delta.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_step AS (SELECT
  Above_MultBodyAggAux_f2.approver AS approver,
  Above_MultBodyAggAux_f2.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f2 AS Above_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Above_sn_delta.approver AS approver,
      Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS Above_sn_delta
   UNION ALL
  
    SELECT
      Above_sn_step.approver AS approver,
      Above_sn_step.requester AS requester
    FROM
      t_0_Above_sn_step AS Above_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Above_sn_full

DROP TABLE IF EXISTS logica_test.Above_sn_new;
CREATE TABLE logica_test.Above_sn_new AS WITH t_1_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_1_Above_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_3_ApproverOf.approver AS approver,
      t_2_Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS t_2_Above_sn_delta, t_1_ApproverOf AS t_3_ApproverOf
    WHERE
      (t_3_ApproverOf.requester = t_2_Above_sn_delta.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_step AS (SELECT
  Above_MultBodyAggAux_f2.approver AS approver,
  Above_MultBodyAggAux_f2.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f2 AS Above_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Above_sn_step.approver AS approver,
  Above_sn_step.requester AS requester
FROM
  t_0_Above_sn_step AS Above_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Above_sn_full AS Above_sn_full
  WHERE
    (Above_sn_full.approver = Above_sn_step.approver) AND
    (Above_sn_full.requester = Above_sn_step.requester)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Above_sn_full SELECT * FROM logica_test.Above_sn_new;

DROP TABLE IF EXISTS logica_test.Above_sn_delta;
CREATE TABLE logica_test.Above_sn_delta AS SELECT
  Above_sn_new.approver AS approver,
  Above_sn_new.requester AS requester
FROM
  logica_test.Above_sn_new AS Above_sn_new;

DROP TABLE IF EXISTS logica_test.Above_sn_new;
CREATE TABLE logica_test.Above_sn_new AS WITH t_1_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_1_Above_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_3_ApproverOf.approver AS approver,
      t_2_Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS t_2_Above_sn_delta, t_1_ApproverOf AS t_3_ApproverOf
    WHERE
      (t_3_ApproverOf.requester = t_2_Above_sn_delta.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_step AS (SELECT
  Above_MultBodyAggAux_f2.approver AS approver,
  Above_MultBodyAggAux_f2.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f2 AS Above_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Above_sn_step.approver AS approver,
  Above_sn_step.requester AS requester
FROM
  t_0_Above_sn_step AS Above_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Above_sn_full AS Above_sn_full
  WHERE
    (Above_sn_full.approver = Above_sn_step.approver) AND
    (Above_sn_full.requester = Above_sn_step.requester)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Above_sn_full SELECT * FROM logica_test.Above_sn_new;

DROP TABLE IF EXISTS logica_test.Above_sn_delta;
CREATE TABLE logica_test.Above_sn_delta AS SELECT
  Above_sn_new.approver AS approver,
  Above_sn_new.requester AS requester
FROM
  logica_test.Above_sn_new AS Above_sn_new;

DROP TABLE IF EXISTS logica_test.Above_sn_new;
CREATE TABLE logica_test.Above_sn_new AS WITH t_1_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_1_Above_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_3_ApproverOf.approver AS approver,
      t_2_Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS t_2_Above_sn_delta, t_1_ApproverOf AS t_3_ApproverOf
    WHERE
      (t_3_ApproverOf.requester = t_2_Above_sn_delta.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_step AS (SELECT
  Above_MultBodyAggAux_f2.approver AS approver,
  Above_MultBodyAggAux_f2.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f2 AS Above_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Above_sn_step.approver AS approver,
  Above_sn_step.requester AS requester
FROM
  t_0_Above_sn_step AS Above_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Above_sn_full AS Above_sn_full
  WHERE
    (Above_sn_full.approver = Above_sn_step.approver) AND
    (Above_sn_full.requester = Above_sn_step.requester)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Above_sn_full SELECT * FROM logica_test.Above_sn_new;

DROP TABLE IF EXISTS logica_test.Above_sn_delta;
CREATE TABLE logica_test.Above_sn_delta AS SELECT
  Above_sn_new.approver AS approver,
  Above_sn_new.requester AS requester
FROM
  logica_test.Above_sn_new AS Above_sn_new;

DROP TABLE IF EXISTS logica_test.Above_sn_new;
CREATE TABLE logica_test.Above_sn_new AS WITH t_1_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_1_Above_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_3_ApproverOf.approver AS approver,
      t_2_Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS t_2_Above_sn_delta, t_1_ApproverOf AS t_3_ApproverOf
    WHERE
      (t_3_ApproverOf.requester = t_2_Above_sn_delta.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_step AS (SELECT
  Above_MultBodyAggAux_f2.approver AS approver,
  Above_MultBodyAggAux_f2.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f2 AS Above_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Above_sn_step.approver AS approver,
  Above_sn_step.requester AS requester
FROM
  t_0_Above_sn_step AS Above_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Above_sn_full AS Above_sn_full
  WHERE
    (Above_sn_full.approver = Above_sn_step.approver) AND
    (Above_sn_full.requester = Above_sn_step.requester)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Above_sn_full SELECT * FROM logica_test.Above_sn_new;

DROP TABLE IF EXISTS logica_test.Above_sn_delta;
CREATE TABLE logica_test.Above_sn_delta AS SELECT
  Above_sn_new.approver AS approver,
  Above_sn_new.requester AS requester
FROM
  logica_test.Above_sn_new AS Above_sn_new;

DROP TABLE IF EXISTS logica_test.Above_sn_new;
CREATE TABLE logica_test.Above_sn_new AS WITH t_1_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_1_Above_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_3_ApproverOf.approver AS approver,
      t_2_Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS t_2_Above_sn_delta, t_1_ApproverOf AS t_3_ApproverOf
    WHERE
      (t_3_ApproverOf.requester = t_2_Above_sn_delta.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_step AS (SELECT
  Above_MultBodyAggAux_f2.approver AS approver,
  Above_MultBodyAggAux_f2.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f2 AS Above_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Above_sn_step.approver AS approver,
  Above_sn_step.requester AS requester
FROM
  t_0_Above_sn_step AS Above_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Above_sn_full AS Above_sn_full
  WHERE
    (Above_sn_full.approver = Above_sn_step.approver) AND
    (Above_sn_full.requester = Above_sn_step.requester)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Above_sn_full SELECT * FROM logica_test.Above_sn_new;

DROP TABLE IF EXISTS logica_test.Above_sn_delta;
CREATE TABLE logica_test.Above_sn_delta AS SELECT
  Above_sn_new.approver AS approver,
  Above_sn_new.requester AS requester
FROM
  logica_test.Above_sn_new AS Above_sn_new;

DROP TABLE IF EXISTS logica_test.Above_sn_new;
CREATE TABLE logica_test.Above_sn_new AS WITH t_1_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_1_Above_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_3_ApproverOf.approver AS approver,
      t_2_Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS t_2_Above_sn_delta, t_1_ApproverOf AS t_3_ApproverOf
    WHERE
      (t_3_ApproverOf.requester = t_2_Above_sn_delta.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_step AS (SELECT
  Above_MultBodyAggAux_f2.approver AS approver,
  Above_MultBodyAggAux_f2.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f2 AS Above_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Above_sn_step.approver AS approver,
  Above_sn_step.requester AS requester
FROM
  t_0_Above_sn_step AS Above_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Above_sn_full AS Above_sn_full
  WHERE
    (Above_sn_full.approver = Above_sn_step.approver) AND
    (Above_sn_full.requester = Above_sn_step.requester)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Above_sn_full SELECT * FROM logica_test.Above_sn_new;

DROP TABLE IF EXISTS logica_test.Above_sn_delta;
CREATE TABLE logica_test.Above_sn_delta AS SELECT
  Above_sn_new.approver AS approver,
  Above_sn_new.requester AS requester
FROM
  logica_test.Above_sn_new AS Above_sn_new;

SELECT
  Above_sn_full.approver AS approver
FROM
  logica_test.Above_sn_full AS Above_sn_full
WHERE
  ('bea' = Above_sn_full.requester)
GROUP BY 1 ORDER BY approver;