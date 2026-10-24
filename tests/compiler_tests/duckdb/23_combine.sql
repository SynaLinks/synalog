-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
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
  ARRAY_CONCAT_AGG(Items.tags) AS synalog_value
FROM
  t_1_Items AS Items),
t_2_FilteredTags AS (SELECT
  ARRAY_CONCAT_AGG(CASE WHEN (LEN(t_3_Items.tags) > 1) THEN t_3_Items.tags ELSE []::text[] END) AS synalog_value
FROM
  t_1_Items AS t_3_Items)
SELECT
  AllTags.synalog_value AS all_tags,
  FilteredTags.synalog_value AS filtered
FROM
  t_0_AllTags AS AllTags, t_2_FilteredTags AS FilteredTags;