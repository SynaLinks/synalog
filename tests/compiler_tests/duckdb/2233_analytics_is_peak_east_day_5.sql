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
WITH t_0_S AS (SELECT * FROM (
  
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
t_4_Prev AS (SELECT
  t_5_S.d AS d,
  MAX(t_6_S.d) AS p
FROM
  t_0_S AS t_5_S, t_0_S AS t_6_S
WHERE
  (t_6_S.d < t_5_S.d) AND
  (t_5_S.r = 'east') AND
  (t_6_S.r = 'east')
GROUP BY t_5_S.d),
t_9_Next AS (SELECT
  t_10_S.d AS d,
  MIN(t_11_S.d) AS n
FROM
  t_0_S AS t_10_S, t_0_S AS t_11_S
WHERE
  (t_11_S.d > t_10_S.d) AND
  (t_10_S.r = 'east') AND
  (t_11_S.r = 'east')
GROUP BY t_10_S.d),
t_1_Lower AS (SELECT * FROM (
  
    SELECT
      Prev.d AS d
    FROM
      t_4_Prev AS Prev, t_0_S AS t_2_S, t_0_S AS t_3_S
    WHERE
      (t_3_S.v >= t_2_S.v) AND
      (t_2_S.r = 'east') AND
      (t_2_S.d = Prev.d) AND
      (t_3_S.r = 'east') AND
      (t_3_S.d = Prev.p)
   UNION ALL
  
    SELECT
      Next.d AS d
    FROM
      t_9_Next AS Next, t_0_S AS t_7_S, t_0_S AS t_8_S
    WHERE
      (t_8_S.v >= t_7_S.v) AND
      (t_7_S.r = 'east') AND
      (t_7_S.d = Next.d) AND
      (t_8_S.r = 'east') AND
      (t_8_S.d = Next.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS ok
FROM
  t_0_S AS S
WHERE
  ((SELECT
    MIN((CASE WHEN x_4.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_Lower AS Lower, (select unnest([0]::numeric[]) as unnested_pod) as x_4
  WHERE
    (Lower.d = 5)) IS NULL) AND
  (S.r = 'east') AND
  (S.d = 5);