-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      3 AS x,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -4 AS x,
      'hello' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      CAST(null AS numeric) AS x,
      'x' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      CAST(null AS text) AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'seven' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      V.k AS a,
      t_1_V.k AS b
    FROM
      t_3_V AS V, t_3_V AS t_1_V
    WHERE
      (V.k < t_1_V.k) AND
      (COALESCE(((V.x) * (V.x)), 0) = COALESCE(((((t_1_V.x) * (t_1_V.x))) + (7)), 0) AND (((V.x) * (V.x)) IS NULL) = (((((t_1_V.x) * (t_1_V.x))) + (7)) IS NULL))
   UNION ALL
  
    SELECT
      t_4_V.k AS a,
      t_5_V.k AS b
    FROM
      t_3_V AS t_4_V, t_3_V AS t_5_V
    WHERE
      (t_4_V.k < t_5_V.k) AND
      (COALESCE(((t_4_V.x) * (t_4_V.x)), 0) = COALESCE(((t_5_V.x) * (t_5_V.x)), 0) AND (((t_4_V.x) * (t_4_V.x)) IS NULL) = (((t_5_V.x) * (t_5_V.x)) IS NULL))
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.a AS a,
  Q_MultBodyAggAux.b AS b
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY Q_MultBodyAggAux.a, Q_MultBodyAggAux.b ORDER BY a, b;