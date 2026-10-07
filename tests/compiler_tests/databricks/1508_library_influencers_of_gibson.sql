DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_0_Down_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Down_MultBodyAggAux_f2.a AS a,
  Down_MultBodyAggAux_f2.b AS b
FROM
  t_0_Down_MultBodyAggAux_f2 AS Down_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table logica_test.Down_sn_delta

DROP TABLE IF EXISTS logica_test.Down_sn_t0;
CREATE TABLE logica_test.Down_sn_t0 AS SELECT
  Down_sn_delta.a AS a,
  Down_sn_delta.b AS b
FROM
  logica_test.Down_sn_delta AS Down_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Down_sn_t0

DROP TABLE IF EXISTS logica_test.Down_sn_t1;
CREATE TABLE logica_test.Down_sn_t1 AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_1_Down_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_sn_t0.a AS a,
      t_2_Influenced.b AS b
    FROM
      logica_test.Down_sn_t0 AS Down_sn_t0, t_1_Influenced AS t_2_Influenced
    WHERE
      (t_2_Influenced.a = Down_sn_t0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_r1 AS (SELECT
  Down_MultBodyAggAux_f3.a AS a,
  Down_MultBodyAggAux_f3.b AS b
FROM
  t_1_Down_MultBodyAggAux_f3 AS Down_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  Down_sn_r1.a AS a,
  Down_sn_r1.b AS b
FROM
  t_0_Down_sn_r1 AS Down_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Down_sn_t1

DROP TABLE IF EXISTS logica_test.Down_sn_t2;
CREATE TABLE logica_test.Down_sn_t2 AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_1_Down_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_sn_t1.a AS a,
      t_2_Influenced.b AS b
    FROM
      logica_test.Down_sn_t1 AS Down_sn_t1, t_1_Influenced AS t_2_Influenced
    WHERE
      (t_2_Influenced.a = Down_sn_t1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_r2 AS (SELECT
  Down_MultBodyAggAux_f4.a AS a,
  Down_MultBodyAggAux_f4.b AS b
FROM
  t_1_Down_MultBodyAggAux_f4 AS Down_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  Down_sn_r2.a AS a,
  Down_sn_r2.b AS b
FROM
  t_0_Down_sn_r2 AS Down_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Down_sn_t2

DROP TABLE IF EXISTS logica_test.Down_sn_t3;
CREATE TABLE logica_test.Down_sn_t3 AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_1_Down_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_sn_t2.a AS a,
      t_2_Influenced.b AS b
    FROM
      logica_test.Down_sn_t2 AS Down_sn_t2, t_1_Influenced AS t_2_Influenced
    WHERE
      (t_2_Influenced.a = Down_sn_t2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_r3 AS (SELECT
  Down_MultBodyAggAux_f5.a AS a,
  Down_MultBodyAggAux_f5.b AS b
FROM
  t_1_Down_MultBodyAggAux_f5 AS Down_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  Down_sn_r3.a AS a,
  Down_sn_r3.b AS b
FROM
  t_0_Down_sn_r3 AS Down_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Down_sn_t3

DROP TABLE IF EXISTS logica_test.Down_sn_t4;
CREATE TABLE logica_test.Down_sn_t4 AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_1_Down_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_sn_t3.a AS a,
      t_2_Influenced.b AS b
    FROM
      logica_test.Down_sn_t3 AS Down_sn_t3, t_1_Influenced AS t_2_Influenced
    WHERE
      (t_2_Influenced.a = Down_sn_t3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_r4 AS (SELECT
  Down_MultBodyAggAux_f6.a AS a,
  Down_MultBodyAggAux_f6.b AS b
FROM
  t_1_Down_MultBodyAggAux_f6 AS Down_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  Down_sn_r4.a AS a,
  Down_sn_r4.b AS b
FROM
  t_0_Down_sn_r4 AS Down_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.Down_sn_t4

DROP TABLE IF EXISTS logica_test.Down_sn_t5;
CREATE TABLE logica_test.Down_sn_t5 AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_1_Down_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_sn_t4.a AS a,
      t_2_Influenced.b AS b
    FROM
      logica_test.Down_sn_t4 AS Down_sn_t4, t_1_Influenced AS t_2_Influenced
    WHERE
      (t_2_Influenced.a = Down_sn_t4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_r5 AS (SELECT
  Down_MultBodyAggAux_f7.a AS a,
  Down_MultBodyAggAux_f7.b AS b
FROM
  t_1_Down_MultBodyAggAux_f7 AS Down_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Down_sn_r5.a AS a,
  Down_sn_r5.b AS b
FROM
  t_0_Down_sn_r5 AS Down_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.Down_sn_t5

DROP TABLE IF EXISTS logica_test.Down_sn_full;
CREATE TABLE logica_test.Down_sn_full AS SELECT * FROM (
  
    SELECT
      Down_sn_delta.a AS a,
      Down_sn_delta.b AS b
    FROM
      logica_test.Down_sn_delta AS Down_sn_delta
   UNION ALL
  
    SELECT
      Down_sn_t1.a AS a,
      Down_sn_t1.b AS b
    FROM
      logica_test.Down_sn_t1 AS Down_sn_t1
   UNION ALL
  
    SELECT
      Down_sn_t2.a AS a,
      Down_sn_t2.b AS b
    FROM
      logica_test.Down_sn_t2 AS Down_sn_t2
   UNION ALL
  
    SELECT
      Down_sn_t3.a AS a,
      Down_sn_t3.b AS b
    FROM
      logica_test.Down_sn_t3 AS Down_sn_t3
   UNION ALL
  
    SELECT
      Down_sn_t4.a AS a,
      Down_sn_t4.b AS b
    FROM
      logica_test.Down_sn_t4 AS Down_sn_t4
   UNION ALL
  
    SELECT
      Down_sn_t5.a AS a,
      Down_sn_t5.b AS b
    FROM
      logica_test.Down_sn_t5 AS Down_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Down_sn_full

DROP TABLE IF EXISTS logica_test.Down_sn_new;
CREATE TABLE logica_test.Down_sn_new AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_1_Down_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_sn_delta.a AS a,
      t_2_Influenced.b AS b
    FROM
      logica_test.Down_sn_delta AS Down_sn_delta, t_1_Influenced AS t_2_Influenced
    WHERE
      (t_2_Influenced.a = Down_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f8.a AS a,
  Down_MultBodyAggAux_f8.b AS b
FROM
  t_1_Down_MultBodyAggAux_f8 AS Down_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Down_sn_step.a AS a,
  Down_sn_step.b AS b
FROM
  t_0_Down_sn_step AS Down_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_step.a) AND
    (Down_sn_full.b = Down_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_1_Down_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_sn_new.a AS a,
      t_2_Influenced.b AS b
    FROM
      logica_test.Down_sn_new AS Down_sn_new, t_1_Influenced AS t_2_Influenced
    WHERE
      (t_2_Influenced.a = Down_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_back_step AS (SELECT
  Down_MultBodyAggAux_f1.a AS a,
  Down_MultBodyAggAux_f1.b AS b
FROM
  t_1_Down_MultBodyAggAux_f1 AS Down_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Down_sn_back_step.a AS a,
  Down_sn_back_step.b AS b
FROM
  t_0_Down_sn_back_step AS Down_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_back_step.a) AND
    (Down_sn_full.b = Down_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_delta;

DROP TABLE IF EXISTS logica_test.Down_sn_new;
CREATE TABLE logica_test.Down_sn_new AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_1_Down_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_sn_delta.a AS a,
      t_2_Influenced.b AS b
    FROM
      logica_test.Down_sn_delta AS Down_sn_delta, t_1_Influenced AS t_2_Influenced
    WHERE
      (t_2_Influenced.a = Down_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f8.a AS a,
  Down_MultBodyAggAux_f8.b AS b
FROM
  t_1_Down_MultBodyAggAux_f8 AS Down_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Down_sn_step.a AS a,
  Down_sn_step.b AS b
FROM
  t_0_Down_sn_step AS Down_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_step.a) AND
    (Down_sn_full.b = Down_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_1_Down_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_sn_new.a AS a,
      t_2_Influenced.b AS b
    FROM
      logica_test.Down_sn_new AS Down_sn_new, t_1_Influenced AS t_2_Influenced
    WHERE
      (t_2_Influenced.a = Down_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_back_step AS (SELECT
  Down_MultBodyAggAux_f1.a AS a,
  Down_MultBodyAggAux_f1.b AS b
FROM
  t_1_Down_MultBodyAggAux_f1 AS Down_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Down_sn_back_step.a AS a,
  Down_sn_back_step.b AS b
FROM
  t_0_Down_sn_back_step AS Down_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_back_step.a) AND
    (Down_sn_full.b = Down_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_delta;

DROP TABLE IF EXISTS logica_test.Down_sn_new;
CREATE TABLE logica_test.Down_sn_new AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_1_Down_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_sn_delta.a AS a,
      t_2_Influenced.b AS b
    FROM
      logica_test.Down_sn_delta AS Down_sn_delta, t_1_Influenced AS t_2_Influenced
    WHERE
      (t_2_Influenced.a = Down_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f8.a AS a,
  Down_MultBodyAggAux_f8.b AS b
FROM
  t_1_Down_MultBodyAggAux_f8 AS Down_MultBodyAggAux_f8
GROUP BY 1, 2)
SELECT
  Down_sn_step.a AS a,
  Down_sn_step.b AS b
FROM
  t_0_Down_sn_step AS Down_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_step.a) AND
    (Down_sn_full.b = Down_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS WITH t_1_Influenced AS (SELECT * FROM VALUES
  ("austen", "tolkien"),
  ("tolkien", "herbert"),
  ("herbert", "gibson"),
  ("asimov", "herbert")
AS UNUSED_TABLE_NAME(a, b)),
t_1_Down_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_sn_new.a AS a,
      t_2_Influenced.b AS b
    FROM
      logica_test.Down_sn_new AS Down_sn_new, t_1_Influenced AS t_2_Influenced
    WHERE
      (t_2_Influenced.a = Down_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_back_step AS (SELECT
  Down_MultBodyAggAux_f1.a AS a,
  Down_MultBodyAggAux_f1.b AS b
FROM
  t_1_Down_MultBodyAggAux_f1 AS Down_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Down_sn_back_step.a AS a,
  Down_sn_back_step.b AS b
FROM
  t_0_Down_sn_back_step AS Down_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_back_step.a) AND
    (Down_sn_full.b = Down_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_delta;

SELECT
  Down_sn_full.a AS a
FROM
  logica_test.Down_sn_full AS Down_sn_full
WHERE
  ("gibson" = Down_sn_full.b) ORDER BY a NULLS LAST;