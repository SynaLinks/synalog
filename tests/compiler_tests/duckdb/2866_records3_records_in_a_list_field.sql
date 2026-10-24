-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord918648522
drop type if exists synalogrecord918648522 cascade; create type synalogrecord918648522 as struct(n text);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);

-- Synalog type: synalogrecord972290791
drop type if exists synalogrecord972290791 cascade; create type synalogrecord972290791 as struct(items synalogrecord918648522[], name text);
WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      {name: 'a', items: [{n: 'p'}, {n: 'q'}]::synalogrecord918648522[]} AS r
   UNION ALL
  
    SELECT
      {name: 'b', items: [{n: 'r'}]::synalogrecord918648522[]} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.r.name AS name,
  x_1.unnested_pod.n AS item
FROM
  t_0_T AS T, (select unnest(T.r.items) as unnested_pod) as x_1 ORDER BY name, item;