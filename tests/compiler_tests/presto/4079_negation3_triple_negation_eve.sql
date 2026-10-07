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
t_6_F AS (SELECT * FROM (
  
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
t_4_N1 AS (SELECT
  t_5_U.u AS v
FROM
  t_1_U AS t_5_U
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_6_F AS F
  WHERE
    (F.a = 'eve') AND
    (F.b = t_5_U.u)) IS NULL)),
t_2_N2 AS (SELECT
  t_3_U.u AS v
FROM
  t_1_U AS t_3_U
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_4_N1 AS N1
  WHERE
    (N1.v = t_3_U.u)) IS NULL))
SELECT
  t_0_U.u AS v
FROM
  t_1_U AS t_0_U
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_N2 AS N2
  WHERE
    (N2.v = t_0_U.u)) IS NULL) ORDER BY v;