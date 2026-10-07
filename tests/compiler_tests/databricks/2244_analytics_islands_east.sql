WITH t_4_S AS (SELECT * FROM VALUES
  ("north", 1, 5),
  ("north", 2, 8),
  ("north", 3, 3),
  ("north", 5, 9),
  ("north", 6, 1),
  ("south", 1, 7),
  ("south", 2, 7),
  ("south", 4, 2),
  ("south", 5, 6),
  ("east", 2, 4),
  ("east", 3, 11),
  ("east", 4, 6),
  ("east", 5, 10),
  ("east", 7, 3)
AS UNUSED_TABLE_NAME(r, d, v)),
t_3_D AS (SELECT
  S.d AS d
FROM
  t_4_S AS S
WHERE
  (S.r = "east")
GROUP BY 1)
SELECT
  t_1_D.d AS first,
  MIN(t_2_D.d) AS last
FROM
  t_3_D AS t_1_D, t_3_D AS t_2_D
WHERE
  (t_2_D.d >= t_1_D.d) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_D AS t_6_D
  WHERE
    (t_6_D.d = ((t_1_D.d) - (1)))) IS NULL) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_D AS t_7_D
  WHERE
    (t_7_D.d = ((t_2_D.d) + (1)))) IS NULL)
GROUP BY 1 ORDER BY first NULLS LAST, last NULLS LAST;
