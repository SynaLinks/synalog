DROP TABLE IF EXISTS logica_test.Above_sn_delta;
CREATE TABLE logica_test.Above_sn_delta AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_0_Above_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Above_MultBodyAggAux_f2.approver AS approver,
  Above_MultBodyAggAux_f2.requester AS requester
FROM
  t_0_Above_MultBodyAggAux_f2 AS Above_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table logica_test.Above_sn_delta

DROP TABLE IF EXISTS logica_test.Above_sn_t0;
CREATE TABLE logica_test.Above_sn_t0 AS SELECT
  Above_sn_delta.approver AS approver,
  Above_sn_delta.requester AS requester
FROM
  logica_test.Above_sn_delta AS Above_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Above_sn_t0

DROP TABLE IF EXISTS logica_test.Above_sn_t1;
CREATE TABLE logica_test.Above_sn_t1 AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Above_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_2_ApproverOf.approver AS approver,
      Above_sn_t0.requester AS requester
    FROM
      logica_test.Above_sn_t0 AS Above_sn_t0, t_1_ApproverOf AS t_2_ApproverOf
    WHERE
      (t_2_ApproverOf.requester = Above_sn_t0.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_r1 AS (SELECT
  Above_MultBodyAggAux_f3.approver AS approver,
  Above_MultBodyAggAux_f3.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f3 AS Above_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  Above_sn_r1.approver AS approver,
  Above_sn_r1.requester AS requester
FROM
  t_0_Above_sn_r1 AS Above_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Above_sn_t1

DROP TABLE IF EXISTS logica_test.Above_sn_t2;
CREATE TABLE logica_test.Above_sn_t2 AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Above_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_2_ApproverOf.approver AS approver,
      Above_sn_t1.requester AS requester
    FROM
      logica_test.Above_sn_t1 AS Above_sn_t1, t_1_ApproverOf AS t_2_ApproverOf
    WHERE
      (t_2_ApproverOf.requester = Above_sn_t1.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_r2 AS (SELECT
  Above_MultBodyAggAux_f4.approver AS approver,
  Above_MultBodyAggAux_f4.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f4 AS Above_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  Above_sn_r2.approver AS approver,
  Above_sn_r2.requester AS requester
FROM
  t_0_Above_sn_r2 AS Above_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Above_sn_t2

DROP TABLE IF EXISTS logica_test.Above_sn_t3;
CREATE TABLE logica_test.Above_sn_t3 AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Above_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_2_ApproverOf.approver AS approver,
      Above_sn_t2.requester AS requester
    FROM
      logica_test.Above_sn_t2 AS Above_sn_t2, t_1_ApproverOf AS t_2_ApproverOf
    WHERE
      (t_2_ApproverOf.requester = Above_sn_t2.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_r3 AS (SELECT
  Above_MultBodyAggAux_f5.approver AS approver,
  Above_MultBodyAggAux_f5.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f5 AS Above_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  Above_sn_r3.approver AS approver,
  Above_sn_r3.requester AS requester
FROM
  t_0_Above_sn_r3 AS Above_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Above_sn_t3

DROP TABLE IF EXISTS logica_test.Above_sn_t4;
CREATE TABLE logica_test.Above_sn_t4 AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Above_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_2_ApproverOf.approver AS approver,
      Above_sn_t3.requester AS requester
    FROM
      logica_test.Above_sn_t3 AS Above_sn_t3, t_1_ApproverOf AS t_2_ApproverOf
    WHERE
      (t_2_ApproverOf.requester = Above_sn_t3.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_r4 AS (SELECT
  Above_MultBodyAggAux_f6.approver AS approver,
  Above_MultBodyAggAux_f6.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f6 AS Above_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  Above_sn_r4.approver AS approver,
  Above_sn_r4.requester AS requester
FROM
  t_0_Above_sn_r4 AS Above_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.Above_sn_t4

DROP TABLE IF EXISTS logica_test.Above_sn_t5;
CREATE TABLE logica_test.Above_sn_t5 AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Above_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_2_ApproverOf.approver AS approver,
      Above_sn_t4.requester AS requester
    FROM
      logica_test.Above_sn_t4 AS Above_sn_t4, t_1_ApproverOf AS t_2_ApproverOf
    WHERE
      (t_2_ApproverOf.requester = Above_sn_t4.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_r5 AS (SELECT
  Above_MultBodyAggAux_f7.approver AS approver,
  Above_MultBodyAggAux_f7.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f7 AS Above_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Above_sn_r5.approver AS approver,
  Above_sn_r5.requester AS requester
FROM
  t_0_Above_sn_r5 AS Above_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.Above_sn_t5

DROP TABLE IF EXISTS logica_test.Above_sn_full;
CREATE TABLE logica_test.Above_sn_full AS SELECT * FROM (
  
    SELECT
      Above_sn_delta.approver AS approver,
      Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS Above_sn_delta
   UNION ALL
  
    SELECT
      Above_sn_t1.approver AS approver,
      Above_sn_t1.requester AS requester
    FROM
      logica_test.Above_sn_t1 AS Above_sn_t1
   UNION ALL
  
    SELECT
      Above_sn_t2.approver AS approver,
      Above_sn_t2.requester AS requester
    FROM
      logica_test.Above_sn_t2 AS Above_sn_t2
   UNION ALL
  
    SELECT
      Above_sn_t3.approver AS approver,
      Above_sn_t3.requester AS requester
    FROM
      logica_test.Above_sn_t3 AS Above_sn_t3
   UNION ALL
  
    SELECT
      Above_sn_t4.approver AS approver,
      Above_sn_t4.requester AS requester
    FROM
      logica_test.Above_sn_t4 AS Above_sn_t4
   UNION ALL
  
    SELECT
      Above_sn_t5.approver AS approver,
      Above_sn_t5.requester AS requester
    FROM
      logica_test.Above_sn_t5 AS Above_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Above_sn_full

DROP TABLE IF EXISTS logica_test.Above_sn_new;
CREATE TABLE logica_test.Above_sn_new AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Above_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_2_ApproverOf.approver AS approver,
      Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS Above_sn_delta, t_1_ApproverOf AS t_2_ApproverOf
    WHERE
      (t_2_ApproverOf.requester = Above_sn_delta.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_step AS (SELECT
  Above_MultBodyAggAux_f8.approver AS approver,
  Above_MultBodyAggAux_f8.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f8 AS Above_MultBodyAggAux_f8
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
CREATE TABLE logica_test.Above_sn_delta AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Above_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_2_ApproverOf.approver AS approver,
      Above_sn_new.requester AS requester
    FROM
      logica_test.Above_sn_new AS Above_sn_new, t_1_ApproverOf AS t_2_ApproverOf
    WHERE
      (t_2_ApproverOf.requester = Above_sn_new.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_back_step AS (SELECT
  Above_MultBodyAggAux_f1.approver AS approver,
  Above_MultBodyAggAux_f1.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f1 AS Above_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Above_sn_back_step.approver AS approver,
  Above_sn_back_step.requester AS requester
FROM
  t_0_Above_sn_back_step AS Above_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Above_sn_full AS Above_sn_full
  WHERE
    (Above_sn_full.approver = Above_sn_back_step.approver) AND
    (Above_sn_full.requester = Above_sn_back_step.requester)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Above_sn_full SELECT * FROM logica_test.Above_sn_delta;

DROP TABLE IF EXISTS logica_test.Above_sn_new;
CREATE TABLE logica_test.Above_sn_new AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Above_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_2_ApproverOf.approver AS approver,
      Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS Above_sn_delta, t_1_ApproverOf AS t_2_ApproverOf
    WHERE
      (t_2_ApproverOf.requester = Above_sn_delta.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_step AS (SELECT
  Above_MultBodyAggAux_f8.approver AS approver,
  Above_MultBodyAggAux_f8.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f8 AS Above_MultBodyAggAux_f8
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
CREATE TABLE logica_test.Above_sn_delta AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Above_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_2_ApproverOf.approver AS approver,
      Above_sn_new.requester AS requester
    FROM
      logica_test.Above_sn_new AS Above_sn_new, t_1_ApproverOf AS t_2_ApproverOf
    WHERE
      (t_2_ApproverOf.requester = Above_sn_new.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_back_step AS (SELECT
  Above_MultBodyAggAux_f1.approver AS approver,
  Above_MultBodyAggAux_f1.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f1 AS Above_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Above_sn_back_step.approver AS approver,
  Above_sn_back_step.requester AS requester
FROM
  t_0_Above_sn_back_step AS Above_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Above_sn_full AS Above_sn_full
  WHERE
    (Above_sn_full.approver = Above_sn_back_step.approver) AND
    (Above_sn_full.requester = Above_sn_back_step.requester)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Above_sn_full SELECT * FROM logica_test.Above_sn_delta;

DROP TABLE IF EXISTS logica_test.Above_sn_new;
CREATE TABLE logica_test.Above_sn_new AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Above_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_2_ApproverOf.approver AS approver,
      Above_sn_delta.requester AS requester
    FROM
      logica_test.Above_sn_delta AS Above_sn_delta, t_1_ApproverOf AS t_2_ApproverOf
    WHERE
      (t_2_ApproverOf.requester = Above_sn_delta.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_step AS (SELECT
  Above_MultBodyAggAux_f8.approver AS approver,
  Above_MultBodyAggAux_f8.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f8 AS Above_MultBodyAggAux_f8
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
CREATE TABLE logica_test.Above_sn_delta AS WITH t_1_ApproverOf AS (SELECT * FROM VALUES
  ("eva", "dan"),
  ("dan", "cal"),
  ("dan", "bea"),
  ("cal", "ali")
AS UNUSED_TABLE_NAME(approver, requester)),
t_1_Above_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_1_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_2_ApproverOf.approver AS approver,
      Above_sn_new.requester AS requester
    FROM
      logica_test.Above_sn_new AS Above_sn_new, t_1_ApproverOf AS t_2_ApproverOf
    WHERE
      (t_2_ApproverOf.requester = Above_sn_new.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above_sn_back_step AS (SELECT
  Above_MultBodyAggAux_f1.approver AS approver,
  Above_MultBodyAggAux_f1.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_f1 AS Above_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Above_sn_back_step.approver AS approver,
  Above_sn_back_step.requester AS requester
FROM
  t_0_Above_sn_back_step AS Above_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Above_sn_full AS Above_sn_full
  WHERE
    (Above_sn_full.approver = Above_sn_back_step.approver) AND
    (Above_sn_full.requester = Above_sn_back_step.requester)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Above_sn_full SELECT * FROM logica_test.Above_sn_delta;

SELECT
  Above_sn_full.approver AS approver
FROM
  logica_test.Above_sn_full AS Above_sn_full
WHERE
  ("ali" = Above_sn_full.requester)
GROUP BY 1 ORDER BY approver NULLS LAST;