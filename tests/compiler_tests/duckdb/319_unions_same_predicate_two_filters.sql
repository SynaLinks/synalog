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
WITH t_0_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_5.unnested_pod AS x
    FROM
      (select unnest([1, 2, 3, 4]::numeric[]) as unnested_pod) as x_5
    WHERE
      (x_5.unnested_pod < 2)
   UNION ALL
  
    SELECT
      x_9.unnested_pod AS x
    FROM
      (select unnest([1, 2, 3, 4]::numeric[]) as unnested_pod) as x_9
    WHERE
      (x_9.unnested_pod > 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_0_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY U_MultBodyAggAux.x ORDER BY x;