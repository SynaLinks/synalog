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
WITH t_1_Names AS (SELECT * FROM (
  
    SELECT
      'alice' AS first,
      'smith' AS last
   UNION ALL
  
    SELECT
      'bob' AS first,
      'jones' AS last
   UNION ALL
  
    SELECT
      'charlie' AS first,
      'brown' AS last
  
) AS UNUSED_TABLE_NAME  ),
t_0_FormattedNames AS (SELECT
  Names.first AS first,
  UPPER(Names.first) AS upper_first,
  LENGTH(Names.last) AS len
FROM
  t_1_Names AS Names ORDER BY first)
SELECT
  FormattedNames.first AS first,
  FormattedNames.upper_first AS upper_first,
  FormattedNames.len AS len
FROM
  t_0_FormattedNames AS FormattedNames ORDER BY first;