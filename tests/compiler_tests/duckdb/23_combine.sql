-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_1_Items AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ['a', 'b']::text[] AS tags
   UNION ALL
  
    SELECT
      2 AS id,
      ['c']::text[] AS tags
   UNION ALL
  
    SELECT
      3 AS id,
      ['a', 'd', 'e']::text[] AS tags
  
) AS UNUSED_TABLE_NAME  ),
t_0_AllTags AS (SELECT
  ARRAY_CONCAT_AGG(Items.tags) AS logica_value
FROM
  t_1_Items AS Items),
t_2_FilteredTags AS (SELECT
  ARRAY_CONCAT_AGG(CASE WHEN (LEN(t_3_Items.tags) > 1) THEN t_3_Items.tags ELSE []::text[] END) AS logica_value
FROM
  t_1_Items AS t_3_Items)
SELECT
  AllTags.logica_value AS all_tags,
  FilteredTags.logica_value AS filtered
FROM
  t_0_AllTags AS AllTags, t_2_FilteredTags AS FilteredTags;