WITH t_0_P AS (SELECT * FROM VALUES
  ("a", 1),
  ("b", 2)
AS UNUSED_TABLE_NAME(n, k))
SELECT
  P.n AS n
FROM
  t_0_P AS P
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_P AS t_1_P
  WHERE
    (P.n = t_1_P.n) AND
    (t_1_P.k = 1)) IS NULL);