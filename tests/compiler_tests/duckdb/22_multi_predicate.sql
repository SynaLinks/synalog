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
WITH t_0_AllSquares AS (SELECT * FROM (
  
    SELECT
      x_15.unnested_pod AS x,
      ((x_15.unnested_pod) * (x_15.unnested_pod)) AS sq,
      E'even' AS type
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_15
    WHERE
      (((x_15.unnested_pod) % (2)) = 0)
   UNION ALL
  
    SELECT
      x_25.unnested_pod AS x,
      ((x_25.unnested_pod) * (x_25.unnested_pod)) AS sq,
      E'odd' AS type
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_25
    WHERE
      (((x_25.unnested_pod) % (2)) = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AllSquares.x AS x,
  AllSquares.sq AS sq,
  AllSquares.type AS type
FROM
  t_0_AllSquares AS AllSquares ORDER BY x;