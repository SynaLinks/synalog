DROP TABLE IF EXISTS logica_test.Need_sn_delta;
CREATE TABLE logica_test.Need_sn_delta AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_1_Uses.part AS part,
      t_1_Uses.component AS component,
      t_1_Uses.component AS path_id,
      t_1_Uses.qty AS n
    FROM
      t_2_Uses AS t_1_Uses
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Need_MultBodyAggAux_f2.part AS part,
  Need_MultBodyAggAux_f2.component AS component,
  Need_MultBodyAggAux_f2.path_id AS path_id,
  Need_MultBodyAggAux_f2.n AS n
FROM
  t_0_Need_MultBodyAggAux_f2 AS Need_MultBodyAggAux_f2
GROUP BY 1, 2, 3, 4;

-- Interacting with table logica_test.Need_sn_delta

DROP TABLE IF EXISTS logica_test.Need_sn_t0;
CREATE TABLE logica_test.Need_sn_t0 AS SELECT
  Need_sn_delta.part AS part,
  Need_sn_delta.component AS component,
  Need_sn_delta.path_id AS path_id,
  Need_sn_delta.n AS n
FROM
  logica_test.Need_sn_delta AS Need_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Need_sn_t0

DROP TABLE IF EXISTS logica_test.Need_sn_t1;
CREATE TABLE logica_test.Need_sn_t1 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Need_sn_t0.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_t0.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_t0.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_t0 AS Need_sn_t0, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_t0.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_r1 AS (SELECT
  Need_MultBodyAggAux_f3.part AS part,
  Need_MultBodyAggAux_f3.component AS component,
  Need_MultBodyAggAux_f3.path_id AS path_id,
  Need_MultBodyAggAux_f3.n AS n
FROM
  t_1_Need_MultBodyAggAux_f3 AS Need_MultBodyAggAux_f3
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_r1.part AS part,
  Need_sn_r1.component AS component,
  Need_sn_r1.path_id AS path_id,
  Need_sn_r1.n AS n
FROM
  t_0_Need_sn_r1 AS Need_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Need_sn_t1

DROP TABLE IF EXISTS logica_test.Need_sn_t2;
CREATE TABLE logica_test.Need_sn_t2 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Need_sn_t1.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_t1.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_t1.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_t1 AS Need_sn_t1, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_t1.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_r2 AS (SELECT
  Need_MultBodyAggAux_f4.part AS part,
  Need_MultBodyAggAux_f4.component AS component,
  Need_MultBodyAggAux_f4.path_id AS path_id,
  Need_MultBodyAggAux_f4.n AS n
FROM
  t_1_Need_MultBodyAggAux_f4 AS Need_MultBodyAggAux_f4
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_r2.part AS part,
  Need_sn_r2.component AS component,
  Need_sn_r2.path_id AS path_id,
  Need_sn_r2.n AS n
FROM
  t_0_Need_sn_r2 AS Need_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Need_sn_t2

DROP TABLE IF EXISTS logica_test.Need_sn_t3;
CREATE TABLE logica_test.Need_sn_t3 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Need_sn_t2.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_t2.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_t2.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_t2 AS Need_sn_t2, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_t2.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_r3 AS (SELECT
  Need_MultBodyAggAux_f5.part AS part,
  Need_MultBodyAggAux_f5.component AS component,
  Need_MultBodyAggAux_f5.path_id AS path_id,
  Need_MultBodyAggAux_f5.n AS n
FROM
  t_1_Need_MultBodyAggAux_f5 AS Need_MultBodyAggAux_f5
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_r3.part AS part,
  Need_sn_r3.component AS component,
  Need_sn_r3.path_id AS path_id,
  Need_sn_r3.n AS n
FROM
  t_0_Need_sn_r3 AS Need_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Need_sn_t3

DROP TABLE IF EXISTS logica_test.Need_sn_t4;
CREATE TABLE logica_test.Need_sn_t4 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Need_sn_t3.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_t3.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_t3.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_t3 AS Need_sn_t3, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_t3.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_r4 AS (SELECT
  Need_MultBodyAggAux_f6.part AS part,
  Need_MultBodyAggAux_f6.component AS component,
  Need_MultBodyAggAux_f6.path_id AS path_id,
  Need_MultBodyAggAux_f6.n AS n
FROM
  t_1_Need_MultBodyAggAux_f6 AS Need_MultBodyAggAux_f6
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_r4.part AS part,
  Need_sn_r4.component AS component,
  Need_sn_r4.path_id AS path_id,
  Need_sn_r4.n AS n
FROM
  t_0_Need_sn_r4 AS Need_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.Need_sn_t4

DROP TABLE IF EXISTS logica_test.Need_sn_t5;
CREATE TABLE logica_test.Need_sn_t5 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Need_sn_t4.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_t4.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_t4.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_t4 AS Need_sn_t4, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_t4.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_r5 AS (SELECT
  Need_MultBodyAggAux_f7.part AS part,
  Need_MultBodyAggAux_f7.component AS component,
  Need_MultBodyAggAux_f7.path_id AS path_id,
  Need_MultBodyAggAux_f7.n AS n
FROM
  t_1_Need_MultBodyAggAux_f7 AS Need_MultBodyAggAux_f7
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_r5.part AS part,
  Need_sn_r5.component AS component,
  Need_sn_r5.path_id AS path_id,
  Need_sn_r5.n AS n
FROM
  t_0_Need_sn_r5 AS Need_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.Need_sn_t5

DROP TABLE IF EXISTS logica_test.Need_sn_t6;
CREATE TABLE logica_test.Need_sn_t6 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Need_sn_t5.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_t5.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_t5.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_t5 AS Need_sn_t5, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_t5.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_r6 AS (SELECT
  Need_MultBodyAggAux_f8.part AS part,
  Need_MultBodyAggAux_f8.component AS component,
  Need_MultBodyAggAux_f8.path_id AS path_id,
  Need_MultBodyAggAux_f8.n AS n
FROM
  t_1_Need_MultBodyAggAux_f8 AS Need_MultBodyAggAux_f8
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_r6.part AS part,
  Need_sn_r6.component AS component,
  Need_sn_r6.path_id AS path_id,
  Need_sn_r6.n AS n
FROM
  t_0_Need_sn_r6 AS Need_sn_r6
WHERE
  (1 = 0);

-- Interacting with table logica_test.Need_sn_t6

DROP TABLE IF EXISTS logica_test.Need_sn_t7;
CREATE TABLE logica_test.Need_sn_t7 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Need_sn_t6.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_t6.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_t6.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_t6 AS Need_sn_t6, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_t6.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_r7 AS (SELECT
  Need_MultBodyAggAux_f9.part AS part,
  Need_MultBodyAggAux_f9.component AS component,
  Need_MultBodyAggAux_f9.path_id AS path_id,
  Need_MultBodyAggAux_f9.n AS n
FROM
  t_1_Need_MultBodyAggAux_f9 AS Need_MultBodyAggAux_f9
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_r7.part AS part,
  Need_sn_r7.component AS component,
  Need_sn_r7.path_id AS path_id,
  Need_sn_r7.n AS n
FROM
  t_0_Need_sn_r7 AS Need_sn_r7
WHERE
  (1 = 0);

-- Interacting with table logica_test.Need_sn_t7

DROP TABLE IF EXISTS logica_test.Need_sn_t8;
CREATE TABLE logica_test.Need_sn_t8 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      Need_sn_t7.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_t7.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_t7.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_t7 AS Need_sn_t7, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_t7.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_r8 AS (SELECT
  Need_MultBodyAggAux_f10.part AS part,
  Need_MultBodyAggAux_f10.component AS component,
  Need_MultBodyAggAux_f10.path_id AS path_id,
  Need_MultBodyAggAux_f10.n AS n
FROM
  t_1_Need_MultBodyAggAux_f10 AS Need_MultBodyAggAux_f10
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_r8.part AS part,
  Need_sn_r8.component AS component,
  Need_sn_r8.path_id AS path_id,
  Need_sn_r8.n AS n
FROM
  t_0_Need_sn_r8 AS Need_sn_r8
WHERE
  (1 = 0);

-- Interacting with table logica_test.Need_sn_t8

DROP TABLE IF EXISTS logica_test.Need_sn_t9;
CREATE TABLE logica_test.Need_sn_t9 AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f11 AS (SELECT * FROM (
  
    SELECT
      Need_sn_t8.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_t8.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_t8.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_t8 AS Need_sn_t8, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_t8.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_r9 AS (SELECT
  Need_MultBodyAggAux_f11.part AS part,
  Need_MultBodyAggAux_f11.component AS component,
  Need_MultBodyAggAux_f11.path_id AS path_id,
  Need_MultBodyAggAux_f11.n AS n
FROM
  t_1_Need_MultBodyAggAux_f11 AS Need_MultBodyAggAux_f11
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_r9.part AS part,
  Need_sn_r9.component AS component,
  Need_sn_r9.path_id AS path_id,
  Need_sn_r9.n AS n
FROM
  t_0_Need_sn_r9 AS Need_sn_r9
WHERE
  (1 = 0);

-- Interacting with table logica_test.Need_sn_t9

DROP TABLE IF EXISTS logica_test.Need_sn_full;
CREATE TABLE logica_test.Need_sn_full AS SELECT * FROM (
  
    SELECT
      Need_sn_delta.part AS part,
      Need_sn_delta.component AS component,
      Need_sn_delta.path_id AS path_id,
      Need_sn_delta.n AS n
    FROM
      logica_test.Need_sn_delta AS Need_sn_delta
   UNION ALL
  
    SELECT
      Need_sn_t1.part AS part,
      Need_sn_t1.component AS component,
      Need_sn_t1.path_id AS path_id,
      Need_sn_t1.n AS n
    FROM
      logica_test.Need_sn_t1 AS Need_sn_t1
   UNION ALL
  
    SELECT
      Need_sn_t2.part AS part,
      Need_sn_t2.component AS component,
      Need_sn_t2.path_id AS path_id,
      Need_sn_t2.n AS n
    FROM
      logica_test.Need_sn_t2 AS Need_sn_t2
   UNION ALL
  
    SELECT
      Need_sn_t3.part AS part,
      Need_sn_t3.component AS component,
      Need_sn_t3.path_id AS path_id,
      Need_sn_t3.n AS n
    FROM
      logica_test.Need_sn_t3 AS Need_sn_t3
   UNION ALL
  
    SELECT
      Need_sn_t4.part AS part,
      Need_sn_t4.component AS component,
      Need_sn_t4.path_id AS path_id,
      Need_sn_t4.n AS n
    FROM
      logica_test.Need_sn_t4 AS Need_sn_t4
   UNION ALL
  
    SELECT
      Need_sn_t5.part AS part,
      Need_sn_t5.component AS component,
      Need_sn_t5.path_id AS path_id,
      Need_sn_t5.n AS n
    FROM
      logica_test.Need_sn_t5 AS Need_sn_t5
   UNION ALL
  
    SELECT
      Need_sn_t6.part AS part,
      Need_sn_t6.component AS component,
      Need_sn_t6.path_id AS path_id,
      Need_sn_t6.n AS n
    FROM
      logica_test.Need_sn_t6 AS Need_sn_t6
   UNION ALL
  
    SELECT
      Need_sn_t7.part AS part,
      Need_sn_t7.component AS component,
      Need_sn_t7.path_id AS path_id,
      Need_sn_t7.n AS n
    FROM
      logica_test.Need_sn_t7 AS Need_sn_t7
   UNION ALL
  
    SELECT
      Need_sn_t8.part AS part,
      Need_sn_t8.component AS component,
      Need_sn_t8.path_id AS path_id,
      Need_sn_t8.n AS n
    FROM
      logica_test.Need_sn_t8 AS Need_sn_t8
   UNION ALL
  
    SELECT
      Need_sn_t9.part AS part,
      Need_sn_t9.component AS component,
      Need_sn_t9.path_id AS path_id,
      Need_sn_t9.n AS n
    FROM
      logica_test.Need_sn_t9 AS Need_sn_t9
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Need_sn_full

DROP TABLE IF EXISTS logica_test.Need_sn_new;
CREATE TABLE logica_test.Need_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      Need_sn_delta.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_delta.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_delta.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_delta AS Need_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_delta.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_step AS (SELECT
  Need_MultBodyAggAux_f12.part AS part,
  Need_MultBodyAggAux_f12.component AS component,
  Need_MultBodyAggAux_f12.path_id AS path_id,
  Need_MultBodyAggAux_f12.n AS n
FROM
  t_1_Need_MultBodyAggAux_f12 AS Need_MultBodyAggAux_f12
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_step.part AS part,
  Need_sn_step.component AS component,
  Need_sn_step.path_id AS path_id,
  Need_sn_step.n AS n
FROM
  t_0_Need_sn_step AS Need_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_step.part) AND
    (Need_sn_full.component = Need_sn_step.component) AND
    (Need_sn_full.path_id = Need_sn_step.path_id) AND
    (Need_sn_full.n = Need_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_delta;
CREATE TABLE logica_test.Need_sn_delta AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Need_sn_new.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_new.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_new.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_new AS Need_sn_new, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_new.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_back_step AS (SELECT
  Need_MultBodyAggAux_f1.part AS part,
  Need_MultBodyAggAux_f1.component AS component,
  Need_MultBodyAggAux_f1.path_id AS path_id,
  Need_MultBodyAggAux_f1.n AS n
FROM
  t_1_Need_MultBodyAggAux_f1 AS Need_MultBodyAggAux_f1
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_back_step.part AS part,
  Need_sn_back_step.component AS component,
  Need_sn_back_step.path_id AS path_id,
  Need_sn_back_step.n AS n
FROM
  t_0_Need_sn_back_step AS Need_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_back_step.part) AND
    (Need_sn_full.component = Need_sn_back_step.component) AND
    (Need_sn_full.path_id = Need_sn_back_step.path_id) AND
    (Need_sn_full.n = Need_sn_back_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_delta;

DROP TABLE IF EXISTS logica_test.Need_sn_new;
CREATE TABLE logica_test.Need_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      Need_sn_delta.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_delta.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_delta.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_delta AS Need_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_delta.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_step AS (SELECT
  Need_MultBodyAggAux_f12.part AS part,
  Need_MultBodyAggAux_f12.component AS component,
  Need_MultBodyAggAux_f12.path_id AS path_id,
  Need_MultBodyAggAux_f12.n AS n
FROM
  t_1_Need_MultBodyAggAux_f12 AS Need_MultBodyAggAux_f12
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_step.part AS part,
  Need_sn_step.component AS component,
  Need_sn_step.path_id AS path_id,
  Need_sn_step.n AS n
FROM
  t_0_Need_sn_step AS Need_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_step.part) AND
    (Need_sn_full.component = Need_sn_step.component) AND
    (Need_sn_full.path_id = Need_sn_step.path_id) AND
    (Need_sn_full.n = Need_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_delta;
CREATE TABLE logica_test.Need_sn_delta AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Need_sn_new.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_new.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_new.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_new AS Need_sn_new, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_new.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_back_step AS (SELECT
  Need_MultBodyAggAux_f1.part AS part,
  Need_MultBodyAggAux_f1.component AS component,
  Need_MultBodyAggAux_f1.path_id AS path_id,
  Need_MultBodyAggAux_f1.n AS n
FROM
  t_1_Need_MultBodyAggAux_f1 AS Need_MultBodyAggAux_f1
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_back_step.part AS part,
  Need_sn_back_step.component AS component,
  Need_sn_back_step.path_id AS path_id,
  Need_sn_back_step.n AS n
FROM
  t_0_Need_sn_back_step AS Need_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_back_step.part) AND
    (Need_sn_full.component = Need_sn_back_step.component) AND
    (Need_sn_full.path_id = Need_sn_back_step.path_id) AND
    (Need_sn_full.n = Need_sn_back_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_delta;

DROP TABLE IF EXISTS logica_test.Need_sn_new;
CREATE TABLE logica_test.Need_sn_new AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      Need_sn_delta.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_delta.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_delta.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_delta AS Need_sn_delta, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_delta.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_step AS (SELECT
  Need_MultBodyAggAux_f12.part AS part,
  Need_MultBodyAggAux_f12.component AS component,
  Need_MultBodyAggAux_f12.path_id AS path_id,
  Need_MultBodyAggAux_f12.n AS n
FROM
  t_1_Need_MultBodyAggAux_f12 AS Need_MultBodyAggAux_f12
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_step.part AS part,
  Need_sn_step.component AS component,
  Need_sn_step.path_id AS path_id,
  Need_sn_step.n AS n
FROM
  t_0_Need_sn_step AS Need_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_step.part) AND
    (Need_sn_full.component = Need_sn_step.component) AND
    (Need_sn_full.path_id = Need_sn_step.path_id) AND
    (Need_sn_full.n = Need_sn_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_new;

DROP TABLE IF EXISTS logica_test.Need_sn_delta;
CREATE TABLE logica_test.Need_sn_delta AS WITH t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Need_sn_new.part AS part,
      Uses.component AS component,
      (CONCAT((CONCAT(Need_sn_new.path_id, '/')), Uses.component)) AS path_id,
      ((Need_sn_new.n) * (Uses.qty)) AS n
    FROM
      logica_test.Need_sn_new AS Need_sn_new, t_2_Uses AS Uses
    WHERE
      (Uses.part = Need_sn_new.component)
   UNION ALL
  
    SELECT
      t_2_Uses.part AS part,
      t_2_Uses.component AS component,
      t_2_Uses.component AS path_id,
      t_2_Uses.qty AS n
    FROM
      t_2_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Need_sn_back_step AS (SELECT
  Need_MultBodyAggAux_f1.part AS part,
  Need_MultBodyAggAux_f1.component AS component,
  Need_MultBodyAggAux_f1.path_id AS path_id,
  Need_MultBodyAggAux_f1.n AS n
FROM
  t_1_Need_MultBodyAggAux_f1 AS Need_MultBodyAggAux_f1
GROUP BY 1, 2, 3, 4)
SELECT
  Need_sn_back_step.part AS part,
  Need_sn_back_step.component AS component,
  Need_sn_back_step.path_id AS path_id,
  Need_sn_back_step.n AS n
FROM
  t_0_Need_sn_back_step AS Need_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Need_sn_full AS Need_sn_full
  WHERE
    (Need_sn_full.part = Need_sn_back_step.part) AND
    (Need_sn_full.component = Need_sn_back_step.component) AND
    (Need_sn_full.path_id = Need_sn_back_step.path_id) AND
    (Need_sn_full.n = Need_sn_back_step.n)) IS NULL)
GROUP BY 1, 2, 3, 4;

INSERT INTO logica_test.Need_sn_full SELECT * FROM logica_test.Need_sn_delta;

SELECT
  SUM(Need_sn_full.n) AS q
FROM
  logica_test.Need_sn_full AS Need_sn_full
WHERE
  ('scooter' = Need_sn_full.part) AND
  ('spoke' = Need_sn_full.component);