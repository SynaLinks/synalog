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
WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name,
      10 AS dept,
      null AS boss
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name,
      10 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS name,
      20 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS name,
      null AS dept,
      2 AS boss
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS name,
      30 AS dept,
      3 AS boss
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS name,
      20 AS dept,
      null AS boss
  
) AS UNUSED_TABLE_NAME  ),
t_1_S AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'sql' AS skill
   UNION ALL
  
    SELECT
      1 AS id,
      'go' AS skill
   UNION ALL
  
    SELECT
      2 AS id,
      'sql' AS skill
   UNION ALL
  
    SELECT
      3 AS id,
      'rust' AS skill
   UNION ALL
  
    SELECT
      5 AS id,
      'sql' AS skill
   UNION ALL
  
    SELECT
      5 AS id,
      'go' AS skill
   UNION ALL
  
    SELECT
      6 AS id,
      'excel' AS skill
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.name AS name
FROM
  t_0_E AS E
WHERE
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_S AS S, (select unnest([0]::numeric[]) as unnested_pod) as x_6
  WHERE
    (S.id = E.id) AND
    (S.skill = 'sql')) IS NULL) ORDER BY name;