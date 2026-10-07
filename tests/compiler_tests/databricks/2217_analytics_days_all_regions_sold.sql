WITH t_1_S AS (SELECT * FROM VALUES
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
t_0_Day AS (SELECT
  S.d AS d
FROM
  t_1_S AS S
GROUP BY 1),
t_5_Region AS (SELECT
  t_6_S.r AS r
FROM
  t_1_S AS t_6_S
GROUP BY 1),
t_2_Missing AS (SELECT
  t_3_Day.d AS d
FROM
  t_0_Day AS t_3_Day, t_5_Region AS Region
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_S AS t_7_S
  WHERE
    (t_7_S.r = Region.r) AND
    (t_7_S.d = t_3_Day.d)) IS NULL)
GROUP BY 1)
SELECT
  Day.d AS d
FROM
  t_0_Day AS Day
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_Missing AS Missing
  WHERE
    (Missing.d = Day.d)) IS NULL) ORDER BY d NULLS LAST;
