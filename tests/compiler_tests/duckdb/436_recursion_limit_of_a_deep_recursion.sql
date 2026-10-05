-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS WITH t_0_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_f1.y AS y
FROM
  t_0_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.y;

-- Interacting with table logica_home.R_sn_delta

DROP TABLE IF EXISTS logica_home.R_sn_full;
CREATE TABLE logica_home.R_sn_full AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT * FROM (
  
    SELECT
      R_sn_delta.y AS y
    FROM
      logica_home.R_sn_delta AS R_sn_delta
   UNION ALL
  
    SELECT
      R_sn_step.y AS y
    FROM
      t_0_R_sn_step AS R_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_home.R_sn_full

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11.unnested_pod) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.y AS y
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.y)
SELECT
  R_sn_step.y AS y
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

SELECT
  R_sn_full.y AS y
FROM
  logica_home.R_sn_full AS R_sn_full ORDER BY y desc LIMIT 2;