-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord10283957592820413579') then create type logicarecord10283957592820413579 as ("city" text); end if; END $$;
DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord5181590951440559604') then create type logicarecord5181590951440559604 as ("a" numeric, "n" text); end if; END $$;
DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord9584619364521724316') then create type logicarecord9584619364521724316 as ("age" numeric, "home" logicarecord10283957592820413579, "name" text, "tags" text[]); end if; END $$;
WITH t_2_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ROW(31, ROW('paris')::logicarecord10283957592820413579, 'ann', ARRAY['a', 'b'])::logicarecord9584619364521724316 AS r
   UNION ALL
  
    SELECT
      2 AS id,
      ROW(null, ROW('oslo')::logicarecord10283957592820413579, 'bob', CAST('{}' AS text[]))::logicarecord9584619364521724316 AS r
   UNION ALL
  
    SELECT
      3 AS id,
      ROW(45, ROW('paris')::logicarecord10283957592820413579, 'cid', ARRAY['c'])::logicarecord9584619364521724316 AS r
   UNION ALL
  
    SELECT
      4 AS id,
      ROW(22, ROW(null)::logicarecord10283957592820413579, 'dee', ARRAY['a'])::logicarecord9584619364521724316 AS r
   UNION ALL
  
    SELECT
      5 AS id,
      ROW(38, ROW('rome')::logicarecord10283957592820413579, 'eve', ARRAY['b', 'c', 'd'])::logicarecord9584619364521724316 AS r
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ((P.r).home).city AS city,
  ARRAY_AGG(ROW((P.r).age, (P.r).name)::logicarecord5181590951440559604) AS l
FROM
  t_2_P AS P
WHERE
  (((P.r).home).city IS NOT null)
GROUP BY ((P.r).home).city)
SELECT
  t_0_L.city AS city,
  CARDINALITY(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY city;