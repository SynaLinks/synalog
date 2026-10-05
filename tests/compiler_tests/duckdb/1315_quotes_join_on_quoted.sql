-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_W AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_3_Kind AS (SELECT * FROM (
  
    SELECT
      'it''s' AS w,
      'apostrophe' AS kind
   UNION ALL
  
    SELECT
      'o''neil' AS w,
      'apostrophe' AS kind
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.id AS id,
  t_1_Kind.kind AS kind
FROM
  t_2_W AS t_0_W, t_3_Kind AS t_1_Kind
WHERE
  (t_1_Kind.w = t_0_W.w) ORDER BY id, kind;
