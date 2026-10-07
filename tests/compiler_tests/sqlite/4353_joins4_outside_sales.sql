WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS n,
      null AS boss,
      10 AS d,
      5000 AS pay
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS n,
      1 AS boss,
      10 AS d,
      4000 AS pay
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS n,
      1 AS boss,
      20 AS d,
      4200 AS pay
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS n,
      2 AS boss,
      10 AS d,
      3000 AS pay
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS n,
      3 AS boss,
      20 AS d,
      3100 AS pay
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS n,
      3 AS boss,
      null AS d,
      2900 AS pay
   UNION ALL
  
    SELECT
      7 AS id,
      'gus' AS n,
      null AS boss,
      30 AS d,
      6000 AS pay
   UNION ALL
  
    SELECT
      8 AS id,
      'hal' AS n,
      7 AS boss,
      30 AS d,
      2500 AS pay
  
) AS UNUSED_TABLE_NAME  ),
t_2_D AS (SELECT * FROM (
  
    SELECT
      10 AS d,
      'sales' AS dn,
      'paris' AS city
   UNION ALL
  
    SELECT
      20 AS d,
      'tech' AS dn,
      'oslo' AS city
   UNION ALL
  
    SELECT
      30 AS d,
      'ops' AS dn,
      'paris' AS city
   UNION ALL
  
    SELECT
      40 AS d,
      'legal' AS dn,
      'rome' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.n AS n
FROM
  t_1_E AS E, t_2_D AS t_0_D
WHERE
  (t_0_D.dn != 'sales') AND
  (t_0_D.d = E.d) ORDER BY n NULLS LAST;