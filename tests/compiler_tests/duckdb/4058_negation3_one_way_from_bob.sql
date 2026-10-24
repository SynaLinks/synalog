-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
WITH t_0_F AS (SELECT * FROM (
  
    SELECT
      'ann' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'cid' AS b
   UNION ALL
  
    SELECT
      'cid' AS a,
      'dee' AS b
   UNION ALL
  
    SELECT
      'dee' AS a,
      'cid' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'fay' AS a,
      'fay' AS b
   UNION ALL
  
    SELECT
      'ann' AS a,
      'cid' AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  F.b AS v
FROM
  t_0_F AS F
WHERE
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_F AS t_1_F, (select unnest([0]::numeric[]) as unnested_pod) as x_6
  WHERE
    (t_1_F.a = F.b) AND
    (t_1_F.b = 'bob')) IS NULL) AND
  (F.a = 'bob') ORDER BY v;