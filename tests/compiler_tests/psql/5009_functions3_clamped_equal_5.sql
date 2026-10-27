-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      3 AS x,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -4 AS x,
      'hello' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      CAST(null AS numeric) AS x,
      'x' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      CAST(null AS text) AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'seven' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k
FROM
  t_1_V AS V
WHERE
  (COALESCE((CASE WHEN 0 IS NULL OR (CASE WHEN V.x IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(V.x, 5) END) IS NULL THEN NULL ELSE GREATEST(0, (CASE WHEN V.x IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(V.x, 5) END)) END), 0) = COALESCE((CASE WHEN 0 IS NULL OR (CASE WHEN 5 IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(5, 5) END) IS NULL THEN NULL ELSE GREATEST(0, (CASE WHEN 5 IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(5, 5) END)) END), 0) AND ((CASE WHEN 0 IS NULL OR (CASE WHEN V.x IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(V.x, 5) END) IS NULL THEN NULL ELSE GREATEST(0, (CASE WHEN V.x IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(V.x, 5) END)) END) IS NULL) = ((CASE WHEN 0 IS NULL OR (CASE WHEN 5 IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(5, 5) END) IS NULL THEN NULL ELSE GREATEST(0, (CASE WHEN 5 IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(5, 5) END)) END) IS NULL)) ORDER BY k;