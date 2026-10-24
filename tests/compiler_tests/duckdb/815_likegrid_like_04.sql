-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_3.unnested_pod AS w
FROM
  (select unnest(['cat', 'cart', 'scat', 'Cat', 'ct', 'c_t']) as unnested_pod) as x_3
WHERE
  (x_3.unnested_pod LIKE '%a%' ESCAPE '\') ORDER BY w;
