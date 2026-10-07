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
WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_Day AS (SELECT
  S.d AS d
FROM
  t_1_S AS S
GROUP BY S.d),
t_5_Region AS (SELECT
  t_6_S.r AS r
FROM
  t_1_S AS t_6_S
GROUP BY t_6_S.r),
t_2_Missing AS (SELECT
  t_3_Day.d AS d
FROM
  t_0_Day AS t_3_Day, t_5_Region AS Region
WHERE
  ((SELECT
    MIN((CASE WHEN x_17.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_S AS t_7_S, (select unnest([0]::numeric[]) as unnested_pod) as x_17
  WHERE
    (t_7_S.r = Region.r) AND
    (t_7_S.d = t_3_Day.d)) IS NULL)
GROUP BY t_3_Day.d)
SELECT
  Day.d AS d
FROM
  t_0_Day AS Day
WHERE
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_2_Missing AS Missing, (select unnest([0]::numeric[]) as unnested_pod) as x_6
  WHERE
    (Missing.d = Day.d)) IS NULL) ORDER BY d;