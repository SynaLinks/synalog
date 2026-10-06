WITH t_0_E AS (SELECT * FROM VALUES
  (1, "ann", 10, null),
  (2, "bob", 10, 1),
  (3, "cid", 20, 1),
  (4, "dee", null, 2),
  (5, "eve", 30, 3),
  (6, "fay", 20, null)
AS UNUSED_TABLE_NAME(id, name, dept, boss)),
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
    (t_1_Boss.id = E.id)) IS NULL) ORDER BY name NULLS LAST;