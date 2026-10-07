WITH t_0_F AS (SELECT * FROM VALUES
  ("a", 1),
  ("b", 2),
  (null, 3)
AS UNUSED_TABLE_NAME(g, w)),
t_2_E AS (SELECT * FROM VALUES
  (1, "a", 10),
  (2, "a", 20),
  (3, "b", null),
  (4, null, 5)
AS UNUSED_TABLE_NAME(id, g, v)),
t_1_Used AS (SELECT
  E.g AS g
FROM
  t_2_E AS E
WHERE
  (E.g IS NOT null)
GROUP BY 1)
SELECT
  F.w AS w
FROM
  t_0_F AS F
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_Used AS Used
  WHERE
    (Used.g = F.g)) IS NULL);