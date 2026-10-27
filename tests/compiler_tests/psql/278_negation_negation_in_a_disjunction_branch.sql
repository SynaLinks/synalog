-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Banned AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_Out_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_5 AS x
    FROM
      UNNEST(ARRAY[1, 2, 3]) as x_5
    WHERE
      (CAST((SELECT
        MIN((CASE WHEN x_8 = 0 THEN 1 ELSE NULL END)) AS synalog_value
      FROM
        t_1_Banned AS Banned, UNNEST(ARRAY[0]) as x_8
      WHERE
        (COALESCE(Banned.x, 0) = COALESCE(x_5, 0) AND (Banned.x IS NULL) = (x_5 IS NULL))) AS numeric) IS NULL)
   UNION ALL
  
    SELECT
      3 AS x
    FROM
      UNNEST(ARRAY[1, 2, 3]) as x_12
    WHERE
      (x_12 = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Out_MultBodyAggAux.x AS x
FROM
  t_0_Out_MultBodyAggAux AS Out_MultBodyAggAux
GROUP BY Out_MultBodyAggAux.x ORDER BY x;