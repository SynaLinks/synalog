-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_4_S AS (SELECT * FROM (
  
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
t_5_N AS (SELECT
  SUM(1) AS n
FROM
  t_4_S AS t_7_S
WHERE
  (t_7_S.r = 'east')),
t_9_Before_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_12_S.d AS d,
      t_13_S.d AS e
    FROM
      t_4_S AS t_12_S, t_4_S AS t_13_S
    WHERE
      (t_13_S.v < t_12_S.v) AND
      (t_12_S.r = 'east') AND
      (t_13_S.r = 'east')
   UNION ALL
  
    SELECT
      t_16_S.d AS d,
      t_17_S.d AS e
    FROM
      t_4_S AS t_16_S, t_4_S AS t_17_S
    WHERE
      (t_17_S.d < t_16_S.d) AND
      (COALESCE(t_17_S.v, 0) = COALESCE(t_16_S.v, 0) AND (t_17_S.v IS NULL) = (t_16_S.v IS NULL)) AND
      (t_16_S.r = 'east') AND
      (t_17_S.r = 'east')
  
) AS UNUSED_TABLE_NAME  ),
t_8_Before AS (SELECT
  Before_MultBodyAggAux.d AS d,
  Before_MultBodyAggAux.e AS e
FROM
  t_9_Before_MultBodyAggAux AS Before_MultBodyAggAux
GROUP BY Before_MultBodyAggAux.d, Before_MultBodyAggAux.e),
t_0_Mid AS (SELECT * FROM (
  
    SELECT
      S.v AS v
    FROM
      t_4_S AS S, t_5_N AS t_2_N
    WHERE
      (COALESCE(((((2) * (COALESCE(CAST((SELECT
        SUM((CASE WHEN x_24 = 0 THEN 1 ELSE NULL END)) AS synalog_value
      FROM
        t_8_Before AS Before, UNNEST(ARRAY[0]) as x_24
      WHERE
        (COALESCE(Before.d, 0) = COALESCE(S.d, 0) AND (Before.d IS NULL) = (S.d IS NULL))) AS numeric), 0)))) + (1)), 0) = COALESCE(t_2_N.n, 0) AND (((((2) * (COALESCE(CAST((SELECT
        SUM((CASE WHEN x_24 = 0 THEN 1 ELSE NULL END)) AS synalog_value
      FROM
        t_8_Before AS Before, UNNEST(ARRAY[0]) as x_24
      WHERE
        (COALESCE(Before.d, 0) = COALESCE(S.d, 0) AND (Before.d IS NULL) = (S.d IS NULL))) AS numeric), 0)))) + (1)) IS NULL) = (t_2_N.n IS NULL)) AND
      (S.r = 'east')
   UNION ALL
  
    SELECT
      t_21_S.v AS v
    FROM
      t_4_S AS t_21_S, t_5_N AS t_19_N
    WHERE
      (COALESCE(((2) * (COALESCE(CAST((SELECT
        SUM((CASE WHEN x_84 = 0 THEN 1 ELSE NULL END)) AS synalog_value
      FROM
        t_8_Before AS t_24_Before, UNNEST(ARRAY[0]) as x_84
      WHERE
        (COALESCE(t_24_Before.d, 0) = COALESCE(t_21_S.d, 0) AND (t_24_Before.d IS NULL) = (t_21_S.d IS NULL))) AS numeric), 0))), 0) = COALESCE(t_19_N.n, 0) AND (((2) * (COALESCE(CAST((SELECT
        SUM((CASE WHEN x_84 = 0 THEN 1 ELSE NULL END)) AS synalog_value
      FROM
        t_8_Before AS t_24_Before, UNNEST(ARRAY[0]) as x_84
      WHERE
        (COALESCE(t_24_Before.d, 0) = COALESCE(t_21_S.d, 0) AND (t_24_Before.d IS NULL) = (t_21_S.d IS NULL))) AS numeric), 0))) IS NULL) = (t_19_N.n IS NULL)) AND
      (t_21_S.r = 'east')
   UNION ALL
  
    SELECT
      t_37_S.v AS v
    FROM
      t_4_S AS t_37_S, t_5_N AS t_35_N
    WHERE
      (COALESCE(((((2) * (COALESCE(CAST((SELECT
        SUM((CASE WHEN x_138 = 0 THEN 1 ELSE NULL END)) AS synalog_value
      FROM
        t_8_Before AS t_38_Before, UNNEST(ARRAY[0]) as x_138
      WHERE
        (COALESCE(t_38_Before.d, 0) = COALESCE(t_37_S.d, 0) AND (t_38_Before.d IS NULL) = (t_37_S.d IS NULL))) AS numeric), 0)))) + (2)), 0) = COALESCE(t_35_N.n, 0) AND (((((2) * (COALESCE(CAST((SELECT
        SUM((CASE WHEN x_138 = 0 THEN 1 ELSE NULL END)) AS synalog_value
      FROM
        t_8_Before AS t_38_Before, UNNEST(ARRAY[0]) as x_138
      WHERE
        (COALESCE(t_38_Before.d, 0) = COALESCE(t_37_S.d, 0) AND (t_38_Before.d IS NULL) = (t_37_S.d IS NULL))) AS numeric), 0)))) + (2)) IS NULL) = (t_35_N.n IS NULL)) AND
      (t_37_S.r = 'east')
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AVG(Mid.v) AS m
FROM
  t_0_Mid AS Mid;
