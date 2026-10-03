-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS WITH t_0_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_0_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY Test_MultBodyAggAux_f1.y;

-- Interacting with table logica_home.Test_sn_delta

DROP TABLE IF EXISTS logica_home.Test_sn_full;
CREATE TABLE logica_home.Test_sn_full AS SELECT
  Test_sn_delta.y AS y
FROM
  logica_home.Test_sn_delta AS Test_sn_delta;

-- Interacting with table logica_home.Test_sn_full

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_new;
CREATE TABLE logica_home.Test_sn_new AS WITH t_1_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_sn_delta AS Test_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Test_sn_delta.y = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Test_sn_step AS (SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_1_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y)
SELECT
  Test_sn_step.y AS y
FROM
  t_0_Test_sn_step AS Test_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Test_sn_full AS Test_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Test_sn_full.y = Test_sn_step.y)) IS NULL)
GROUP BY Test_sn_step.y;

INSERT INTO logica_home.Test_sn_full SELECT * FROM logica_home.Test_sn_new;

DROP TABLE IF EXISTS logica_home.Test_sn_delta;
CREATE TABLE logica_home.Test_sn_delta AS SELECT
  Test_sn_new.y AS y
FROM
  logica_home.Test_sn_new AS Test_sn_new;

SELECT
  Test_sn_full.y AS y
FROM
  logica_home.Test_sn_full AS Test_sn_full;