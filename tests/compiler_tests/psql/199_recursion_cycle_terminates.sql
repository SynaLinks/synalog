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

DROP TABLE IF EXISTS logica_home.Reach_sn_t0 CASCADE;
CREATE TABLE logica_home.Reach_sn_t0 AS SELECT
  Reach_sn_delta.x AS x
FROM
  logica_home.Reach_sn_delta AS Reach_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t0

DROP TABLE IF EXISTS logica_home.Reach_sn_t1 CASCADE;
CREATE TABLE logica_home.Reach_sn_t1 AS WITH t_2_Edge AS (SELECT * FROM (
  
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
      logica_home.Reach_sn_t0 AS Reach_sn_t0, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_t0.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r1 AS (SELECT
  Reach_MultBodyAggAux_f2.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.x)
SELECT
  Reach_sn_r1.x AS x
FROM
  t_0_Reach_sn_r1 AS Reach_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t1

DROP TABLE IF EXISTS logica_home.Reach_sn_t2 CASCADE;
CREATE TABLE logica_home.Reach_sn_t2 AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_t1 AS Reach_sn_t1, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_t1.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r2 AS (SELECT
  Reach_MultBodyAggAux_f3.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.x)
SELECT
  Reach_sn_r2.x AS x
FROM
  t_0_Reach_sn_r2 AS Reach_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t2

DROP TABLE IF EXISTS logica_home.Reach_sn_t3 CASCADE;
CREATE TABLE logica_home.Reach_sn_t3 AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_t2 AS Reach_sn_t2, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_t2.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r3 AS (SELECT
  Reach_MultBodyAggAux_f4.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.x)
SELECT
  Reach_sn_r3.x AS x
FROM
  t_0_Reach_sn_r3 AS Reach_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t3

DROP TABLE IF EXISTS logica_home.Reach_sn_full CASCADE;
CREATE TABLE logica_home.Reach_sn_full AS SELECT * FROM (
  
    SELECT
      Reach_sn_delta.x AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_t1.x AS x
    FROM
      logica_home.Reach_sn_t1 AS Reach_sn_t1
   UNION ALL
  
    SELECT
      Reach_sn_t2.x AS x
    FROM
      logica_home.Reach_sn_t2 AS Reach_sn_t2
   UNION ALL
  
    SELECT
      Reach_sn_t3.x AS x
    FROM
      logica_home.Reach_sn_t3 AS Reach_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_home.Reach_sn_full

DROP TABLE IF EXISTS logica_home.Reach_sn_new CASCADE;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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
CREATE TABLE logica_home.Reach_sn_new AS WITH t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, t_2_Edge AS Edge
    WHERE
      (Edge.a = Reach_sn_delta.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5.x AS x
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.x)
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