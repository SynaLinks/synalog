WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      'ann' AS u,
      31 AS age
   UNION ALL
  
    SELECT
      'bob' AS u,
      25 AS age
   UNION ALL
  
    SELECT
      'cid' AS u,
      40 AS age
   UNION ALL
  
    SELECT
      'dee' AS u,
      19 AS age
   UNION ALL
  
    SELECT
      'eve' AS u,
      52 AS age
   UNION ALL
  
    SELECT
      'fay' AS u,
      28 AS age
   UNION ALL
  
    SELECT
      'gus' AS u,
      35 AS age
  
) AS UNUSED_TABLE_NAME  ),
t_4_F AS (SELECT * FROM (
  
    SELECT
      'ann' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'cid' AS b
   UNION ALL
  
    SELECT
      'cid' AS a,
      'dee' AS b
   UNION ALL
  
    SELECT
      'dee' AS a,
      'cid' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'fay' AS a,
      'fay' AS b
   UNION ALL
  
    SELECT
      'ann' AS a,
      'cid' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_3_C AS (SELECT
  F.b AS b,
  SUM(1) AS n
FROM
  t_4_F AS F
GROUP BY F.b),
t_2_Popular AS (SELECT
  C.b AS u
FROM
  t_3_C AS C
WHERE
  (C.n > 1)
GROUP BY C.b)
SELECT
  t_0_U.u AS u
FROM
  t_1_U AS t_0_U
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_4.value)) AS logica_value
  FROM
    t_2_Popular AS Popular, JSON_EACH(JSON_ARRAY(0)) as x_4
  WHERE
    (Popular.u = t_0_U.u)) IS NULL) ORDER BY u NULLS LAST;