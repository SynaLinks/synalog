-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.Hop_ifr0 CASCADE;
CREATE TABLE logica_home.Hop_ifr0 AS WITH t_0_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f1.node AS node,
  Hop_MultBodyAggAux_f1.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f1 AS Hop_MultBodyAggAux_f1
GROUP BY Hop_MultBodyAggAux_f1.node, Hop_MultBodyAggAux_f1.d;

-- Interacting with table logica_home.Hop_ifr0

DROP TABLE IF EXISTS logica_home.Hop_ifr1 CASCADE;
CREATE TABLE logica_home.Hop_ifr1 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr0.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr0 AS Hop_ifr0, t_1_Edge AS Edge
    WHERE
      (Hop_ifr0.d < 5) AND
      (Edge.a = Hop_ifr0.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d;

-- Interacting with table logica_home.Hop_ifr1

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr1.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr1 AS Hop_ifr1, t_1_Edge AS Edge
    WHERE
      (Hop_ifr1.d < 5) AND
      (Edge.a = Hop_ifr1.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f3.node AS node,
  Hop_MultBodyAggAux_f3.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f3 AS Hop_MultBodyAggAux_f3
GROUP BY Hop_MultBodyAggAux_f3.node, Hop_MultBodyAggAux_f3.d;

-- Interacting with table logica_home.Hop_ifr2

DROP TABLE IF EXISTS logica_home.Hop_ifr3 CASCADE;
CREATE TABLE logica_home.Hop_ifr3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr2.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr2, t_1_Edge AS Edge
    WHERE
      (Hop_ifr2.d < 5) AND
      (Edge.a = Hop_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY Hop_MultBodyAggAux_f4.node, Hop_MultBodyAggAux_f4.d;

-- Interacting with table logica_home.Hop_ifr3

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr3.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr3 AS Hop_ifr3, t_1_Edge AS Edge
    WHERE
      (Hop_ifr3.d < 5) AND
      (Edge.a = Hop_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY Hop_MultBodyAggAux_f5.node, Hop_MultBodyAggAux_f5.d;

-- Interacting with table logica_home.Hop_ifr2

DROP TABLE IF EXISTS logica_home.Hop_ifr3 CASCADE;
CREATE TABLE logica_home.Hop_ifr3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr2.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr2, t_1_Edge AS Edge
    WHERE
      (Hop_ifr2.d < 5) AND
      (Edge.a = Hop_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY Hop_MultBodyAggAux_f4.node, Hop_MultBodyAggAux_f4.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr3.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr3 AS Hop_ifr3, t_1_Edge AS Edge
    WHERE
      (Hop_ifr3.d < 5) AND
      (Edge.a = Hop_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY Hop_MultBodyAggAux_f5.node, Hop_MultBodyAggAux_f5.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr3 CASCADE;
CREATE TABLE logica_home.Hop_ifr3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr2.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr2, t_1_Edge AS Edge
    WHERE
      (Hop_ifr2.d < 5) AND
      (Edge.a = Hop_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY Hop_MultBodyAggAux_f4.node, Hop_MultBodyAggAux_f4.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr3.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr3 AS Hop_ifr3, t_1_Edge AS Edge
    WHERE
      (Hop_ifr3.d < 5) AND
      (Edge.a = Hop_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY Hop_MultBodyAggAux_f5.node, Hop_MultBodyAggAux_f5.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr3 CASCADE;
CREATE TABLE logica_home.Hop_ifr3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr2.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr2, t_1_Edge AS Edge
    WHERE
      (Hop_ifr2.d < 5) AND
      (Edge.a = Hop_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY Hop_MultBodyAggAux_f4.node, Hop_MultBodyAggAux_f4.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr3.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr3 AS Hop_ifr3, t_1_Edge AS Edge
    WHERE
      (Hop_ifr3.d < 5) AND
      (Edge.a = Hop_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY Hop_MultBodyAggAux_f5.node, Hop_MultBodyAggAux_f5.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr3 CASCADE;
CREATE TABLE logica_home.Hop_ifr3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr2.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr2, t_1_Edge AS Edge
    WHERE
      (Hop_ifr2.d < 5) AND
      (Edge.a = Hop_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY Hop_MultBodyAggAux_f4.node, Hop_MultBodyAggAux_f4.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr3.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr3 AS Hop_ifr3, t_1_Edge AS Edge
    WHERE
      (Hop_ifr3.d < 5) AND
      (Edge.a = Hop_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY Hop_MultBodyAggAux_f5.node, Hop_MultBodyAggAux_f5.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr3 CASCADE;
CREATE TABLE logica_home.Hop_ifr3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr2.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr2, t_1_Edge AS Edge
    WHERE
      (Hop_ifr2.d < 5) AND
      (Edge.a = Hop_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY Hop_MultBodyAggAux_f4.node, Hop_MultBodyAggAux_f4.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr3.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr3 AS Hop_ifr3, t_1_Edge AS Edge
    WHERE
      (Hop_ifr3.d < 5) AND
      (Edge.a = Hop_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY Hop_MultBodyAggAux_f5.node, Hop_MultBodyAggAux_f5.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr3 CASCADE;
CREATE TABLE logica_home.Hop_ifr3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr2.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr2, t_1_Edge AS Edge
    WHERE
      (Hop_ifr2.d < 5) AND
      (Edge.a = Hop_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY Hop_MultBodyAggAux_f4.node, Hop_MultBodyAggAux_f4.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr3.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr3 AS Hop_ifr3, t_1_Edge AS Edge
    WHERE
      (Hop_ifr3.d < 5) AND
      (Edge.a = Hop_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY Hop_MultBodyAggAux_f5.node, Hop_MultBodyAggAux_f5.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr3 CASCADE;
CREATE TABLE logica_home.Hop_ifr3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr2.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr2, t_1_Edge AS Edge
    WHERE
      (Hop_ifr2.d < 5) AND
      (Edge.a = Hop_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY Hop_MultBodyAggAux_f4.node, Hop_MultBodyAggAux_f4.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr3.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr3 AS Hop_ifr3, t_1_Edge AS Edge
    WHERE
      (Hop_ifr3.d < 5) AND
      (Edge.a = Hop_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY Hop_MultBodyAggAux_f5.node, Hop_MultBodyAggAux_f5.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr3 CASCADE;
CREATE TABLE logica_home.Hop_ifr3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr2.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr2, t_1_Edge AS Edge
    WHERE
      (Hop_ifr2.d < 5) AND
      (Edge.a = Hop_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY Hop_MultBodyAggAux_f4.node, Hop_MultBodyAggAux_f4.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr3.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr3 AS Hop_ifr3, t_1_Edge AS Edge
    WHERE
      (Hop_ifr3.d < 5) AND
      (Edge.a = Hop_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY Hop_MultBodyAggAux_f5.node, Hop_MultBodyAggAux_f5.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr3 CASCADE;
CREATE TABLE logica_home.Hop_ifr3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr2.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr2, t_1_Edge AS Edge
    WHERE
      (Hop_ifr2.d < 5) AND
      (Edge.a = Hop_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY Hop_MultBodyAggAux_f4.node, Hop_MultBodyAggAux_f4.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr3.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr3 AS Hop_ifr3, t_1_Edge AS Edge
    WHERE
      (Hop_ifr3.d < 5) AND
      (Edge.a = Hop_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY Hop_MultBodyAggAux_f5.node, Hop_MultBodyAggAux_f5.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr3 CASCADE;
CREATE TABLE logica_home.Hop_ifr3 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr2.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr2, t_1_Edge AS Edge
    WHERE
      (Hop_ifr2.d < 5) AND
      (Edge.a = Hop_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f4.node AS node,
  Hop_MultBodyAggAux_f4.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f4 AS Hop_MultBodyAggAux_f4
GROUP BY Hop_MultBodyAggAux_f4.node, Hop_MultBodyAggAux_f4.d;

DROP TABLE IF EXISTS logica_home.Hop_ifr2 CASCADE;
CREATE TABLE logica_home.Hop_ifr2 AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr3.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr3 AS Hop_ifr3, t_1_Edge AS Edge
    WHERE
      (Hop_ifr3.d < 5) AND
      (Edge.a = Hop_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f5.node AS node,
  Hop_MultBodyAggAux_f5.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f5 AS Hop_MultBodyAggAux_f5
GROUP BY Hop_MultBodyAggAux_f5.node, Hop_MultBodyAggAux_f5.d;

DROP TABLE IF EXISTS logica_home.Hop CASCADE;
CREATE TABLE logica_home.Hop AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_ifr4.d) + (1)) AS d
    FROM
      logica_home.Hop_ifr2 AS Hop_ifr4, t_1_Edge AS Edge
    WHERE
      (Hop_ifr4.d < 5) AND
      (Edge.a = Hop_ifr4.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Hop_MultBodyAggAux_f6.node AS node,
  Hop_MultBodyAggAux_f6.d AS d
FROM
  t_0_Hop_MultBodyAggAux_f6 AS Hop_MultBodyAggAux_f6
GROUP BY Hop_MultBodyAggAux_f6.node, Hop_MultBodyAggAux_f6.d;

-- Interacting with table logica_home.Hop

SELECT
  Hop.node AS node,
  MIN(Hop.d) AS d
FROM
  logica_home.Hop AS Hop
GROUP BY Hop.node ORDER BY node;