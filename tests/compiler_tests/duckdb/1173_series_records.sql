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
WITH t_0_Reading AS (SELECT * FROM (
  
    SELECT
      1 AS day,
      10 AS value
   UNION ALL
  
    SELECT
      2 AS day,
      12 AS value
   UNION ALL
  
    SELECT
      3 AS day,
      11 AS value
   UNION ALL
  
    SELECT
      4 AS day,
      15 AS value
   UNION ALL
  
    SELECT
      5 AS day,
      18 AS value
   UNION ALL
  
    SELECT
      6 AS day,
      18 AS value
   UNION ALL
  
    SELECT
      7 AS day,
      14 AS value
   UNION ALL
  
    SELECT
      8 AS day,
      20 AS value
   UNION ALL
  
    SELECT
      9 AS day,
      25 AS value
   UNION ALL
  
    SELECT
      10 AS day,
      22 AS value
   UNION ALL
  
    SELECT
      11 AS day,
      22 AS value
   UNION ALL
  
    SELECT
      12 AS day,
      30 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_1_Beaten AS (SELECT
  t_2_Reading.day AS day
FROM
  t_0_Reading AS t_2_Reading, t_0_Reading AS t_3_Reading
WHERE
  (t_3_Reading.day < t_2_Reading.day) AND
  (t_3_Reading.value >= t_2_Reading.value)
GROUP BY t_2_Reading.day)
SELECT
  Reading.day AS day
FROM
  t_0_Reading AS Reading
WHERE
  ((SELECT
    MIN((CASE WHEN x_4.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_Beaten AS Beaten, (select unnest([0]::numeric[]) as unnested_pod) as x_4
  WHERE
    (Beaten.day = Reading.day)) IS NULL) ORDER BY day;