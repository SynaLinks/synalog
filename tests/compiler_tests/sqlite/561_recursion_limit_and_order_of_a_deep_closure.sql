ATTACH DATABASE ':memory:' AS logica_test;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_0_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_0_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y;

-- Interacting with table logica_test.R_sn_delta

DROP TABLE IF EXISTS logica_test.R_sn_t0;
CREATE TABLE logica_test.R_sn_t0 AS SELECT
  R_sn_delta.y AS y
FROM
  logica_test.R_sn_delta AS R_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t0

DROP TABLE IF EXISTS logica_test.R_sn_t1;
CREATE TABLE logica_test.R_sn_t1 AS WITH t_1_R_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_t0 AS R_sn_t0, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_t0.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r1 AS (SELECT
  R_MultBodyAggAux_f3.y AS y
FROM
  t_1_R_MultBodyAggAux_f3 AS R_MultBodyAggAux_f3
GROUP BY R_MultBodyAggAux_f3.y)
SELECT
  R_sn_r1.y AS y
FROM
  t_0_R_sn_r1 AS R_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t1

DROP TABLE IF EXISTS logica_test.R_sn_t2;
CREATE TABLE logica_test.R_sn_t2 AS WITH t_1_R_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_t1 AS R_sn_t1, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_t1.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r2 AS (SELECT
  R_MultBodyAggAux_f4.y AS y
FROM
  t_1_R_MultBodyAggAux_f4 AS R_MultBodyAggAux_f4
GROUP BY R_MultBodyAggAux_f4.y)
SELECT
  R_sn_r2.y AS y
FROM
  t_0_R_sn_r2 AS R_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t2

DROP TABLE IF EXISTS logica_test.R_sn_t3;
CREATE TABLE logica_test.R_sn_t3 AS WITH t_1_R_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_t2 AS R_sn_t2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_t2.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r3 AS (SELECT
  R_MultBodyAggAux_f5.y AS y
FROM
  t_1_R_MultBodyAggAux_f5 AS R_MultBodyAggAux_f5
GROUP BY R_MultBodyAggAux_f5.y)
SELECT
  R_sn_r3.y AS y
FROM
  t_0_R_sn_r3 AS R_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.R_sn_t3

DROP TABLE IF EXISTS logica_test.R_sn_full;
CREATE TABLE logica_test.R_sn_full AS SELECT * FROM (
  
    SELECT
      R_sn_delta.y AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta
   UNION ALL
  
    SELECT
      R_sn_t1.y AS y
    FROM
      logica_test.R_sn_t1 AS R_sn_t1
   UNION ALL
  
    SELECT
      R_sn_t2.y AS y
    FROM
      logica_test.R_sn_t2 AS R_sn_t2
   UNION ALL
  
    SELECT
      R_sn_t3.y AS y
    FROM
      logica_test.R_sn_t3 AS R_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.R_sn_full

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

DROP TABLE IF EXISTS logica_test.R_sn_new;
CREATE TABLE logica_test.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_delta AS R_sn_delta, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_delta.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.y AS y
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_new;

DROP TABLE IF EXISTS logica_test.R_sn_delta;
CREATE TABLE logica_test.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.value) + (1)) AS y
    FROM
      logica_test.R_sn_new AS R_sn_new, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_9
    WHERE
      (R_sn_new.y = x_9.value)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y)
SELECT
  R_sn_back_step.y AS y
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_12.value)) AS logica_value
  FROM
    logica_test.R_sn_full AS R_sn_full, JSON_EACH(JSON_ARRAY(0)) as x_12
  WHERE
    (R_sn_full.y = R_sn_back_step.y)) IS NULL)
GROUP BY R_sn_back_step.y;

INSERT INTO logica_test.R_sn_full SELECT * FROM logica_test.R_sn_delta;

SELECT
  R_sn_full.y AS y
FROM
  logica_test.R_sn_full AS R_sn_full ORDER BY y desc LIMIT 3;