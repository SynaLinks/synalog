-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_AllSquares AS (SELECT * FROM (
  
    SELECT
      x_15.unnested_pod AS x,
      ((x_15.unnested_pod) * (x_15.unnested_pod)) AS sq,
      'even' AS type
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_15
    WHERE
      (((x_15.unnested_pod) % NULLIF(2, 0)) = 0)
   UNION ALL
  
    SELECT
      x_25.unnested_pod AS x,
      ((x_25.unnested_pod) * (x_25.unnested_pod)) AS sq,
      'odd' AS type
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_25
    WHERE
      (((x_25.unnested_pod) % NULLIF(2, 0)) = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AllSquares.x AS x,
  AllSquares.sq AS sq,
  AllSquares.type AS type
FROM
  t_0_AllSquares AS AllSquares ORDER BY x;