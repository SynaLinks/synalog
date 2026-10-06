WITH t_9_B AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Dune' AS title,
      'herbert' AS author,
      1965 AS year,
      412 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      2 AS id,
      'Emma' AS title,
      'austen' AS author,
      1815 AS year,
      474 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      3 AS id,
      'Ubik' AS title,
      'dick' AS author,
      1969 AS year,
      202 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      4 AS id,
      'Kim' AS title,
      'kipling' AS author,
      1901 AS year,
      368 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      5 AS id,
      'Solaris' AS title,
      'lem' AS author,
      1961 AS year,
      204 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      6 AS id,
      'Persuasion' AS title,
      'austen' AS author,
      1817 AS year,
      249 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      7 AS id,
      'Valis' AS title,
      'dick' AS author,
      1981 AS year,
      271 AS pages,
      true AS sf
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  ArgMin(JSON_OBJECT('t', B.title), B.pages, null) AS l
FROM
  t_9_B AS B),
t_0_J AS (SELECT
  ArgMin(JSON_EXTRACT(JSON_EXTRACT(t_4_L.l, '$[' || x_12.value || ']'), "$.t"), x_12.value, null) AS s
FROM
  t_5_L AS t_4_L, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < JSON_ARRAY_LENGTH(t_4_L.l)) select n from t) where n < JSON_ARRAY_LENGTH(t_4_L.l))) as x_12)
SELECT
  (CASE WHEN J.s IS NULL OR ', ' IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(value, ', ') FROM (SELECT value FROM JSON_EACH(J.s) WHERE value IS NOT NULL ORDER BY key)), '') END) AS s
FROM
  t_0_J AS J;