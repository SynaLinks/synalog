WITH t_1_I AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'red' AS c,
      10 AS p,
      null AS t
   UNION ALL
  
    SELECT
      2 AS id,
      'blue' AS c,
      25 AS p,
      'x' AS t
   UNION ALL
  
    SELECT
      3 AS id,
      'red' AS c,
      40 AS p,
      'y' AS t
   UNION ALL
  
    SELECT
      4 AS id,
      'green' AS c,
      5 AS p,
      null AS t
   UNION ALL
  
    SELECT
      5 AS id,
      'blue' AS c,
      60 AS p,
      'x' AS t
   UNION ALL
  
    SELECT
      6 AS id,
      null AS c,
      30 AS p,
      'z' AS t
   UNION ALL
  
    SELECT
      7 AS id,
      'green' AS c,
      45 AS p,
      'y' AS t
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      I.id AS id
    FROM
      t_1_I AS I
    WHERE
      (I.c != 'green')
   UNION ALL
  
    SELECT
      t_2_I.id AS id
    FROM
      t_1_I AS t_2_I
    WHERE
      (t_2_I.p > 50)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.id AS id
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY id;