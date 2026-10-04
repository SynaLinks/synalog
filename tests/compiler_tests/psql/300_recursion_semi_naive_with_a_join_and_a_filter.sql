-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.node AS node,
  Reach_MultBodyAggAux_f1.hops AS hops
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY Reach_MultBodyAggAux_f1.node, Reach_MultBodyAggAux_f1.hops ORDER BY node;

-- Interacting with table logica_home.Reach_sn_delta

DROP TABLE IF EXISTS logica_home.Reach_sn_full CASCADE;
CREATE TABLE logica_home.Reach_sn_full AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT * FROM (
  
    SELECT
      Reach_sn_delta.node AS node,
      Reach_sn_delta.hops AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_step.node AS node,
      Reach_sn_step.hops AS hops
    FROM
      t_0_Reach_sn_step AS Reach_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_home.Reach_sn_full

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((t_2_Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge."from" = t_2_Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops ORDER BY node)
SELECT
  Reach_sn_step.node AS node,
  Reach_sn_step.hops AS hops
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_17
  WHERE
    (Reach_sn_full.node = Reach_sn_step.node) AND
    (Reach_sn_full.hops = Reach_sn_step.hops)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.node, Reach_sn_step.hops;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.node AS node,
  Reach_sn_new.hops AS hops
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

SELECT
  Reach_sn_full.node AS node,
  Reach_sn_full.hops AS hops
FROM
  logica_home.Reach_sn_full AS Reach_sn_full;