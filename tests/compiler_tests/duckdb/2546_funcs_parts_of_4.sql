-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_C AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'AB-001' AS code,
      'north' AS zone,
      12.5E0 AS x
   UNION ALL
  
    SELECT
      2 AS id,
      'AB-017' AS code,
      'south' AS zone,
      -3.75E0 AS x
   UNION ALL
  
    SELECT
      3 AS id,
      'XY-200' AS code,
      'north' AS zone,
      0.0E0 AS x
   UNION ALL
  
    SELECT
      4 AS id,
      'XY-031' AS code,
      'east' AS zone,
      7.0E0 AS x
   UNION ALL
  
    SELECT
      5 AS id,
      'QZ-999' AS code,
      'south' AS zone,
      -12.25E0 AS x
   UNION ALL
  
    SELECT
      6 AS id,
      'AB-120' AS code,
      'east' AS zone,
      99.9E0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (CASE WHEN regexp_matches(C.code, '^[A-Z]+') THEN regexp_extract(C.code, '^[A-Z]+') END) AS pre,
  CAST((CASE WHEN regexp_matches(C.code, '[0-9]+$') THEN regexp_extract(C.code, '[0-9]+$') END) AS BIGINT) AS n
FROM
  t_0_C AS C
WHERE
  (C.id = 4);