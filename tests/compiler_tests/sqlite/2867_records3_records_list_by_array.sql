WITH t_9_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      'b' AS n
   UNION ALL
  
    SELECT
      1 AS k,
      'c' AS n
   UNION ALL
  
    SELECT
      2 AS k,
      'a' AS n
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  ArgMin(JSON_OBJECT('n', V.n), V.k, null) AS l
FROM
  t_9_V AS V),
t_0_J AS (SELECT
  ArgMin(JSON_EXTRACT(JSON_EXTRACT(t_4_L.l, '$[' || x_12.value || ']'), "$.n"), x_12.value, null) AS s
FROM
  t_5_L AS t_4_L, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < JSON_ARRAY_LENGTH(t_4_L.l)) select n from t) where n < JSON_ARRAY_LENGTH(t_4_L.l))) as x_12)
SELECT
  (CASE WHEN J.s IS NULL OR '-' IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(value, '-') FROM (SELECT value FROM JSON_EACH(J.s) WHERE value IS NOT NULL ORDER BY key)), '') END) AS s
FROM
  t_0_J AS J;