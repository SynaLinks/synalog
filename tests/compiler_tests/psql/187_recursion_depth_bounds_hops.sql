-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_5_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_4_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_5_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY Reach_MultBodyAggAux_recursive_head_f1.x ORDER BY x),
t_7_Edge AS (SELECT * FROM (
  
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
t_2_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_3_Edge.b AS x
    FROM
      t_4_Reach_r0 AS Reach_r0, t_7_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = Reach_r0.x)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_r1 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_2_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY Reach_MultBodyAggAux_recursive_head_f2.x ORDER BY x),
t_0_Reach_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      t_1_Reach_r1 AS Reach_r1, t_7_Edge AS Edge
    WHERE
      (Edge.a = Reach_r1.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_0_Reach_MultBodyAggAux_recursive_head_f3 AS Reach_MultBodyAggAux_recursive_head_f3
GROUP BY Reach_MultBodyAggAux_recursive_head_f3.x ORDER BY x;