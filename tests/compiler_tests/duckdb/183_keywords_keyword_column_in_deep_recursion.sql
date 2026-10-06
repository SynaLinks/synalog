-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY Reach_MultBodyAggAux_f1."to";

-- Interacting with table logica_home.Reach_sn_delta

DROP TABLE IF EXISTS logica_home.Reach_sn_t0;
CREATE TABLE logica_home.Reach_sn_t0 AS SELECT
  Reach_sn_delta."to" AS "to"
FROM
  logica_home.Reach_sn_delta AS Reach_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t0

DROP TABLE IF EXISTS logica_home.Reach_sn_t1;
CREATE TABLE logica_home.Reach_sn_t1 AS WITH t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_t0 AS Reach_sn_t0, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_t0."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r1 AS (SELECT
  Reach_MultBodyAggAux_f2."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2."to")
SELECT
  Reach_sn_r1."to" AS "to"
FROM
  t_0_Reach_sn_r1 AS Reach_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t1

DROP TABLE IF EXISTS logica_home.Reach_sn_t2;
CREATE TABLE logica_home.Reach_sn_t2 AS WITH t_1_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_t1 AS Reach_sn_t1, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_t1."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r2 AS (SELECT
  Reach_MultBodyAggAux_f3."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3."to")
SELECT
  Reach_sn_r2."to" AS "to"
FROM
  t_0_Reach_sn_r2 AS Reach_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t2

DROP TABLE IF EXISTS logica_home.Reach_sn_t3;
CREATE TABLE logica_home.Reach_sn_t3 AS WITH t_1_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_t2 AS Reach_sn_t2, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_t2."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_r3 AS (SELECT
  Reach_MultBodyAggAux_f4."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4."to")
SELECT
  Reach_sn_r3."to" AS "to"
FROM
  t_0_Reach_sn_r3 AS Reach_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_home.Reach_sn_t3

DROP TABLE IF EXISTS logica_home.Reach_sn_full;
CREATE TABLE logica_home.Reach_sn_full AS SELECT * FROM (
  
    SELECT
      Reach_sn_delta."to" AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_t1."to" AS "to"
    FROM
      logica_home.Reach_sn_t1 AS Reach_sn_t1
   UNION ALL
  
    SELECT
      Reach_sn_t2."to" AS "to"
    FROM
      logica_home.Reach_sn_t2 AS Reach_sn_t2
   UNION ALL
  
    SELECT
      Reach_sn_t3."to" AS "to"
    FROM
      logica_home.Reach_sn_t3 AS Reach_sn_t3
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_home.Reach_sn_full

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_new;
CREATE TABLE logica_home.Reach_sn_new AS WITH t_1_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS "to"
   UNION ALL
  
    SELECT
      ((x_9.unnested_pod) + (1)) AS "to"
    FROM
      logica_home.Reach_sn_delta AS Reach_sn_delta, (select unnest(Range(100)) as unnested_pod) as x_9
    WHERE
      (Reach_sn_delta."to" = x_9.unnested_pod)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f5."to" AS "to"
FROM
  t_1_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5."to")
SELECT
  Reach_sn_step."to" AS "to"
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_12.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Reach_sn_full AS Reach_sn_full, (select unnest([0]) as unnested_pod) as x_12
  WHERE
    (Reach_sn_full."to" = Reach_sn_step."to")) IS NULL)
GROUP BY Reach_sn_step."to";

INSERT INTO logica_home.Reach_sn_full SELECT * FROM logica_home.Reach_sn_new;

DROP TABLE IF EXISTS logica_home.Reach_sn_delta;
CREATE TABLE logica_home.Reach_sn_delta AS SELECT
  Reach_sn_new."to" AS "to"
FROM
  logica_home.Reach_sn_new AS Reach_sn_new;

SELECT
  MAX(Reach_sn_full."to") AS m
FROM
  logica_home.Reach_sn_full AS Reach_sn_full;