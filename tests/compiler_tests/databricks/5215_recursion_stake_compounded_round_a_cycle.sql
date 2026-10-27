DROP TABLE IF EXISTS synalog_test.C_sn_delta;
CREATE TABLE synalog_test.C_sn_delta AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_0_C_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_1_Own.owner AS owner,
      t_1_Own.owned AS entity,
      1 AS hops,
      t_1_Own.percent AS stake
    FROM
      t_2_Own AS t_1_Own
  
) AS UNUSED_TABLE_NAME  )
SELECT
  C_MultBodyAggAux_f2.owner AS owner,
  C_MultBodyAggAux_f2.entity AS entity,
  C_MultBodyAggAux_f2.hops AS hops,
  C_MultBodyAggAux_f2.stake AS stake
FROM
  t_0_C_MultBodyAggAux_f2 AS C_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4;

-- Interacting with table synalog_test.C_sn_delta

DROP TABLE IF EXISTS synalog_test.C_sn_t0;
CREATE TABLE synalog_test.C_sn_t0 AS SELECT
  C_sn_delta.owner AS owner,
  C_sn_delta.entity AS entity,
  C_sn_delta.hops AS hops,
  C_sn_delta.stake AS stake
FROM
  synalog_test.C_sn_delta AS C_sn_delta
WHERE
  (1 = 0);

-- Interacting with table synalog_test.C_sn_t0

