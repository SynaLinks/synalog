-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.Even_ifr0 CASCADE;
CREATE TABLE logica_home.Even_ifr0 AS WITH t_0_Even_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f1.n AS n
FROM
  t_0_Even_MultBodyAggAux_f1 AS Even_MultBodyAggAux_f1
GROUP BY Even_MultBodyAggAux_f1.n;

-- Interacting with table logica_home.Even_ifr0

DROP TABLE IF EXISTS logica_home.Odd_ifr1 CASCADE;
CREATE TABLE logica_home.Odd_ifr1 AS SELECT
  ((Even_ifr0.n) + (1)) AS n
FROM
  logica_home.Even_ifr0 AS Even_ifr0
WHERE
  (Even_ifr0.n < 22)
GROUP BY ((Even_ifr0.n) + (1));

-- Interacting with table logica_home.Odd_ifr1

DROP TABLE IF EXISTS logica_home.Even_ifr2 CASCADE;
CREATE TABLE logica_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr1.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr1 AS Odd_ifr1
    WHERE
      (Odd_ifr1.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f5.n AS n
FROM
  t_0_Even_MultBodyAggAux_f5 AS Even_MultBodyAggAux_f5
GROUP BY Even_MultBodyAggAux_f5.n;

-- Interacting with table logica_home.Even_ifr2

DROP TABLE IF EXISTS logica_home.Odd_ifr3 CASCADE;
CREATE TABLE logica_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  logica_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 22)
GROUP BY ((Even_ifr2.n) + (1));

-- Interacting with table logica_home.Odd_ifr3

DROP TABLE IF EXISTS logica_home.Even_ifr4 CASCADE;
CREATE TABLE logica_home.Even_ifr4 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

-- Interacting with table logica_home.Even_ifr4

DROP TABLE IF EXISTS logica_home.Odd_ifr3 CASCADE;
CREATE TABLE logica_home.Odd_ifr3 AS SELECT
  ((Even_ifr4.n) + (1)) AS n
FROM
  logica_home.Even_ifr4 AS Even_ifr4
WHERE
  (Even_ifr4.n < 22)
GROUP BY ((Even_ifr4.n) + (1));

-- Interacting with table logica_home.Odd_ifr3

DROP TABLE IF EXISTS logica_home.Even_ifr1 CASCADE;
CREATE TABLE logica_home.Even_ifr1 AS WITH t_0_Even_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f4.n AS n
FROM
  t_0_Even_MultBodyAggAux_f4 AS Even_MultBodyAggAux_f4
GROUP BY Even_MultBodyAggAux_f4.n;

-- Interacting with table logica_home.Even_ifr1

DROP TABLE IF EXISTS logica_home.Odd_ifr2 CASCADE;
CREATE TABLE logica_home.Odd_ifr2 AS SELECT
  ((Even_ifr1.n) + (1)) AS n
FROM
  logica_home.Even_ifr1 AS Even_ifr1
WHERE
  (Even_ifr1.n < 22)
GROUP BY ((Even_ifr1.n) + (1));

-- Interacting with table logica_home.Odd_ifr2

DROP TABLE IF EXISTS logica_home.Even_ifr3 CASCADE;
CREATE TABLE logica_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

-- Interacting with table logica_home.Even_ifr3

DROP TABLE IF EXISTS logica_home.Odd_ifr4 CASCADE;
CREATE TABLE logica_home.Odd_ifr4 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  logica_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 22)
GROUP BY ((Even_ifr3.n) + (1));

-- Interacting with table logica_home.Odd_ifr4

