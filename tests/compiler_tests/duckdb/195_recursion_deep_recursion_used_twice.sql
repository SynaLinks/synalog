-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS logica_home.Reach_ifr0;
CREATE TABLE logica_home.Reach_ifr0 AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY Reach_MultBodyAggAux_f1.y;

-- Interacting with table logica_home.Reach_ifr0

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr0 AS Reach_ifr0, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr0.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.y;

-- Interacting with table logica_home.Reach_ifr1

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

-- Interacting with table logica_home.Reach_ifr2

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

-- Interacting with table logica_home.Reach_ifr1

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Reach;
CREATE TABLE logica_home.Reach AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr3, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Reach_ifr3.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

-- Interacting with table logica_home.Reach

WITH t_0_Far AS (SELECT
  MAX(Reach.y) AS m
FROM
  logica_home.Reach AS Reach),
t_1_Count AS (SELECT
  SUM(1) AS n
FROM
  logica_home.Reach AS t_2_Reach)
SELECT
  Far.m AS m,
  Count.n AS n
FROM
  t_0_Far AS Far, t_1_Count AS Count;