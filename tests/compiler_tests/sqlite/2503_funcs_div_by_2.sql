WITH t_0_C AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'AB-001' AS code,
      'north' AS zone,
      12.5 AS x
   UNION ALL
  
    SELECT
      2 AS id,
      'AB-017' AS code,
      'south' AS zone,
      -3.75 AS x
   UNION ALL
  
    SELECT
      3 AS id,
      'XY-200' AS code,
      'north' AS zone,
      0.0 AS x
   UNION ALL
  
    SELECT
      4 AS id,
      'XY-031' AS code,
      'east' AS zone,
      7.0 AS x
   UNION ALL
  
    SELECT
      5 AS id,
      'QZ-999' AS code,
      'south' AS zone,
      -12.25 AS x
   UNION ALL
  
    SELECT
      6 AS id,
      'AB-120' AS code,
      'east' AS zone,
      99.9 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  C.id AS id,
  CAST((CASE WHEN ((((C.id) * (7))) < 0) <> ((2) < 0) THEN CEIL(CAST(((C.id) * (7)) AS REAL) / NULLIF(2, 0)) ELSE FLOOR(CAST(((C.id) * (7)) AS REAL) / NULLIF(2, 0)) END) AS INTEGER) AS q
FROM
  t_0_C AS C ORDER BY id NULLS LAST, q NULLS LAST;