DROP TABLE IF EXISTS synalog_test.C_sn_t1;
CREATE TABLE synalog_test.C_sn_t1 AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      C_sn_t0.owner AS owner,
      Own.owned AS entity,
      ((C_sn_t0.hops) + (1)) AS hops,
      ((C_sn_t0.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_t0 AS C_sn_t0, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_t0.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_r1 AS (SELECT
  C_MultBodyAggAux_f3.owner AS owner,
  C_MultBodyAggAux_f3.entity AS entity,
  C_MultBodyAggAux_f3.hops AS hops,
  C_MultBodyAggAux_f3.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f3 AS C_MultBodyAggAux_f3
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_r1.owner AS owner,
  C_sn_r1.entity AS entity,
  C_sn_r1.hops AS hops,
  C_sn_r1.stake AS stake
FROM
  t_0_C_sn_r1 AS C_sn_r1
WHERE
  (1 = 0);

-- Interacting with table synalog_test.C_sn_t1

DROP TABLE IF EXISTS synalog_test.C_sn_t2;
CREATE TABLE synalog_test.C_sn_t2 AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      C_sn_t1.owner AS owner,
      Own.owned AS entity,
      ((C_sn_t1.hops) + (1)) AS hops,
      ((C_sn_t1.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_t1 AS C_sn_t1, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_t1.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_r2 AS (SELECT
  C_MultBodyAggAux_f4.owner AS owner,
  C_MultBodyAggAux_f4.entity AS entity,
  C_MultBodyAggAux_f4.hops AS hops,
  C_MultBodyAggAux_f4.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f4 AS C_MultBodyAggAux_f4
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_r2.owner AS owner,
  C_sn_r2.entity AS entity,
  C_sn_r2.hops AS hops,
  C_sn_r2.stake AS stake
FROM
  t_0_C_sn_r2 AS C_sn_r2
WHERE
  (1 = 0);

-- Interacting with table synalog_test.C_sn_t2

DROP TABLE IF EXISTS synalog_test.C_sn_t3;
CREATE TABLE synalog_test.C_sn_t3 AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      C_sn_t2.owner AS owner,
      Own.owned AS entity,
      ((C_sn_t2.hops) + (1)) AS hops,
      ((C_sn_t2.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_t2 AS C_sn_t2, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_t2.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_r3 AS (SELECT
  C_MultBodyAggAux_f5.owner AS owner,
  C_MultBodyAggAux_f5.entity AS entity,
  C_MultBodyAggAux_f5.hops AS hops,
  C_MultBodyAggAux_f5.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f5 AS C_MultBodyAggAux_f5
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_r3.owner AS owner,
  C_sn_r3.entity AS entity,
  C_sn_r3.hops AS hops,
  C_sn_r3.stake AS stake
FROM
  t_0_C_sn_r3 AS C_sn_r3
WHERE
  (1 = 0);

-- Interacting with table synalog_test.C_sn_t3

DROP TABLE IF EXISTS synalog_test.C_sn_t4;
CREATE TABLE synalog_test.C_sn_t4 AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      C_sn_t3.owner AS owner,
      Own.owned AS entity,
      ((C_sn_t3.hops) + (1)) AS hops,
      ((C_sn_t3.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_t3 AS C_sn_t3, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_t3.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_r4 AS (SELECT
  C_MultBodyAggAux_f6.owner AS owner,
  C_MultBodyAggAux_f6.entity AS entity,
  C_MultBodyAggAux_f6.hops AS hops,
  C_MultBodyAggAux_f6.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f6 AS C_MultBodyAggAux_f6
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_r4.owner AS owner,
  C_sn_r4.entity AS entity,
  C_sn_r4.hops AS hops,
  C_sn_r4.stake AS stake
FROM
  t_0_C_sn_r4 AS C_sn_r4
WHERE
  (1 = 0);

-- Interacting with table synalog_test.C_sn_t4

DROP TABLE IF EXISTS synalog_test.C_sn_t5;
CREATE TABLE synalog_test.C_sn_t5 AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      C_sn_t4.owner AS owner,
      Own.owned AS entity,
      ((C_sn_t4.hops) + (1)) AS hops,
      ((C_sn_t4.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_t4 AS C_sn_t4, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_t4.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_r5 AS (SELECT
  C_MultBodyAggAux_f7.owner AS owner,
  C_MultBodyAggAux_f7.entity AS entity,
  C_MultBodyAggAux_f7.hops AS hops,
  C_MultBodyAggAux_f7.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f7 AS C_MultBodyAggAux_f7
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_r5.owner AS owner,
  C_sn_r5.entity AS entity,
  C_sn_r5.hops AS hops,
  C_sn_r5.stake AS stake
FROM
  t_0_C_sn_r5 AS C_sn_r5
WHERE
  (1 = 0);

-- Interacting with table synalog_test.C_sn_t5

DROP TABLE IF EXISTS synalog_test.C_sn_t6;
CREATE TABLE synalog_test.C_sn_t6 AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      C_sn_t5.owner AS owner,
      Own.owned AS entity,
      ((C_sn_t5.hops) + (1)) AS hops,
      ((C_sn_t5.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_t5 AS C_sn_t5, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_t5.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_r6 AS (SELECT
  C_MultBodyAggAux_f8.owner AS owner,
  C_MultBodyAggAux_f8.entity AS entity,
  C_MultBodyAggAux_f8.hops AS hops,
  C_MultBodyAggAux_f8.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f8 AS C_MultBodyAggAux_f8
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_r6.owner AS owner,
  C_sn_r6.entity AS entity,
  C_sn_r6.hops AS hops,
  C_sn_r6.stake AS stake
FROM
  t_0_C_sn_r6 AS C_sn_r6
WHERE
  (1 = 0);

-- Interacting with table synalog_test.C_sn_t6

DROP TABLE IF EXISTS synalog_test.C_sn_t7;
CREATE TABLE synalog_test.C_sn_t7 AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      C_sn_t6.owner AS owner,
      Own.owned AS entity,
      ((C_sn_t6.hops) + (1)) AS hops,
      ((C_sn_t6.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_t6 AS C_sn_t6, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_t6.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_r7 AS (SELECT
  C_MultBodyAggAux_f9.owner AS owner,
  C_MultBodyAggAux_f9.entity AS entity,
  C_MultBodyAggAux_f9.hops AS hops,
  C_MultBodyAggAux_f9.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f9 AS C_MultBodyAggAux_f9
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_r7.owner AS owner,
  C_sn_r7.entity AS entity,
  C_sn_r7.hops AS hops,
  C_sn_r7.stake AS stake
FROM
  t_0_C_sn_r7 AS C_sn_r7
WHERE
  (1 = 0);

-- Interacting with table synalog_test.C_sn_t7

DROP TABLE IF EXISTS synalog_test.C_sn_t8;
CREATE TABLE synalog_test.C_sn_t8 AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      C_sn_t7.owner AS owner,
      Own.owned AS entity,
      ((C_sn_t7.hops) + (1)) AS hops,
      ((C_sn_t7.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_t7 AS C_sn_t7, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_t7.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_r8 AS (SELECT
  C_MultBodyAggAux_f10.owner AS owner,
  C_MultBodyAggAux_f10.entity AS entity,
  C_MultBodyAggAux_f10.hops AS hops,
  C_MultBodyAggAux_f10.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f10 AS C_MultBodyAggAux_f10
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_r8.owner AS owner,
  C_sn_r8.entity AS entity,
  C_sn_r8.hops AS hops,
  C_sn_r8.stake AS stake
FROM
  t_0_C_sn_r8 AS C_sn_r8
WHERE
  (1 = 0);

-- Interacting with table synalog_test.C_sn_t8

DROP TABLE IF EXISTS synalog_test.C_sn_t9;
CREATE TABLE synalog_test.C_sn_t9 AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f11 AS (SELECT * FROM (
  
    SELECT
      C_sn_t8.owner AS owner,
      Own.owned AS entity,
      ((C_sn_t8.hops) + (1)) AS hops,
      ((C_sn_t8.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_t8 AS C_sn_t8, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_t8.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_r9 AS (SELECT
  C_MultBodyAggAux_f11.owner AS owner,
  C_MultBodyAggAux_f11.entity AS entity,
  C_MultBodyAggAux_f11.hops AS hops,
  C_MultBodyAggAux_f11.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f11 AS C_MultBodyAggAux_f11
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_r9.owner AS owner,
  C_sn_r9.entity AS entity,
  C_sn_r9.hops AS hops,
  C_sn_r9.stake AS stake
FROM
  t_0_C_sn_r9 AS C_sn_r9
WHERE
  (1 = 0);

-- Interacting with table synalog_test.C_sn_t9

DROP TABLE IF EXISTS synalog_test.C_sn_full;
CREATE TABLE synalog_test.C_sn_full AS SELECT * FROM (
  
    SELECT
      C_sn_delta.owner AS owner,
      C_sn_delta.entity AS entity,
      C_sn_delta.hops AS hops,
      C_sn_delta.stake AS stake
    FROM
      synalog_test.C_sn_delta AS C_sn_delta
   UNION ALL
  
    SELECT
      C_sn_t1.owner AS owner,
      C_sn_t1.entity AS entity,
      C_sn_t1.hops AS hops,
      C_sn_t1.stake AS stake
    FROM
      synalog_test.C_sn_t1 AS C_sn_t1
   UNION ALL
  
    SELECT
      C_sn_t2.owner AS owner,
      C_sn_t2.entity AS entity,
      C_sn_t2.hops AS hops,
      C_sn_t2.stake AS stake
    FROM
      synalog_test.C_sn_t2 AS C_sn_t2
   UNION ALL
  
    SELECT
      C_sn_t3.owner AS owner,
      C_sn_t3.entity AS entity,
      C_sn_t3.hops AS hops,
      C_sn_t3.stake AS stake
    FROM
      synalog_test.C_sn_t3 AS C_sn_t3
   UNION ALL
  
    SELECT
      C_sn_t4.owner AS owner,
      C_sn_t4.entity AS entity,
      C_sn_t4.hops AS hops,
      C_sn_t4.stake AS stake
    FROM
      synalog_test.C_sn_t4 AS C_sn_t4
   UNION ALL
  
    SELECT
      C_sn_t5.owner AS owner,
      C_sn_t5.entity AS entity,
      C_sn_t5.hops AS hops,
      C_sn_t5.stake AS stake
    FROM
      synalog_test.C_sn_t5 AS C_sn_t5
   UNION ALL
  
    SELECT
      C_sn_t6.owner AS owner,
      C_sn_t6.entity AS entity,
      C_sn_t6.hops AS hops,
      C_sn_t6.stake AS stake
    FROM
      synalog_test.C_sn_t6 AS C_sn_t6
   UNION ALL
  
    SELECT
      C_sn_t7.owner AS owner,
      C_sn_t7.entity AS entity,
      C_sn_t7.hops AS hops,
      C_sn_t7.stake AS stake
    FROM
      synalog_test.C_sn_t7 AS C_sn_t7
   UNION ALL
  
    SELECT
      C_sn_t8.owner AS owner,
      C_sn_t8.entity AS entity,
      C_sn_t8.hops AS hops,
      C_sn_t8.stake AS stake
    FROM
      synalog_test.C_sn_t8 AS C_sn_t8
   UNION ALL
  
    SELECT
      C_sn_t9.owner AS owner,
      C_sn_t9.entity AS entity,
      C_sn_t9.hops AS hops,
      C_sn_t9.stake AS stake
    FROM
      synalog_test.C_sn_t9 AS C_sn_t9
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table synalog_test.C_sn_full

DROP TABLE IF EXISTS synalog_test.C_sn_new;
CREATE TABLE synalog_test.C_sn_new AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      C_sn_delta.owner AS owner,
      Own.owned AS entity,
      ((C_sn_delta.hops) + (1)) AS hops,
      ((C_sn_delta.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_delta AS C_sn_delta, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_delta.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_step AS (SELECT
  C_MultBodyAggAux_f12.owner AS owner,
  C_MultBodyAggAux_f12.entity AS entity,
  C_MultBodyAggAux_f12.hops AS hops,
  C_MultBodyAggAux_f12.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f12 AS C_MultBodyAggAux_f12
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_step.owner AS owner,
  C_sn_step.entity AS entity,
  C_sn_step.hops AS hops,
  C_sn_step.stake AS stake
FROM
  t_0_C_sn_step AS C_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.C_sn_full AS C_sn_full
  WHERE
    (C_sn_full.owner <=> C_sn_step.owner) AND
    (C_sn_full.entity <=> C_sn_step.entity) AND
    (C_sn_full.hops <=> C_sn_step.hops) AND
    (C_sn_full.stake <=> C_sn_step.stake)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO synalog_test.C_sn_full SELECT * FROM synalog_test.C_sn_new;

DROP TABLE IF EXISTS synalog_test.C_sn_delta;
CREATE TABLE synalog_test.C_sn_delta AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      C_sn_new.owner AS owner,
      Own.owned AS entity,
      ((C_sn_new.hops) + (1)) AS hops,
      ((C_sn_new.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_new AS C_sn_new, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_new.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_back_step AS (SELECT
  C_MultBodyAggAux_f1.owner AS owner,
  C_MultBodyAggAux_f1.entity AS entity,
  C_MultBodyAggAux_f1.hops AS hops,
  C_MultBodyAggAux_f1.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f1 AS C_MultBodyAggAux_f1
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_back_step.owner AS owner,
  C_sn_back_step.entity AS entity,
  C_sn_back_step.hops AS hops,
  C_sn_back_step.stake AS stake
FROM
  t_0_C_sn_back_step AS C_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.C_sn_full AS C_sn_full
  WHERE
    (C_sn_full.owner <=> C_sn_back_step.owner) AND
    (C_sn_full.entity <=> C_sn_back_step.entity) AND
    (C_sn_full.hops <=> C_sn_back_step.hops) AND
    (C_sn_full.stake <=> C_sn_back_step.stake)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO synalog_test.C_sn_full SELECT * FROM synalog_test.C_sn_delta;

DROP TABLE IF EXISTS synalog_test.C_sn_new;
CREATE TABLE synalog_test.C_sn_new AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      C_sn_delta.owner AS owner,
      Own.owned AS entity,
      ((C_sn_delta.hops) + (1)) AS hops,
      ((C_sn_delta.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_delta AS C_sn_delta, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_delta.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_step AS (SELECT
  C_MultBodyAggAux_f12.owner AS owner,
  C_MultBodyAggAux_f12.entity AS entity,
  C_MultBodyAggAux_f12.hops AS hops,
  C_MultBodyAggAux_f12.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f12 AS C_MultBodyAggAux_f12
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_step.owner AS owner,
  C_sn_step.entity AS entity,
  C_sn_step.hops AS hops,
  C_sn_step.stake AS stake
FROM
  t_0_C_sn_step AS C_sn_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.C_sn_full AS C_sn_full
  WHERE
    (C_sn_full.owner <=> C_sn_step.owner) AND
    (C_sn_full.entity <=> C_sn_step.entity) AND
    (C_sn_full.hops <=> C_sn_step.hops) AND
    (C_sn_full.stake <=> C_sn_step.stake)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO synalog_test.C_sn_full SELECT * FROM synalog_test.C_sn_new;

DROP TABLE IF EXISTS synalog_test.C_sn_delta;
CREATE TABLE synalog_test.C_sn_delta AS WITH t_2_Own AS (SELECT * FROM VALUES
  ("a", "b", 50),
  ("b", "c", 40),
  ("c", "a", 10)
AS UNUSED_TABLE_NAME(owner, owned, percent)),
t_1_C_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      C_sn_new.owner AS owner,
      Own.owned AS entity,
      ((C_sn_new.hops) + (1)) AS hops,
      ((C_sn_new.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      synalog_test.C_sn_new AS C_sn_new, t_2_Own AS Own
    WHERE
      (Own.owner <=> C_sn_new.entity)
   UNION ALL
  
    SELECT
      t_2_Own.owner AS owner,
      t_2_Own.owned AS entity,
      1 AS hops,
      t_2_Own.percent AS stake
    FROM
      t_2_Own
  
) AS UNUSED_TABLE_NAME  ),
t_0_C_sn_back_step AS (SELECT
  C_MultBodyAggAux_f1.owner AS owner,
  C_MultBodyAggAux_f1.entity AS entity,
  C_MultBodyAggAux_f1.hops AS hops,
  C_MultBodyAggAux_f1.stake AS stake
FROM
  t_1_C_MultBodyAggAux_f1 AS C_MultBodyAggAux_f1
GROUP BY 1, 2, 3, 4)
SELECT
  C_sn_back_step.owner AS owner,
  C_sn_back_step.entity AS entity,
  C_sn_back_step.hops AS hops,
  C_sn_back_step.stake AS stake
FROM
  t_0_C_sn_back_step AS C_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    synalog_test.C_sn_full AS C_sn_full
  WHERE
    (C_sn_full.owner <=> C_sn_back_step.owner) AND
    (C_sn_full.entity <=> C_sn_back_step.entity) AND
    (C_sn_full.hops <=> C_sn_back_step.hops) AND
    (C_sn_full.stake <=> C_sn_back_step.stake)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO synalog_test.C_sn_full SELECT * FROM synalog_test.C_sn_delta;

SELECT
  C_sn_full.owner AS owner,
  C_sn_full.entity AS entity,
  C_sn_full.hops AS hops,
  C_sn_full.stake AS stake
FROM
  synalog_test.C_sn_full AS C_sn_full ORDER BY hops NULLS LAST, owner NULLS LAST, entity NULLS LAST;