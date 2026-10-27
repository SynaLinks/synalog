-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
  (t_5_S.r = 'south') AND
  (t_6_S.r = 'south')
GROUP BY t_5_S.d),
t_9_Next AS (SELECT
  t_10_S.d AS d,
  MIN(t_11_S.d) AS n
FROM
  t_0_S AS t_10_S, t_0_S AS t_11_S
WHERE
  (t_11_S.d > t_10_S.d) AND
  (t_10_S.r = 'south') AND
  (t_11_S.r = 'south')
GROUP BY t_10_S.d),
t_1_Lower AS (SELECT * FROM (
  
    SELECT
      Prev.d AS d
    FROM
      t_4_Prev AS Prev, t_0_S AS t_2_S, t_0_S AS t_3_S
    WHERE
      (t_3_S.v >= t_2_S.v) AND
      (t_2_S.r = 'south') AND
      (COALESCE(t_2_S.d, 0) = COALESCE(Prev.d, 0) AND (t_2_S.d IS NULL) = (Prev.d IS NULL)) AND
      (t_3_S.r = 'south') AND
      (COALESCE(t_3_S.d, 0) = COALESCE(Prev.p, 0) AND (t_3_S.d IS NULL) = (Prev.p IS NULL))
   UNION ALL
  
    SELECT
      Next.d AS d
    FROM
      t_9_Next AS Next, t_0_S AS t_7_S, t_0_S AS t_8_S
    WHERE
      (t_8_S.v >= t_7_S.v) AND
      (t_7_S.r = 'south') AND
      (COALESCE(t_7_S.d, 0) = COALESCE(Next.d, 0) AND (t_7_S.d IS NULL) = (Next.d IS NULL)) AND
      (t_8_S.r = 'south') AND
      (COALESCE(t_8_S.d, 0) = COALESCE(Next.n, 0) AND (t_8_S.d IS NULL) = (Next.n IS NULL))
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS ok
FROM
  t_0_S AS S
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_4 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_1_Lower AS Lower, UNNEST(ARRAY[0]) as x_4
  WHERE
    (Lower.d = 5)) AS numeric) IS NULL) AND
  (S.r = 'south') AND
  (S.d = 5);