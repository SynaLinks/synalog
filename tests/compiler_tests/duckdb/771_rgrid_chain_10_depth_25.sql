-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_0_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_0_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x;

-- Interacting with table logica_home.R_sn_delta

DROP TABLE IF EXISTS logica_home.R_sn_t0;
CREATE TABLE logica_home.R_sn_t0 AS SELECT
  R_sn_delta.x AS x
FROM
  logica_home.R_sn_delta AS R_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_home.R_sn_t0

DROP TABLE IF EXISTS logica_home.R_sn_t1;
CREATE TABLE logica_home.R_sn_t1 AS WITH t_1_R_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_t0 AS R_sn_t0, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_t0.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r1 AS (SELECT
  R_MultBodyAggAux_f3.x AS x
FROM
  t_1_R_MultBodyAggAux_f3 AS R_MultBodyAggAux_f3
GROUP BY R_MultBodyAggAux_f3.x)
SELECT
  R_sn_r1.x AS x
FROM
  t_0_R_sn_r1 AS R_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_home.R_sn_t1

DROP TABLE IF EXISTS logica_home.R_sn_t2;
CREATE TABLE logica_home.R_sn_t2 AS WITH t_1_R_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_t1 AS R_sn_t1, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_t1.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r2 AS (SELECT
  R_MultBodyAggAux_f4.x AS x
FROM
  t_1_R_MultBodyAggAux_f4 AS R_MultBodyAggAux_f4
GROUP BY R_MultBodyAggAux_f4.x)
SELECT
  R_sn_r2.x AS x
FROM
  t_0_R_sn_r2 AS R_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_home.R_sn_t2

DROP TABLE IF EXISTS logica_home.R_sn_t3;
CREATE TABLE logica_home.R_sn_t3 AS WITH t_1_R_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_t2 AS R_sn_t2, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_t2.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_r3 AS (SELECT
  R_MultBodyAggAux_f5.x AS x
FROM
  t_1_R_MultBodyAggAux_f5 AS R_MultBodyAggAux_f5
GROUP BY R_MultBodyAggAux_f5.x)
SELECT
  R_sn_r3.x AS x
FROM
  t_0_R_sn_r3 AS R_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_home.R_sn_t3

DROP TABLE IF EXISTS logica_home.R_sn_full;
CREATE TABLE logica_home.R_sn_full AS SELECT * FROM (
  
    SELECT
      R_sn_delta.x AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta
   UNION ALL
  
    SELECT
      R_sn_t1.x AS x
    FROM
      logica_home.R_sn_t1 AS R_sn_t1
   UNION ALL
  
    SELECT
      R_sn_t2.x AS x
    FROM
      logica_home.R_sn_t2 AS R_sn_t2
   UNION ALL
  
    SELECT
      R_sn_t3.x AS x
    FROM
      logica_home.R_sn_t3 AS R_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_home.R_sn_full

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_1_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_new AS R_sn_new, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_new.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_back_step AS (SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_1_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x)
SELECT
  R_sn_back_step.x AS x
FROM
  t_0_R_sn_back_step AS R_sn_back_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_back_step.x)) IS NULL)
GROUP BY R_sn_back_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_delta;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta, (select unnest(Range(10)) as unnested_pod) as x_9
    WHERE
      (R_sn_delta.x = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_f6 AS R_MultBodyAggAux_f6
GROUP BY R_MultBodyAggAux_f6.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

SELECT
  R_sn_full.x AS x
FROM
  logica_home.R_sn_full AS R_sn_full ORDER BY x;