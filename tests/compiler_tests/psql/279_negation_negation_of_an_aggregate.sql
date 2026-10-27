-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      10 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      1 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_K AS (SELECT
  R.k AS k
FROM
  t_2_R AS R
GROUP BY R.k),
t_3_Loud AS (SELECT
  t_4_R.k AS k
FROM
  t_2_R AS t_4_R
WHERE
  (t_4_R.v > 5)
GROUP BY t_4_R.k)
SELECT
  t_0_K.k AS k
FROM
  t_1_K AS t_0_K
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_3_Loud AS Loud, UNNEST(ARRAY[0]) as x_6
  WHERE
    (COALESCE(Loud.k, '') = COALESCE(t_0_K.k, '') AND (Loud.k IS NULL) = (t_0_K.k IS NULL))) AS numeric) IS NULL) ORDER BY k;