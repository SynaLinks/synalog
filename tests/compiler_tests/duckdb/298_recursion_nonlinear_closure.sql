-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS logica_home.Path_ifr0;
CREATE TABLE logica_home.Path_ifr0 AS WITH t_0_Path_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f1.a AS a,
  Path_MultBodyAggAux_f1.b AS b
FROM
  t_0_Path_MultBodyAggAux_f1 AS Path_MultBodyAggAux_f1
GROUP BY Path_MultBodyAggAux_f1.a, Path_MultBodyAggAux_f1.b;

-- Interacting with table logica_home.Path_ifr0

DROP TABLE IF EXISTS logica_home.Path_ifr1;
CREATE TABLE logica_home.Path_ifr1 AS WITH t_0_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Path_ifr0.a AS a,
      t_1_Path_ifr0.b AS b
    FROM
      logica_home.Path_ifr0 AS Path_ifr0, logica_home.Path_ifr0 AS t_1_Path_ifr0
    WHERE
      (t_1_Path_ifr0.a = Path_ifr0.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b
FROM
  t_0_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b;

-- Interacting with table logica_home.Path_ifr1

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Path_ifr1.a AS a,
      t_1_Path_ifr1.b AS b
    FROM
      logica_home.Path_ifr1 AS Path_ifr1, logica_home.Path_ifr1 AS t_1_Path_ifr1
    WHERE
      (t_1_Path_ifr1.a = Path_ifr1.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f3.a AS a,
  Path_MultBodyAggAux_f3.b AS b
FROM
  t_0_Path_MultBodyAggAux_f3 AS Path_MultBodyAggAux_f3
GROUP BY Path_MultBodyAggAux_f3.a, Path_MultBodyAggAux_f3.b;

-- Interacting with table logica_home.Path_ifr2

DROP TABLE IF EXISTS logica_home.Path_ifr3;
CREATE TABLE logica_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr2, logica_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

-- Interacting with table logica_home.Path_ifr3

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      logica_home.Path_ifr3 AS Path_ifr3, logica_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

-- Interacting with table logica_home.Path_ifr2

DROP TABLE IF EXISTS logica_home.Path_ifr3;
CREATE TABLE logica_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr2, logica_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      logica_home.Path_ifr3 AS Path_ifr3, logica_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS logica_home.Path_ifr3;
CREATE TABLE logica_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr2, logica_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      logica_home.Path_ifr3 AS Path_ifr3, logica_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS logica_home.Path_ifr3;
CREATE TABLE logica_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr2, logica_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      logica_home.Path_ifr3 AS Path_ifr3, logica_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS logica_home.Path_ifr3;
CREATE TABLE logica_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr2, logica_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      logica_home.Path_ifr3 AS Path_ifr3, logica_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS logica_home.Path_ifr3;
CREATE TABLE logica_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr2, logica_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      logica_home.Path_ifr3 AS Path_ifr3, logica_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS logica_home.Path_ifr3;
CREATE TABLE logica_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr2, logica_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      logica_home.Path_ifr3 AS Path_ifr3, logica_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS logica_home.Path_ifr3;
CREATE TABLE logica_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr2, logica_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      logica_home.Path_ifr3 AS Path_ifr3, logica_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS logica_home.Path_ifr3;
CREATE TABLE logica_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr2, logica_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      logica_home.Path_ifr3 AS Path_ifr3, logica_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS logica_home.Path_ifr3;
CREATE TABLE logica_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr2, logica_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      logica_home.Path_ifr3 AS Path_ifr3, logica_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS logica_home.Path_ifr3;
CREATE TABLE logica_home.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr2, logica_home.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY Path_MultBodyAggAux_f4.a, Path_MultBodyAggAux_f4.b;

DROP TABLE IF EXISTS logica_home.Path_ifr2;
CREATE TABLE logica_home.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      logica_home.Path_ifr3 AS Path_ifr3, logica_home.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY Path_MultBodyAggAux_f5.a, Path_MultBodyAggAux_f5.b;

DROP TABLE IF EXISTS logica_home.Path;
CREATE TABLE logica_home.Path AS WITH t_0_Path_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Path_ifr4.a AS a,
      t_1_Path_ifr4.b AS b
    FROM
      logica_home.Path_ifr2 AS Path_ifr4, logica_home.Path_ifr2 AS t_1_Path_ifr4
    WHERE
      (t_1_Path_ifr4.a = Path_ifr4.b)
   UNION ALL
  
    SELECT
      x_15.unnested_pod AS a,
      ((x_15.unnested_pod) + (1)) AS b
    FROM
      (select unnest(Range(9)) as unnested_pod) as x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f6.a AS a,
  Path_MultBodyAggAux_f6.b AS b
FROM
  t_0_Path_MultBodyAggAux_f6 AS Path_MultBodyAggAux_f6
GROUP BY Path_MultBodyAggAux_f6.a, Path_MultBodyAggAux_f6.b;

-- Interacting with table logica_home.Path

SELECT
  SUM(1) AS n
FROM
  logica_home.Path AS Path;