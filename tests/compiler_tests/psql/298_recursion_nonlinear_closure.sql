-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS synalog_home.Path_ifr0 CASCADE;
CREATE TABLE synalog_home.Path_ifr0 AS WITH t_0_Path_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f1.a AS a,
  Path_MultBodyAggAux_f1.b AS b
FROM
  t_0_Path_MultBodyAggAux_f1 AS Path_MultBodyAggAux_f1
GROUP BY Path_MultBodyAggAux_f1.a, Path_MultBodyAggAux_f1.b;

-- Interacting with table synalog_home.Path_ifr0

DROP TABLE IF EXISTS synalog_home.Path_ifr1 CASCADE;
CREATE TABLE synalog_home.Path_ifr1 AS WITH t_0_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Path_ifr0.a AS a,
      t_1_Path_ifr0.b AS b
    FROM
      synalog_home.Path_ifr0 AS Path_ifr0, synalog_home.Path_ifr0 AS t_1_Path_ifr0
    WHERE
      (COALESCE(t_1_Path_ifr0.a, 0) = COALESCE(Path_ifr0.b, 0) AND (t_1_Path_ifr0.a IS NULL) = (Path_ifr0.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b
FROM
  t_0_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b;

-- Interacting with table synalog_home.Path_ifr1

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Path_ifr1.a AS a,
      t_1_Path_ifr1.b AS b
    FROM
      synalog_home.Path_ifr1 AS Path_ifr1, synalog_home.Path_ifr1 AS t_1_Path_ifr1
    WHERE
      (COALESCE(t_1_Path_ifr1.a, 0) = COALESCE(Path_ifr1.b, 0) AND (t_1_Path_ifr1.a IS NULL) = (Path_ifr1.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f3.a AS a,
  Path_MultBodyAggAux_f3.b AS b
FROM
  t_0_Path_MultBodyAggAux_f3 AS Path_MultBodyAggAux_f3
GROUP BY Path_MultBodyAggAux_f3.a, Path_MultBodyAggAux_f3.b;

-- Interacting with table synalog_home.Path_ifr2

DROP TABLE IF EXISTS synalog_home.Path_ifr3 CASCADE;
CREATE TABLE synalog_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2, synalog_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (COALESCE(t_1_Path_ifr2.a, 0) = COALESCE(Path_ifr2.b, 0) AND (t_1_Path_ifr2.a IS NULL) = (Path_ifr2.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

-- Interacting with table synalog_home.Path_ifr3

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_home.Path_ifr3 AS Path_ifr3, synalog_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (COALESCE(t_1_Path_ifr3.a, 0) = COALESCE(Path_ifr3.b, 0) AND (t_1_Path_ifr3.a IS NULL) = (Path_ifr3.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

-- Interacting with table synalog_home.Path_ifr2

DROP TABLE IF EXISTS synalog_home.Path_ifr3 CASCADE;
CREATE TABLE synalog_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2, synalog_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (COALESCE(t_1_Path_ifr2.a, 0) = COALESCE(Path_ifr2.b, 0) AND (t_1_Path_ifr2.a IS NULL) = (Path_ifr2.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_home.Path_ifr3 AS Path_ifr3, synalog_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (COALESCE(t_1_Path_ifr3.a, 0) = COALESCE(Path_ifr3.b, 0) AND (t_1_Path_ifr3.a IS NULL) = (Path_ifr3.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr3 CASCADE;
CREATE TABLE synalog_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2, synalog_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (COALESCE(t_1_Path_ifr2.a, 0) = COALESCE(Path_ifr2.b, 0) AND (t_1_Path_ifr2.a IS NULL) = (Path_ifr2.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_home.Path_ifr3 AS Path_ifr3, synalog_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (COALESCE(t_1_Path_ifr3.a, 0) = COALESCE(Path_ifr3.b, 0) AND (t_1_Path_ifr3.a IS NULL) = (Path_ifr3.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr3 CASCADE;
CREATE TABLE synalog_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2, synalog_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (COALESCE(t_1_Path_ifr2.a, 0) = COALESCE(Path_ifr2.b, 0) AND (t_1_Path_ifr2.a IS NULL) = (Path_ifr2.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_home.Path_ifr3 AS Path_ifr3, synalog_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (COALESCE(t_1_Path_ifr3.a, 0) = COALESCE(Path_ifr3.b, 0) AND (t_1_Path_ifr3.a IS NULL) = (Path_ifr3.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr3 CASCADE;
CREATE TABLE synalog_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2, synalog_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (COALESCE(t_1_Path_ifr2.a, 0) = COALESCE(Path_ifr2.b, 0) AND (t_1_Path_ifr2.a IS NULL) = (Path_ifr2.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_home.Path_ifr3 AS Path_ifr3, synalog_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (COALESCE(t_1_Path_ifr3.a, 0) = COALESCE(Path_ifr3.b, 0) AND (t_1_Path_ifr3.a IS NULL) = (Path_ifr3.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr3 CASCADE;
CREATE TABLE synalog_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2, synalog_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (COALESCE(t_1_Path_ifr2.a, 0) = COALESCE(Path_ifr2.b, 0) AND (t_1_Path_ifr2.a IS NULL) = (Path_ifr2.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_home.Path_ifr3 AS Path_ifr3, synalog_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (COALESCE(t_1_Path_ifr3.a, 0) = COALESCE(Path_ifr3.b, 0) AND (t_1_Path_ifr3.a IS NULL) = (Path_ifr3.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr3 CASCADE;
CREATE TABLE synalog_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2, synalog_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (COALESCE(t_1_Path_ifr2.a, 0) = COALESCE(Path_ifr2.b, 0) AND (t_1_Path_ifr2.a IS NULL) = (Path_ifr2.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_home.Path_ifr3 AS Path_ifr3, synalog_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (COALESCE(t_1_Path_ifr3.a, 0) = COALESCE(Path_ifr3.b, 0) AND (t_1_Path_ifr3.a IS NULL) = (Path_ifr3.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr3 CASCADE;
CREATE TABLE synalog_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2, synalog_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (COALESCE(t_1_Path_ifr2.a, 0) = COALESCE(Path_ifr2.b, 0) AND (t_1_Path_ifr2.a IS NULL) = (Path_ifr2.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_home.Path_ifr3 AS Path_ifr3, synalog_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (COALESCE(t_1_Path_ifr3.a, 0) = COALESCE(Path_ifr3.b, 0) AND (t_1_Path_ifr3.a IS NULL) = (Path_ifr3.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr3 CASCADE;
CREATE TABLE synalog_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2, synalog_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (COALESCE(t_1_Path_ifr2.a, 0) = COALESCE(Path_ifr2.b, 0) AND (t_1_Path_ifr2.a IS NULL) = (Path_ifr2.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_home.Path_ifr3 AS Path_ifr3, synalog_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (COALESCE(t_1_Path_ifr3.a, 0) = COALESCE(Path_ifr3.b, 0) AND (t_1_Path_ifr3.a IS NULL) = (Path_ifr3.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr3 CASCADE;
CREATE TABLE synalog_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2, synalog_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (COALESCE(t_1_Path_ifr2.a, 0) = COALESCE(Path_ifr2.b, 0) AND (t_1_Path_ifr2.a IS NULL) = (Path_ifr2.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_home.Path_ifr3 AS Path_ifr3, synalog_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (COALESCE(t_1_Path_ifr3.a, 0) = COALESCE(Path_ifr3.b, 0) AND (t_1_Path_ifr3.a IS NULL) = (Path_ifr3.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr3 CASCADE;
CREATE TABLE synalog_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr2, synalog_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (COALESCE(t_1_Path_ifr2.a, 0) = COALESCE(Path_ifr2.b, 0) AND (t_1_Path_ifr2.a IS NULL) = (Path_ifr2.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS synalog_home.Path_ifr2 CASCADE;
CREATE TABLE synalog_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_home.Path_ifr3 AS Path_ifr3, synalog_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (COALESCE(t_1_Path_ifr3.a, 0) = COALESCE(Path_ifr3.b, 0) AND (t_1_Path_ifr3.a IS NULL) = (Path_ifr3.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS synalog_home.Path CASCADE;
CREATE TABLE synalog_home.Path AS WITH t_0_Path_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Path_ifr4.a AS a,
      t_1_Path_ifr4.b AS b
    FROM
      synalog_home.Path_ifr2 AS Path_ifr4, synalog_home.Path_ifr2 AS t_1_Path_ifr4
    WHERE
      (COALESCE(t_1_Path_ifr4.a, 0) = COALESCE(Path_ifr4.b, 0) AND (t_1_Path_ifr4.a IS NULL) = (Path_ifr4.b IS NULL))
   UNION ALL
  
    SELECT
      x_15 AS a,
      ((x_15) + (1)) AS b
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 9 - 1) as x), '{}')) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f6.a AS a,
  Path_MultBodyAggAux_f6.b AS b
FROM
  t_0_Path_MultBodyAggAux_f6 AS Path_MultBodyAggAux_f6
GROUP BY Path_MultBodyAggAux_f6.a, Path_MultBodyAggAux_f6.b;

-- Interacting with table synalog_home.Path

SELECT
  SUM(1) AS n
FROM
  synalog_home.Path AS Path;