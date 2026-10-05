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
WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      1 AS k
   UNION ALL
  
    SELECT
      'b' AS n,
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.n AS n
FROM
  t_0_P AS P
WHERE
  ((SELECT
    MIN((CASE WHEN x_4.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_P AS t_1_P, (select unnest([0]::numeric[]) as unnested_pod) as x_4
  WHERE
    (P.n = t_1_P.n) AND
    (t_1_P.k = 1)) IS NULL);