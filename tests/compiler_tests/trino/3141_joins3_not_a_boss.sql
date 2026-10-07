WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name,
      10 AS dept,
      null AS boss
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name,
      10 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS name,
      20 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS name,
      null AS dept,
      2 AS boss
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS name,
      30 AS dept,
      3 AS boss
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS name,
      20 AS dept,
      null AS boss
  
) AS UNUSED_TABLE_NAME  ),
t_2_Boss AS (SELECT
  t_3_E.boss AS id
FROM
  t_0_E AS t_3_E
WHERE
  (t_3_E.boss IS NOT null)
GROUP BY 1)
SELECT
  E.name AS name
FROM
  t_0_E AS E
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_Boss AS t_1_Boss
  WHERE
    (t_1_Boss.id = E.id)) IS NULL) ORDER BY name;