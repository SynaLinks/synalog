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
GROUP BY Reach_MultBodyAggAux_f1.node, Reach_MultBodyAggAux_f1.hops;

-- Interacting with table logica_home.Reach_sn_delta

DROP TABLE IF EXISTS logica_home.Reach_sn_t0 CASCADE;
CREATE TABLE logica_home.Reach_sn_t0 AS SELECT
  Reach_sn_delta.node AS node,
  Reach_sn_delta.hops AS hops
FROM
  logica_home.Reach_sn_delta AS Reach_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t0

DROP TABLE IF EXISTS logica_home.Reach_sn_t1 CASCADE;
CREATE TABLE logica_home.Reach_sn_t1 AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      ((Reach_sn_t0.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_t0 AS Reach_sn_t0, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_t0.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r1 AS (SELECT
  Reach_MultBodyAggAux_f2.node AS node,
  Reach_MultBodyAggAux_f2.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.node, Reach_MultBodyAggAux_f2.hops)
SELECT
  Reach_sn_r1.node AS node,
  Reach_sn_r1.hops AS hops
FROM
  t_0_Reach_sn_r1 AS Reach_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t1

DROP TABLE IF EXISTS logica_home.Reach_sn_t2 CASCADE;
CREATE TABLE logica_home.Reach_sn_t2 AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_t1.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_t1 AS Reach_sn_t1, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_t1.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r2 AS (SELECT
  Reach_MultBodyAggAux_f3.node AS node,
  Reach_MultBodyAggAux_f3.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.node, Reach_MultBodyAggAux_f3.hops)
SELECT
  Reach_sn_r2.node AS node,
  Reach_sn_r2.hops AS hops
FROM
  t_0_Reach_sn_r2 AS Reach_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t2

DROP TABLE IF EXISTS logica_home.Reach_sn_t3 CASCADE;
CREATE TABLE logica_home.Reach_sn_t3 AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_t2.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_t2 AS Reach_sn_t2, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_t2.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r3 AS (SELECT
  Reach_MultBodyAggAux_f4.node AS node,
  Reach_MultBodyAggAux_f4.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.node, Reach_MultBodyAggAux_f4.hops)
SELECT
  Reach_sn_r3.node AS node,
  Reach_sn_r3.hops AS hops
FROM
  t_0_Reach_sn_r3 AS Reach_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t3

DROP TABLE IF EXISTS logica_home.Reach_sn_t4 CASCADE;
CREATE TABLE logica_home.Reach_sn_t4 AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_t3.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_t3 AS Reach_sn_t3, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_t3.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r4 AS (SELECT
  Reach_MultBodyAggAux_f5.node AS node,
  Reach_MultBodyAggAux_f5.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.node, Reach_MultBodyAggAux_f5.hops)
SELECT
  Reach_sn_r4.node AS node,
  Reach_sn_r4.hops AS hops
FROM
  t_0_Reach_sn_r4 AS Reach_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t4

DROP TABLE IF EXISTS logica_home.Reach_sn_t5 CASCADE;
CREATE TABLE logica_home.Reach_sn_t5 AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_t4.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_t4 AS Reach_sn_t4, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_t4.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r5 AS (SELECT
  Reach_MultBodyAggAux_f6.node AS node,
  Reach_MultBodyAggAux_f6.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY Reach_MultBodyAggAux_f6.node, Reach_MultBodyAggAux_f6.hops)
SELECT
  Reach_sn_r5.node AS node,
  Reach_sn_r5.hops AS hops
FROM
  t_0_Reach_sn_r5 AS Reach_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t5

DROP TABLE IF EXISTS logica_home.Reach_sn_full CASCADE;
CREATE TABLE logica_home.Reach_sn_full AS SELECT * FROM (
  
    SELECT
      Reach_sn_delta.node AS node,
      Reach_sn_delta.hops AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_t1.node AS node,
      Reach_sn_t1.hops AS hops
    FROM
      logica_home.Reach_sn_t1 AS Reach_sn_t1
   UNION ALL
  
    SELECT
      Reach_sn_t2.node AS node,
      Reach_sn_t2.hops AS hops
    FROM
      logica_home.Reach_sn_t2 AS Reach_sn_t2
   UNION ALL
  
    SELECT
      Reach_sn_t3.node AS node,
      Reach_sn_t3.hops AS hops
    FROM
      logica_home.Reach_sn_t3 AS Reach_sn_t3
   UNION ALL
  
    SELECT
      Reach_sn_t4.node AS node,
      Reach_sn_t4.hops AS hops
    FROM
      logica_home.Reach_sn_t4 AS Reach_sn_t4
   UNION ALL
  
    SELECT
      Reach_sn_t5.node AS node,
      Reach_sn_t5.hops AS hops
    FROM
      logica_home.Reach_sn_t5 AS Reach_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_home.Reach_sn_full

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS hops
   UNION ALL
  
    SELECT
      Edge."to" AS node,
      ((Reach_sn_delta.hops) + (1)) AS hops
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge."from" = Reach_sn_delta.node) AND
      (Edge.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f7.node AS node,
  Reach_MultBodyAggAux_f7.hops AS hops
FROM
  t_1_Reach_MultBodyAggAux_f7 AS Reach_MultBodyAggAux_f7
GROUP BY Reach_MultBodyAggAux_f7.node, Reach_MultBodyAggAux_f7.hops)
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
  logica_home.Reach_sn_full AS Reach_sn_full ORDER BY node;