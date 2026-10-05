DROP TABLE IF EXISTS logica_test.Even;
CREATE TABLE logica_test.Even AS SELECT
  x_3 AS col0
FROM
  UNNEST(FILTER(SEQUENCE(0, 10), x -> x < 10)) as pushkin(x_3)
WHERE
  ((MOD(x_3, 2)) = 0);

-- Interacting with table logica_test.Even

DROP TABLE IF EXISTS logica_test.Odd;
CREATE TABLE logica_test.Odd AS SELECT
  x_3 AS col0
FROM
  UNNEST(FILTER(SEQUENCE(0, 10), x -> x < 10)) as pushkin(x_3)
WHERE
  ((MOD(x_3, 2)) = 1);

-- Interacting with table logica_test.Odd

WITH t_0_AllSquares AS (SELECT * FROM (
  
    SELECT
      Even.col0 AS x,
      ((Even.col0) * (Even.col0)) AS sq,
      'even' AS type
    FROM
      logica_test.Even AS Even
   UNION ALL
  
    SELECT
      Odd.col0 AS x,
      ((Odd.col0) * (Odd.col0)) AS sq,
      'odd' AS type
    FROM
      logica_test.Odd AS Odd
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AllSquares.x AS x,
  AllSquares.sq AS sq,
  AllSquares.type AS type
FROM
  t_0_AllSquares AS AllSquares ORDER BY x;