WITH t_2_E AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.name AS name,
  t_1_E.name AS top
FROM
  t_2_E AS E, t_2_E AS t_0_E, t_2_E AS t_1_E
WHERE
  (t_0_E.id = E.boss) AND
  (t_1_E.id = t_0_E.boss) ORDER BY name, top;