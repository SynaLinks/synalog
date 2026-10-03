-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS logica_home.Test_ifr0;
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

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr0 AS Test_ifr0, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr0.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f2.y AS y
FROM
  t_0_Test_MultBodyAggAux_f2 AS Test_MultBodyAggAux_f2
GROUP BY Test_MultBodyAggAux_f2.y;

-- Interacting with table logica_home.Test_ifr1

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

-- Interacting with table logica_home.Test_ifr2

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

-- Interacting with table logica_home.Test_ifr1

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f4.y AS y
FROM
  t_0_Test_MultBodyAggAux_f4 AS Test_MultBodyAggAux_f4
GROUP BY Test_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_home.Test_ifr2;
CREATE TABLE logica_home.Test_ifr2 AS WITH t_0_Test_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr1, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr1.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f3.y AS y
FROM
  t_0_Test_MultBodyAggAux_f3 AS Test_MultBodyAggAux_f3
GROUP BY Test_MultBodyAggAux_f3.y;

DROP TABLE IF EXISTS logica_home.Test_ifr1;
CREATE TABLE logica_home.Test_ifr1 AS WITH t_0_Test_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr2 AS Test_ifr2, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr2.y = x_7.unnested_pod)
  
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
      ((x_7.unnested_pod) + (1)) AS y
    FROM
      logica_home.Test_ifr1 AS Test_ifr3, (select unnest(Range(100)) as unnested_pod) as x_7
    WHERE
      (Test_ifr3.y = x_7.unnested_pod)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Test_MultBodyAggAux_f5.y AS y
FROM
  t_0_Test_MultBodyAggAux_f5 AS Test_MultBodyAggAux_f5
GROUP BY Test_MultBodyAggAux_f5.y;