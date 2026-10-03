-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.Reach_ifr0 CASCADE;
CREATE TABLE logica_home.Reach_ifr0 AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
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

-- Interacting with table logica_home.Reach_ifr0

DROP TABLE IF EXISTS logica_home.Reach_ifr1 CASCADE;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr0.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr0 AS Reach_ifr0, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr0.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f2.x AS x,
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x, Reach_MultBodyAggAux_f2.y;

-- Interacting with table logica_home.Reach_ifr1

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr1.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr1.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x,
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x, Reach_MultBodyAggAux_f3.y;

-- Interacting with table logica_home.Reach_ifr2

DROP TABLE IF EXISTS logica_home.Reach_ifr3 CASCADE;
CREATE TABLE logica_home.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x, Reach_MultBodyAggAux_f4.y;

-- Interacting with table logica_home.Reach_ifr3

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr3 AS Reach_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x, Reach_MultBodyAggAux_f5.y;

-- Interacting with table logica_home.Reach_ifr2

DROP TABLE IF EXISTS logica_home.Reach_ifr3 CASCADE;
CREATE TABLE logica_home.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x, Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr3 AS Reach_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x, Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr3 CASCADE;
CREATE TABLE logica_home.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x, Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr3 AS Reach_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x, Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr3 CASCADE;
CREATE TABLE logica_home.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x, Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr3 AS Reach_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x, Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr3 CASCADE;
CREATE TABLE logica_home.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x, Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr3 AS Reach_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x, Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr3 CASCADE;
CREATE TABLE logica_home.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x, Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr3 AS Reach_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x, Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr3 CASCADE;
CREATE TABLE logica_home.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x, Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr3 AS Reach_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x, Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr3 CASCADE;
CREATE TABLE logica_home.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x, Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr3 AS Reach_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x, Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr3 CASCADE;
CREATE TABLE logica_home.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x, Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr3 AS Reach_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x, Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr3 CASCADE;
CREATE TABLE logica_home.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x, Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr3 AS Reach_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x, Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr3 CASCADE;
CREATE TABLE logica_home.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr2.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr2.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x,
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x, Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2 CASCADE;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr3.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr3 AS Reach_ifr3, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr3.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x,
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x, Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_home.Reach CASCADE;
CREATE TABLE logica_home.Reach AS WITH t_0_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      x_9 AS x,
      ((x_9) + (1)) AS y
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_9
   UNION ALL
  
    SELECT
      Reach_ifr4.x AS x,
      ((x_17) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr4, UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x)) as x_17
    WHERE
      (Reach_ifr4.y = x_17)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f6.x AS x,
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY Reach_MultBodyAggAux_f6.x, Reach_MultBodyAggAux_f6.y;

-- Interacting with table logica_home.Reach

SELECT
  SUM(1) AS n
FROM
  logica_home.Reach AS Reach;