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
  C.zone AS zone
FROM
  t_0_C AS C
WHERE
  (LENGTH('st') <= LENGTH(C.zone) AND SUBSTR(C.zone, LENGTH(C.zone) - LENGTH('st') + 1, LENGTH('st')) = 'st')
GROUP BY C.zone;