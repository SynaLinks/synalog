-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
  (CAST((SELECT
    MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_1_S AS t_7_S, UNNEST(ARRAY[0]) as x_17
  WHERE
    (COALESCE(t_7_S.r, '') = COALESCE(Region.r, '') AND (t_7_S.r IS NULL) = (Region.r IS NULL)) AND
    (COALESCE(t_7_S.d, 0) = COALESCE(t_3_Day.d, 0) AND (t_7_S.d IS NULL) = (t_3_Day.d IS NULL))) AS numeric) IS NULL)
GROUP BY t_3_Day.d)
SELECT
  Day.d AS d
FROM
  t_0_Day AS Day
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_2_Missing AS Missing, UNNEST(ARRAY[0]) as x_6
  WHERE
    (COALESCE(Missing.d, 0) = COALESCE(Day.d, 0) AND (Missing.d IS NULL) = (Day.d IS NULL))) AS numeric) IS NULL) ORDER BY d;