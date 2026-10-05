-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
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

DROP TABLE IF EXISTS logica_home.R_sn_full CASCADE;
CREATE TABLE logica_home.R_sn_full AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS y
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.y = x_11)
  
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
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.y = R_sn_step.y)) AS numeric) IS NULL)
GROUP BY R_sn_step.y;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.y AS y
FROM
  logica_home.R_sn_new AS R_sn_new;

SELECT
  R_sn_full.y AS y
FROM
  logica_home.R_sn_full AS R_sn_full ORDER BY y desc NULLS LAST LIMIT 2;