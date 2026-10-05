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
WITH t_0_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_IsSequel AS (SELECT
  t_2_Sequel.next AS book
FROM
  t_0_Sequel AS t_2_Sequel
GROUP BY t_2_Sequel.next)
SELECT
  Sequel.book AS book
FROM
  t_0_Sequel AS Sequel
WHERE
  ((SELECT
    MIN((CASE WHEN x_4.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_IsSequel AS IsSequel, (select unnest([0]::numeric[]) as unnested_pod) as x_4
  WHERE
    (IsSequel.book = Sequel.book)) IS NULL)
GROUP BY Sequel.book ORDER BY book;