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
t_1_D AS (SELECT * FROM (
  
    SELECT
      10 AS dept,
      'eng' AS dname,
      'paris' AS city
   UNION ALL
  
    SELECT
      20 AS dept,
      'ops' AS dname,
      'lyon' AS city
   UNION ALL
  
    SELECT
      40 AS dept,
      'hr' AS dname,
      'nice' AS city
   UNION ALL
  
    SELECT
      null AS dept,
      'temp' AS dname,
      'lyon' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      E.name AS name,
      D.dname AS dname
    FROM
      t_0_E AS E, t_1_D AS D
    WHERE
      (D.dept = E.dept)
   UNION ALL
  
    SELECT
      E.name AS name,
      'none' AS dname
    FROM
      t_0_E AS E
    WHERE
      ((SELECT
        MIN(MagicalEntangle(1, x_4.value)) AS logica_value
      FROM
        t_0_E, t_1_D AS D, JSON_EACH(JSON_ARRAY(0)) as x_4
      WHERE
        (D.dept = t_0_E.dept) AND
        (E.name = t_0_E.name)) IS NULL)
  
) AS UNUSED_TABLE_NAME  ORDER BY name, dname ;