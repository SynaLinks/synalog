-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Follows AS (SELECT * FROM (
  
    SELECT
      'ann' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'ann' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'cat' AS a,
      'dan' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'eve' AS b
   UNION ALL
  
    SELECT
      'fay' AS a,
      'cat' AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_Follows.b AS c
FROM
  t_1_Follows AS Follows, t_1_Follows AS t_0_Follows
WHERE
  (t_0_Follows.b IS DISTINCT FROM 'fay') AND
  ((SELECT
    MIN((CASE WHEN x_8.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_1_Follows AS t_2_Follows, (select unnest([0]) as unnested_pod) as x_8
  WHERE
    (t_2_Follows.a = 'fay') AND
    (t_2_Follows.b IS NOT DISTINCT FROM t_0_Follows.b)) IS NULL) AND
  (Follows.a = 'fay') AND
  (t_0_Follows.a IS NOT DISTINCT FROM Follows.b)
GROUP BY t_0_Follows.b;