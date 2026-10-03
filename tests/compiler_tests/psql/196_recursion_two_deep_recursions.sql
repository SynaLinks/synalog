-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS WITH t_0_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_0_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY A_MultBodyAggAux_f1.y;

-- Interacting with table logica_home.A_sn_delta

DROP TABLE IF EXISTS logica_home.A_sn_full CASCADE;
CREATE TABLE logica_home.A_sn_full AS SELECT
  A_sn_delta.y AS y
FROM
  logica_home.A_sn_delta AS A_sn_delta;

-- Interacting with table logica_home.A_sn_full

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS WITH t_0_B_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f3.y AS y
FROM
  t_0_B_MultBodyAggAux_f3 AS B_MultBodyAggAux_f3
GROUP BY B_MultBodyAggAux_f3.y;

-- Interacting with table logica_home.B_sn_delta

DROP TABLE IF EXISTS logica_home.B_sn_full CASCADE;
CREATE TABLE logica_home.B_sn_full AS SELECT
  B_sn_delta.y AS y
FROM
  logica_home.B_sn_delta AS B_sn_delta;

-- Interacting with table logica_home.B_sn_full

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_new CASCADE;
CREATE TABLE logica_home.A_sn_new AS WITH t_1_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.A_sn_delta AS A_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (A_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_A_sn_step AS (SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_1_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY A_MultBodyAggAux_f2.y)
SELECT
  A_sn_step.y AS y
FROM
  t_0_A_sn_step AS A_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.A_sn_full AS A_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (A_sn_full.y = A_sn_step.y)) AS numeric) IS NULL)
GROUP BY A_sn_step.y;

INSERT INTO logica_home.A_sn_full SELECT * FROM logica_home.A_sn_new;

DROP TABLE IF EXISTS logica_home.A_sn_delta CASCADE;
CREATE TABLE logica_home.A_sn_delta AS SELECT
  A_sn_new.y AS y
FROM
  logica_home.A_sn_new AS A_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_new CASCADE;
CREATE TABLE logica_home.B_sn_new AS WITH t_1_B_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_9) + (1)) AS y
    FROM
      logica_home.B_sn_delta AS B_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_9
    WHERE
      (B_sn_delta.y = x_9)
  
) AS UNUSED_TABLE_NAME  ),
t_0_B_sn_step AS (SELECT
  B_MultBodyAggAux_f4.y AS y
FROM
  t_1_B_MultBodyAggAux_f4 AS B_MultBodyAggAux_f4
GROUP BY B_MultBodyAggAux_f4.y)
SELECT
  B_sn_step.y AS y
FROM
  t_0_B_sn_step AS B_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_12 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.B_sn_full AS B_sn_full, UNNEST(ARRAY[0]) as x_12
  WHERE
    (B_sn_full.y = B_sn_step.y)) AS numeric) IS NULL)
GROUP BY B_sn_step.y;

INSERT INTO logica_home.B_sn_full SELECT * FROM logica_home.B_sn_new;

DROP TABLE IF EXISTS logica_home.B_sn_delta CASCADE;
CREATE TABLE logica_home.B_sn_delta AS SELECT
  B_sn_new.y AS y
FROM
  logica_home.B_sn_new AS B_sn_new;

SELECT
  MAX(A_sn_full.y) AS a,
  MAX(B_sn_full.y) AS b
FROM
  logica_home.A_sn_full AS A_sn_full, logica_home.B_sn_full AS B_sn_full;