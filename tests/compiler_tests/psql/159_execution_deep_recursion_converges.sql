-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.x AS x,
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY Reach_MultBodyAggAux_f1.x, Reach_MultBodyAggAux_f1.y;

-- Interacting with table logica_home.Reach_sn_delta

DROP TABLE IF EXISTS logica_home.Reach_sn_full CASCADE;
CREATE TABLE logica_home.Reach_sn_full AS SELECT
  Reach_sn_delta.x AS x,
  Reach_sn_delta.y AS y
FROM
  logica_home.Reach_sn_delta AS Reach_sn_delta;

-- Interacting with table logica_home.Reach_sn_full

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_13 AS x,
      ((x_13) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_13
   UNION ALL
  
    SELECT
      Reach_sn_delta.x AS x,
      ((x_21) + (1)) AS y
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_21
    WHERE
      (Reach_sn_delta.y = x_21)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y)
SELECT
  Reach_sn_step.x AS x,
  Reach_sn_step.y AS y
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_25 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_25
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x) AND
    (Reach_sn_full.y = Reach_sn_step.y)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x, Reach_sn_step.y;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x,
  Reach_sn_new.y AS y
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

SELECT
  SUM(1) AS n
FROM
  logica_home.Reach_sn_full AS Reach_sn_full;