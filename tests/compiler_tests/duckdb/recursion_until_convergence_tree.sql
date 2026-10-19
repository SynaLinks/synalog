-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_1_Child AS (SELECT * FROM (
  
    SELECT
      'root' AS p,
      'a' AS c
   UNION ALL
  
    SELECT
      'a' AS p,
      'b' AS c
   UNION ALL
  
    SELECT
      'b' AS p,
      'c' AS c
   UNION ALL
  
    SELECT
      'a' AS p,
      'd' AS c
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Child.c AS n
      FROM
        t_1_Child AS Child
      WHERE
        (Child.p = 'root')
     UNION ALL
    
      SELECT
        t_2_Child.c AS n
      FROM
        t_1_Child AS t_4_Child, t_1_Child AS t_2_Child
      WHERE
        (1 = 0) AND
        (t_4_Child.p = 'root') AND
        (t_2_Child.p = t_4_Child.c)
     UNION ALL
    
      SELECT
        t_6_Child.c AS n
      FROM
        t_1_Child AS t_10_Child, t_1_Child AS t_8_Child, t_1_Child AS t_6_Child
      WHERE
        (1 = 0) AND
        (t_6_Child.p = t_8_Child.c) AND
        (t_10_Child.p = 'root') AND
        (t_8_Child.p = t_10_Child.c)
     UNION ALL
    
      SELECT
        t_12_Child.c AS n
      FROM
        t_1_Child AS t_18_Child, t_1_Child AS t_16_Child, t_1_Child AS t_14_Child, t_1_Child AS t_12_Child
      WHERE
        (1 = 0) AND
        (t_12_Child.p = t_14_Child.c) AND
        (t_14_Child.p = t_16_Child.c) AND
        (t_18_Child.p = 'root') AND
        (t_16_Child.p = t_18_Child.c)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_20_Child.c AS n
FROM
  t_0_Below_RecursiveCte AS t_19_Below_RecursiveCte, t_1_Child AS t_20_Child
WHERE
  (t_20_Child.p = t_19_Below_RecursiveCte.n))
SELECT
  Below_RecursiveCte.n AS n
FROM
  t_0_Below_RecursiveCte AS Below_RecursiveCte
GROUP BY Below_RecursiveCte.n ORDER BY n;