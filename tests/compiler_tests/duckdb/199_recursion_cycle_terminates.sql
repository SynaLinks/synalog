-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS logica_home.Reach_ifr0;
CREATE TABLE logica_home.Reach_ifr0 AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY Reach_MultBodyAggAux_f1.x ORDER BY x;

-- Interacting with table logica_home.Reach_ifr0

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr0 AS Reach_ifr0, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr0.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x ORDER BY x;

-- Interacting with table logica_home.Reach_ifr1

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

-- Interacting with table logica_home.Reach_ifr2

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

-- Interacting with table logica_home.Reach_ifr1

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr2;
CREATE TABLE logica_home.Reach_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x ORDER BY x;

DROP TABLE IF EXISTS logica_home.Reach_ifr1;
CREATE TABLE logica_home.Reach_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr2 AS Reach_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x ORDER BY x;

WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_ifr1 AS Reach_ifr3, t_1_Edge AS Edge
    WHERE
      (Edge.a = Reach_ifr3.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x ORDER BY x;