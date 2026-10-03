-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS WITH t_0_Hop_MultBodyAggAux_f1 AS (SELECT * FROM (
  
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

-- Interacting with table logica_home.Hop_sn_delta

DROP TABLE IF EXISTS logica_home.Hop_sn_full CASCADE;
CREATE TABLE logica_home.Hop_sn_full AS SELECT
  Hop_sn_delta.node AS node,
  Hop_sn_delta.d AS d
FROM
  logica_home.Hop_sn_delta AS Hop_sn_delta;

-- Interacting with table logica_home.Hop_sn_full

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_new CASCADE;
CREATE TABLE logica_home.Hop_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Hop_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.b AS node,
      ((Hop_sn_delta.d) + (1)) AS d
    FROM
      logica_home.Hop_sn_delta AS Hop_sn_delta, t_2_Edge AS Edge
    WHERE
      (Hop_sn_delta.d < 5) AND
      (Edge.a = Hop_sn_delta.node)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Hop_sn_step AS (SELECT
  Hop_MultBodyAggAux_f2.node AS node,
  Hop_MultBodyAggAux_f2.d AS d
FROM
  t_1_Hop_MultBodyAggAux_f2 AS Hop_MultBodyAggAux_f2
GROUP BY Hop_MultBodyAggAux_f2.node, Hop_MultBodyAggAux_f2.d)
SELECT
  Hop_sn_step.node AS node,
  Hop_sn_step.d AS d
FROM
  t_0_Hop_sn_step AS Hop_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_16 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Hop_sn_full AS Hop_sn_full, UNNEST(ARRAY[0]) as x_16
  WHERE
    (Hop_sn_full.node = Hop_sn_step.node) AND
    (Hop_sn_full.d = Hop_sn_step.d)) AS numeric) IS NULL)
GROUP BY Hop_sn_step.node, Hop_sn_step.d;

INSERT INTO logica_home.Hop_sn_full SELECT * FROM logica_home.Hop_sn_new;

DROP TABLE IF EXISTS logica_home.Hop_sn_delta CASCADE;
CREATE TABLE logica_home.Hop_sn_delta AS SELECT
  Hop_sn_new.node AS node,
  Hop_sn_new.d AS d
FROM
  logica_home.Hop_sn_new AS Hop_sn_new;

SELECT
  Hop_sn_full.node AS node,
  MIN(Hop_sn_full.d) AS d
FROM
  logica_home.Hop_sn_full AS Hop_sn_full
GROUP BY Hop_sn_full.node ORDER BY node;