DROP TABLE IF EXISTS logica_home.Even_ifr3 CASCADE;
CREATE TABLE logica_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr4.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr4 AS Odd_ifr4
    WHERE
      (Odd_ifr4.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.n AS n
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY Even_MultBodyAggAux_f12.n;

-- Interacting with table logica_home.Even_ifr3

DROP TABLE IF EXISTS logica_home.Even_ifr4 CASCADE;
CREATE TABLE logica_home.Even_ifr4 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr4 CASCADE;
CREATE TABLE logica_home.Odd_ifr4 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  logica_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 22)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr3 CASCADE;
CREATE TABLE logica_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr4.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr4 AS Odd_ifr4
    WHERE
      (Odd_ifr4.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.n AS n
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY Even_MultBodyAggAux_f12.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr3 CASCADE;
CREATE TABLE logica_home.Odd_ifr3 AS SELECT
  ((Even_ifr4.n) + (1)) AS n
FROM
  logica_home.Even_ifr4 AS Even_ifr4
WHERE
  (Even_ifr4.n < 22)
GROUP BY ((Even_ifr4.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr4 CASCADE;
CREATE TABLE logica_home.Even_ifr4 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr4 CASCADE;
CREATE TABLE logica_home.Odd_ifr4 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  logica_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 22)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr3 CASCADE;
CREATE TABLE logica_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr4.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr4 AS Odd_ifr4
    WHERE
      (Odd_ifr4.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.n AS n
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY Even_MultBodyAggAux_f12.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr3 CASCADE;
CREATE TABLE logica_home.Odd_ifr3 AS SELECT
  ((Even_ifr4.n) + (1)) AS n
FROM
  logica_home.Even_ifr4 AS Even_ifr4
WHERE
  (Even_ifr4.n < 22)
GROUP BY ((Even_ifr4.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr4 CASCADE;
CREATE TABLE logica_home.Even_ifr4 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr4 CASCADE;
CREATE TABLE logica_home.Odd_ifr4 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  logica_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 22)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr3 CASCADE;
CREATE TABLE logica_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr4.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr4 AS Odd_ifr4
    WHERE
      (Odd_ifr4.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.n AS n
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY Even_MultBodyAggAux_f12.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr3 CASCADE;
CREATE TABLE logica_home.Odd_ifr3 AS SELECT
  ((Even_ifr4.n) + (1)) AS n
FROM
  logica_home.Even_ifr4 AS Even_ifr4
WHERE
  (Even_ifr4.n < 22)
GROUP BY ((Even_ifr4.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr4 CASCADE;
CREATE TABLE logica_home.Even_ifr4 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr4 CASCADE;
CREATE TABLE logica_home.Odd_ifr4 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  logica_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 22)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr3 CASCADE;
CREATE TABLE logica_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr4.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr4 AS Odd_ifr4
    WHERE
      (Odd_ifr4.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.n AS n
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY Even_MultBodyAggAux_f12.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr3 CASCADE;
CREATE TABLE logica_home.Odd_ifr3 AS SELECT
  ((Even_ifr4.n) + (1)) AS n
FROM
  logica_home.Even_ifr4 AS Even_ifr4
WHERE
  (Even_ifr4.n < 22)
GROUP BY ((Even_ifr4.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr4 CASCADE;
CREATE TABLE logica_home.Even_ifr4 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr4 CASCADE;
CREATE TABLE logica_home.Odd_ifr4 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  logica_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 22)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr3 CASCADE;
CREATE TABLE logica_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr4.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr4 AS Odd_ifr4
    WHERE
      (Odd_ifr4.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.n AS n
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY Even_MultBodyAggAux_f12.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr3 CASCADE;
CREATE TABLE logica_home.Odd_ifr3 AS SELECT
  ((Even_ifr4.n) + (1)) AS n
FROM
  logica_home.Even_ifr4 AS Even_ifr4
WHERE
  (Even_ifr4.n < 22)
GROUP BY ((Even_ifr4.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr4 CASCADE;
CREATE TABLE logica_home.Even_ifr4 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr4 CASCADE;
CREATE TABLE logica_home.Odd_ifr4 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  logica_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 22)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr3 CASCADE;
CREATE TABLE logica_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr4.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr4 AS Odd_ifr4
    WHERE
      (Odd_ifr4.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.n AS n
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY Even_MultBodyAggAux_f12.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr3 CASCADE;
CREATE TABLE logica_home.Odd_ifr3 AS SELECT
  ((Even_ifr4.n) + (1)) AS n
FROM
  logica_home.Even_ifr4 AS Even_ifr4
WHERE
  (Even_ifr4.n < 22)
GROUP BY ((Even_ifr4.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr4 CASCADE;
CREATE TABLE logica_home.Even_ifr4 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr4 CASCADE;
CREATE TABLE logica_home.Odd_ifr4 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  logica_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 22)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr3 CASCADE;
CREATE TABLE logica_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr4.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr4 AS Odd_ifr4
    WHERE
      (Odd_ifr4.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.n AS n
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY Even_MultBodyAggAux_f12.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr3 CASCADE;
CREATE TABLE logica_home.Odd_ifr3 AS SELECT
  ((Even_ifr4.n) + (1)) AS n
FROM
  logica_home.Even_ifr4 AS Even_ifr4
WHERE
  (Even_ifr4.n < 22)
GROUP BY ((Even_ifr4.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr4 CASCADE;
CREATE TABLE logica_home.Even_ifr4 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr4 CASCADE;
CREATE TABLE logica_home.Odd_ifr4 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  logica_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 22)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr3 CASCADE;
CREATE TABLE logica_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr4.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr4 AS Odd_ifr4
    WHERE
      (Odd_ifr4.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.n AS n
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY Even_MultBodyAggAux_f12.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr3 CASCADE;
CREATE TABLE logica_home.Odd_ifr3 AS SELECT
  ((Even_ifr4.n) + (1)) AS n
FROM
  logica_home.Even_ifr4 AS Even_ifr4
WHERE
  (Even_ifr4.n < 22)
GROUP BY ((Even_ifr4.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr4 CASCADE;
CREATE TABLE logica_home.Even_ifr4 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr4 CASCADE;
CREATE TABLE logica_home.Odd_ifr4 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  logica_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 22)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS logica_home.Even_ifr3 CASCADE;
CREATE TABLE logica_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr4.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr4 AS Odd_ifr4
    WHERE
      (Odd_ifr4.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.n AS n
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY Even_MultBodyAggAux_f12.n;

DROP TABLE IF EXISTS logica_home.Odd_ifr3 CASCADE;
CREATE TABLE logica_home.Odd_ifr3 AS SELECT
  ((Even_ifr4.n) + (1)) AS n
FROM
  logica_home.Even_ifr4 AS Even_ifr4
WHERE
  (Even_ifr4.n < 22)
GROUP BY ((Even_ifr4.n) + (1));

DROP TABLE IF EXISTS logica_home.Even CASCADE;
CREATE TABLE logica_home.Even AS WITH t_0_Even_MultBodyAggAux_f13 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr5.n) + (1)) AS n
    FROM
      logica_home.Odd_ifr3 AS Odd_ifr5
    WHERE
      (Odd_ifr5.n < 22)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f13.n AS n
FROM
  t_0_Even_MultBodyAggAux_f13 AS Even_MultBodyAggAux_f13
GROUP BY Even_MultBodyAggAux_f13.n;

-- Interacting with table logica_home.Even

DROP TABLE IF EXISTS logica_home.Odd CASCADE;
CREATE TABLE logica_home.Odd AS SELECT
  ((Even_ifr5.n) + (1)) AS n
FROM
  logica_home.Even_ifr3 AS Even_ifr5
WHERE
  (Even_ifr5.n < 22)
GROUP BY ((Even_ifr5.n) + (1));

-- Interacting with table logica_home.Odd

WITH t_0_Top_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Even.n AS t
    FROM
      logica_home.Even AS Even
   UNION ALL
  
    SELECT
      Odd.n AS t
    FROM
      logica_home.Odd AS Odd
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(Top_MultBodyAggAux.t) AS t
FROM
  t_0_Top_MultBodyAggAux AS Top_MultBodyAggAux;