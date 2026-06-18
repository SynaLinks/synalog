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
WITH t_0_Classification AS (SELECT * FROM (
  
    SELECT
      x_8.unnested_pod AS col0,
      'small' AS col1
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_8
    WHERE
      (x_8.unnested_pod < 3)
   UNION ALL
  
    SELECT
      x_13.unnested_pod AS col0,
      'medium' AS col1
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_13
    WHERE
      (x_13.unnested_pod >= 3) AND
      (x_13.unnested_pod < 7)
   UNION ALL
  
    SELECT
      x_18.unnested_pod AS col0,
      'large' AS col1
    FROM
      (select unnest(Range(10)) as unnested_pod) as x_18
    WHERE
      (x_18.unnested_pod >= 7)
  
) AS UNUSED_TABLE_NAME  ORDER BY col0 )
SELECT
  Classification.col0 AS col0,
  Classification.col1 AS col1
FROM
  t_0_Classification AS Classification ORDER BY col0;