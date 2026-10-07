-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'it''s' AS w
   UNION ALL
  
    SELECT
      2 AS id,
      'say "hi"' AS w
   UNION ALL
  
    SELECT
      3 AS id,
      'café' AS w
   UNION ALL
  
    SELECT
      4 AS id,
      'naïve' AS w
   UNION ALL
  
    SELECT
      5 AS id,
      'a\b' AS w
   UNION ALL
  
    SELECT
      6 AS id,
      '50%' AS w
   UNION ALL
  
    SELECT
      7 AS id,
      'o''neil' AS w
   UNION ALL
  
    SELECT
      8 AS id,
      'x_y' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.id AS id,
  UPPER(t_0_W.w) AS u
FROM
  t_1_W AS t_0_W
WHERE
  (t_0_W.id != 3) AND
  (t_0_W.id != 4) ORDER BY id, u;
