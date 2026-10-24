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
SELECT * FROM (
  
    SELECT
      'and' AS test_name,
      x_5.unnested_pod AS x
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_5
    WHERE
      ((x_5.unnested_pod > 2) AND (x_5.unnested_pod < 7))
   UNION ALL
  
    SELECT
      'complex' AS test_name,
      x_5.unnested_pod AS x
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_5
    WHERE
      (((x_5.unnested_pod > 2) AND (x_5.unnested_pod < 4)) OR ((x_5.unnested_pod > 6) AND (x_5.unnested_pod < 9)))
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;