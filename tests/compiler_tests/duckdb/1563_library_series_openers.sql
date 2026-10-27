-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_IsSequel AS (SELECT
  t_2_Sequel.next AS book
FROM
  t_0_Sequel AS t_2_Sequel
GROUP BY t_2_Sequel.next)
SELECT
  Sequel.book AS book
FROM
  t_0_Sequel AS Sequel
WHERE
  ((SELECT
    MIN((CASE WHEN x_4.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_1_IsSequel AS IsSequel, (select unnest([0]) as unnested_pod) as x_4
  WHERE
    (IsSequel.book IS NOT DISTINCT FROM Sequel.book)) IS NULL)
GROUP BY Sequel.book ORDER BY book;