DROP TABLE IF EXISTS logica_test.Linked_sn_delta;
CREATE TABLE logica_test.Linked_sn_delta AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_0_Linked_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Linked_MultBodyAggAux_f2.a AS a,
  Linked_MultBodyAggAux_f2.b AS b
FROM
  t_0_Linked_MultBodyAggAux_f2 AS Linked_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table logica_test.Linked_sn_delta

DROP TABLE IF EXISTS logica_test.Linked_sn_t0;
CREATE TABLE logica_test.Linked_sn_t0 AS SELECT
  Linked_sn_delta.a AS a,
  Linked_sn_delta.b AS b
FROM
  logica_test.Linked_sn_delta AS Linked_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Linked_sn_t0

DROP TABLE IF EXISTS logica_test.Linked_sn_t1;
CREATE TABLE logica_test.Linked_sn_t1 AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_t0.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_t0 AS Linked_sn_t0, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_t0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_r1 AS (SELECT
  Linked_MultBodyAggAux_f3.a AS a,
  Linked_MultBodyAggAux_f3.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f3 AS Linked_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  Linked_sn_r1.a AS a,
  Linked_sn_r1.b AS b
FROM
  t_0_Linked_sn_r1 AS Linked_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Linked_sn_t1

DROP TABLE IF EXISTS logica_test.Linked_sn_t2;
CREATE TABLE logica_test.Linked_sn_t2 AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_t1.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_t1 AS Linked_sn_t1, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_t1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_r2 AS (SELECT
  Linked_MultBodyAggAux_f4.a AS a,
  Linked_MultBodyAggAux_f4.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f4 AS Linked_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  Linked_sn_r2.a AS a,
  Linked_sn_r2.b AS b
FROM
  t_0_Linked_sn_r2 AS Linked_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Linked_sn_t2

DROP TABLE IF EXISTS logica_test.Linked_sn_t3;
CREATE TABLE logica_test.Linked_sn_t3 AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_t2.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_t2 AS Linked_sn_t2, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_t2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_r3 AS (SELECT
  Linked_MultBodyAggAux_f5.a AS a,
  Linked_MultBodyAggAux_f5.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f5 AS Linked_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  Linked_sn_r3.a AS a,
  Linked_sn_r3.b AS b
FROM
  t_0_Linked_sn_r3 AS Linked_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Linked_sn_t3

DROP TABLE IF EXISTS logica_test.Linked_sn_t4;
CREATE TABLE logica_test.Linked_sn_t4 AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_t3.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_t3 AS Linked_sn_t3, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_t3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_r4 AS (SELECT
  Linked_MultBodyAggAux_f6.a AS a,
  Linked_MultBodyAggAux_f6.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f6 AS Linked_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  Linked_sn_r4.a AS a,
  Linked_sn_r4.b AS b
FROM
  t_0_Linked_sn_r4 AS Linked_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.Linked_sn_t4

DROP TABLE IF EXISTS logica_test.Linked_sn_t5;
CREATE TABLE logica_test.Linked_sn_t5 AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_t4.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_t4 AS Linked_sn_t4, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_t4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_r5 AS (SELECT
  Linked_MultBodyAggAux_f7.a AS a,
  Linked_MultBodyAggAux_f7.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f7 AS Linked_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Linked_sn_r5.a AS a,
  Linked_sn_r5.b AS b
FROM
  t_0_Linked_sn_r5 AS Linked_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.Linked_sn_t5

DROP TABLE IF EXISTS logica_test.Linked_sn_full;
CREATE TABLE logica_test.Linked_sn_full AS SELECT * FROM (
  
    SELECT
      Linked_sn_delta.a AS a,
      Linked_sn_delta.b AS b
    FROM
      logica_test.Linked_sn_delta AS Linked_sn_delta
   UNION ALL
  
    SELECT
      Linked_sn_t1.a AS a,
      Linked_sn_t1.b AS b
    FROM
      logica_test.Linked_sn_t1 AS Linked_sn_t1
   UNION ALL
  
    SELECT
      Linked_sn_t2.a AS a,
      Linked_sn_t2.b AS b
    FROM
      logica_test.Linked_sn_t2 AS Linked_sn_t2
   UNION ALL
  
    SELECT
      Linked_sn_t3.a AS a,
      Linked_sn_t3.b AS b
    FROM
      logica_test.Linked_sn_t3 AS Linked_sn_t3
   UNION ALL
  
    SELECT
      Linked_sn_t4.a AS a,
      Linked_sn_t4.b AS b
    FROM
      logica_test.Linked_sn_t4 AS Linked_sn_t4
   UNION ALL
  
    SELECT
      Linked_sn_t5.a AS a,
      Linked_sn_t5.b AS b
    FROM
      logica_test.Linked_sn_t5 AS Linked_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Linked_sn_full

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS Linked_sn_delta, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f8.a AS a,
  Linked_MultBodyAggAux_f8.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f8 AS Linked_MultBodyAggAux_f8
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
CREATE TABLE logica_test.Linked_sn_delta AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_new.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_new AS Linked_sn_new, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_back_step AS (SELECT
  Linked_MultBodyAggAux_f1.a AS a,
  Linked_MultBodyAggAux_f1.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f1 AS Linked_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Linked_sn_back_step.a AS a,
  Linked_sn_back_step.b AS b
FROM
  t_0_Linked_sn_back_step AS Linked_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_back_step.a) AND
    (Linked_sn_full.b = Linked_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_delta;

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS Linked_sn_delta, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f8.a AS a,
  Linked_MultBodyAggAux_f8.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f8 AS Linked_MultBodyAggAux_f8
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
CREATE TABLE logica_test.Linked_sn_delta AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_new.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_new AS Linked_sn_new, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_back_step AS (SELECT
  Linked_MultBodyAggAux_f1.a AS a,
  Linked_MultBodyAggAux_f1.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f1 AS Linked_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Linked_sn_back_step.a AS a,
  Linked_sn_back_step.b AS b
FROM
  t_0_Linked_sn_back_step AS Linked_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_back_step.a) AND
    (Linked_sn_full.b = Linked_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_delta;

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS Linked_sn_delta, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f8.a AS a,
  Linked_MultBodyAggAux_f8.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f8 AS Linked_MultBodyAggAux_f8
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
CREATE TABLE logica_test.Linked_sn_delta AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_new.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_new AS Linked_sn_new, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_back_step AS (SELECT
  Linked_MultBodyAggAux_f1.a AS a,
  Linked_MultBodyAggAux_f1.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f1 AS Linked_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Linked_sn_back_step.a AS a,
  Linked_sn_back_step.b AS b
FROM
  t_0_Linked_sn_back_step AS Linked_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_back_step.a) AND
    (Linked_sn_full.b = Linked_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_delta;

DROP TABLE IF EXISTS logica_test.Linked_sn_new;
CREATE TABLE logica_test.Linked_sn_new AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_delta.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_delta AS Linked_sn_delta, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_step AS (SELECT
  Linked_MultBodyAggAux_f8.a AS a,
  Linked_MultBodyAggAux_f8.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f8 AS Linked_MultBodyAggAux_f8
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
CREATE TABLE logica_test.Linked_sn_delta AS WITH t_3_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_1_Shares AS (SELECT
  HasPhone.account AS a,
  t_2_HasPhone.account AS b
FROM
  t_3_HasPhone AS HasPhone, t_3_HasPhone AS t_2_HasPhone
WHERE
  (HasPhone.account != t_2_HasPhone.account) AND
  (t_2_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2),
t_1_Linked_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_1_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_sn_new.a AS a,
      t_3_Shares.b AS b
    FROM
      logica_test.Linked_sn_new AS Linked_sn_new, t_1_Shares AS t_3_Shares
    WHERE
      (t_3_Shares.a = Linked_sn_new.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked_sn_back_step AS (SELECT
  Linked_MultBodyAggAux_f1.a AS a,
  Linked_MultBodyAggAux_f1.b AS b
FROM
  t_1_Linked_MultBodyAggAux_f1 AS Linked_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Linked_sn_back_step.a AS a,
  Linked_sn_back_step.b AS b
FROM
  t_0_Linked_sn_back_step AS Linked_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Linked_sn_full AS Linked_sn_full
  WHERE
    (Linked_sn_full.a = Linked_sn_back_step.a) AND
    (Linked_sn_full.b = Linked_sn_back_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Linked_sn_full SELECT * FROM logica_test.Linked_sn_delta;

SELECT
  Linked_sn_full.b AS b
FROM
  logica_test.Linked_sn_full AS Linked_sn_full
WHERE
  (Linked_sn_full.b != "a4") AND
  ("a4" = Linked_sn_full.a)
GROUP BY 1 ORDER BY b NULLS LAST;