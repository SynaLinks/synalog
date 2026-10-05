-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.x AS x
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY Reach_MultBodyAggAux_f1.x;

-- Interacting with table logica_home.Reach_sn_delta

DROP TABLE IF EXISTS logica_home.Reach_sn_full CASCADE;
CREATE TABLE logica_home.Reach_sn_full AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT * FROM (
  
    SELECT
      Reach_sn_delta.x AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_step.x AS x
    FROM
      t_0_Reach_sn_step AS Reach_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_home.Reach_sn_full

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_3_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS t_2_Reach_sn_delta, t_3_Edge AS Edge
    WHERE
      (Edge.a = t_2_Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_step.x AS x
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, UNNEST(ARRAY[0]) as x_10
  WHERE
    (Reach_sn_full.x = Reach_sn_step.x)) AS numeric) IS NULL)
GROUP BY Reach_sn_step.x;

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta CASCADE;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new.x AS x
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

SELECT
  Reach_sn_full.x AS x
FROM
  logica_home.Reach_sn_full AS Reach_sn_full ORDER BY x;