-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord399476892
drop type if exists synalogrecord399476892 cascade; create type synalogrecord399476892 as struct(n text, v numeric);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      [{n: 'a', v: 1}, {n: 'b', v: 2}]::synalogrecord399476892[] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      [{n: 'c', v: 3}]::synalogrecord399476892[] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k
FROM
  t_0_T AS T, (select unnest(T.l) as unnested_pod) as x_3
WHERE
  (x_3.unnested_pod.n = 'b')
GROUP BY T.k;