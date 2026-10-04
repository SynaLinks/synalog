-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f1.a AS a,
  Path_MultBodyAggAux_f1.b AS b,
  Path_MultBodyAggAux_f1.n AS n
FROM
  t_0_Path_MultBodyAggAux_f1 AS Path_MultBodyAggAux_f1
GROUP BY Path_MultBodyAggAux_f1.a, Path_MultBodyAggAux_f1.b, Path_MultBodyAggAux_f1.n;

-- Interacting with table logica_home.Path_sn_delta

DROP TABLE IF EXISTS logica_home.Path_sn_full;
CREATE TABLE logica_home.Path_sn_full AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT * FROM (
  
    SELECT
      Path_sn_delta.a AS a,
      Path_sn_delta.b AS b,
      Path_sn_delta.n AS n
    FROM
      logica_home.Path_sn_delta AS Path_sn_delta
   UNION ALL
  
    SELECT
      Path_sn_step.a AS a,
      Path_sn_step.b AS b,
      Path_sn_step.n AS n
    FROM
      t_0_Path_sn_step AS Path_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_home.Path_sn_full

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_new;
CREATE TABLE logica_home.Path_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
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
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b,
      1 AS n
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      t_2_Path_sn_delta.a AS a,
      t_3_Edge.b AS b,
      ((t_2_Path_sn_delta.n) + (1)) AS n
    FROM
      logica_home.Path_sn_delta AS t_2_Path_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_2_Path_sn_delta.n < 3) AND
      (t_3_Edge.a = t_2_Path_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_sn_step AS (SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b,
  Path_MultBodyAggAux_f2.n AS n
FROM
  t_1_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY Path_MultBodyAggAux_f2.a, Path_MultBodyAggAux_f2.b, Path_MultBodyAggAux_f2.n)
SELECT
  Path_sn_step.a AS a,
  Path_sn_step.b AS b,
  Path_sn_step.n AS n
FROM
  t_0_Path_sn_step AS Path_sn_step
WHERE
  ((SELECT
    MIN((CASE WHEN x_27.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    logica_home.Path_sn_full AS Path_sn_full, (select unnest([0]) as unnested_pod) as x_27
  WHERE
    (Path_sn_full.a = Path_sn_step.a) AND
    (Path_sn_full.b = Path_sn_step.b) AND
    (Path_sn_full.n = Path_sn_step.n)) IS NULL)
GROUP BY Path_sn_step.a, Path_sn_step.b, Path_sn_step.n;

INSERT INTO logica_home.Path_sn_full SELECT * FROM logica_home.Path_sn_new;

DROP TABLE IF EXISTS logica_home.Path_sn_delta;
CREATE TABLE logica_home.Path_sn_delta AS SELECT
  Path_sn_new.a AS a,
  Path_sn_new.b AS b,
  Path_sn_new.n AS n
FROM
  logica_home.Path_sn_new AS Path_sn_new;

SELECT
  Path_sn_full.n AS n
FROM
  logica_home.Path_sn_full AS Path_sn_full
GROUP BY Path_sn_full.n ORDER BY n;