-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Items AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ARRAY['a', 'b'] AS tags
   UNION ALL
  
    SELECT
      2 AS id,
      ARRAY['c'] AS tags
   UNION ALL
  
    SELECT
      3 AS id,
      ARRAY['a', 'd', 'e'] AS tags
  
) AS UNUSED_TABLE_NAME  ),
t_0_AllTags AS (SELECT
  ARRAY_CONCAT_AGG(Items.tags) AS logica_value
FROM
  t_1_Items AS Items),
t_2_FilteredTags AS (SELECT
  ARRAY_CONCAT_AGG(CASE WHEN (COALESCE(ARRAY_LENGTH(t_3_Items.tags, 1), 0) > 1) THEN t_3_Items.tags ELSE '{}' END) AS logica_value
FROM
  t_1_Items AS t_3_Items)
SELECT
  AllTags.logica_value AS all_tags,
  FilteredTags.logica_value AS filtered
FROM
  t_0_AllTags AS AllTags, t_2_FilteredTags AS FilteredTags;