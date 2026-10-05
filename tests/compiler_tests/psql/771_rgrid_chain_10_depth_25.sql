-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS WITH t_0_R_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_f1.x AS x
FROM
  t_0_R_MultBodyAggAux_f1 AS R_MultBodyAggAux_f1
GROUP BY R_MultBodyAggAux_f1.x;

-- Interacting with table logica_home.R_sn_delta

DROP TABLE IF EXISTS logica_home.R_sn_full CASCADE;
CREATE TABLE logica_home.R_sn_full AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT * FROM (
  
    SELECT
      R_sn_delta.x AS x
    FROM
      logica_home.R_sn_delta AS R_sn_delta
   UNION ALL
  
    SELECT
      R_sn_step.x AS x
    FROM
      t_0_R_sn_step AS R_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_home.R_sn_full

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_new CASCADE;
CREATE TABLE logica_home.R_sn_new AS WITH t_1_R_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_11) + (1)) AS x
    FROM
      logica_home.R_sn_delta AS t_2_R_sn_delta, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_11
    WHERE
      (t_2_R_sn_delta.x = x_11)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_sn_step AS (SELECT
  R_MultBodyAggAux_f2.x AS x
FROM
  t_1_R_MultBodyAggAux_f2 AS R_MultBodyAggAux_f2
GROUP BY R_MultBodyAggAux_f2.x)
SELECT
  R_sn_step.x AS x
FROM
  t_0_R_sn_step AS R_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.R_sn_full AS R_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (R_sn_full.x = R_sn_step.x)) AS numeric) IS NULL)
GROUP BY R_sn_step.x;

INSERT INTO logica_home.R_sn_full SELECT * FROM logica_home.R_sn_new;

DROP TABLE IF EXISTS logica_home.R_sn_delta CASCADE;
CREATE TABLE logica_home.R_sn_delta AS SELECT
  R_sn_new.x AS x
FROM
  logica_home.R_sn_new AS R_sn_new;

SELECT
  R_sn_full.x AS x
FROM
  logica_home.R_sn_full AS R_sn_full ORDER BY x;