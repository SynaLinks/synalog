-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT * FROM (
  
    SELECT
      'equal' AS test_name,
      5 AS x
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_5
    WHERE
      (5 = x_5.unnested_pod)
   UNION ALL
  
    SELECT
      'not_equal' AS test_name,
      x_5.unnested_pod AS x
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_5
    WHERE
      (x_5.unnested_pod IS DISTINCT FROM 5)
   UNION ALL
  
    SELECT
      'less_than' AS test_name,
      x_5.unnested_pod AS x
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_5
    WHERE
      (x_5.unnested_pod < 5)
   UNION ALL
  
    SELECT
      'in_range' AS test_name,
      x_5.unnested_pod AS x
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_5
    WHERE
      (x_5.unnested_pod >= 3) AND
      (x_5.unnested_pod <= 7)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;