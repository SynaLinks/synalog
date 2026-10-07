WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      'b' AS w
   UNION ALL
  
    SELECT
      'a' AS w
   UNION ALL
  
    SELECT
      'B' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ArgMin(V.w, V.w, null) AS l
FROM
  t_4_V AS V)
SELECT
  (CASE WHEN t_0_L.l IS NULL OR ',' IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(value, ',') FROM (SELECT value FROM JSON_EACH(t_0_L.l) WHERE value IS NOT NULL ORDER BY key)), '') END) AS s
FROM
  t_1_L AS t_0_L;