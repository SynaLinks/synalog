-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.Test_ifr0 CASCADE;
CREATE TABLE logica_home.Test_ifr0 AS WITH t_0_Test_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f1.y AS y
FROM
  t_0_Test_MultBodyAggAux_f1 AS Test_MultBodyAggAux_f1
GROUP BY Test_MultBodyAggAux_f1.y;

-- Interacting with table logica_home.Test_ifr0

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr0 AS Test_ifr0, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr0.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_0_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y;

-- Interacting with table logica_home.Test_ifr1

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

-- Interacting with table logica_home.Test_ifr2

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

-- Interacting with table logica_home.Test_ifr1

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2 CASCADE;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1 CASCADE;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

WITH t_0_Test_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x)) as x_7
    WHERE
      (Test_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f5.y AS y
FROM
  t_0_Test_MultBodyAggAux_f5 AS Test_MultBodyAggAux_f5
GROUP BY Test_MultBodyAggAux_f5.y;