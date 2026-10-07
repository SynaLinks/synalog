WITH t_1_S AS (SELECT * FROM VALUES
  (1, "north", "ax", 3, 10.0E0),
  (2, "north", "ax", null, 10.0E0),
  (3, "north", "bo", 5, 4.0E0),
  (4, "south", "ax", 1, 12.0E0),
  (5, "south", "cy", 7, null),
  (6, "south", "cy", 2, 3.0E0),
  (7, "east", "bo", null, null),
  (8, null, "ax", 4, 9.0E0),
  (9, null, "dz", 6, 1.0E0),
  (10, "east", "dz", 8, 2.0E0),
  (11, "north", "cy", 3, 6.0E0),
  (12, "west", "ax", 9, 10.0E0)
AS UNUSED_TABLE_NAME(id, r, p, q, pr)),
t_0_Hi AS (SELECT
  S.r AS k,
  MAX(S.pr) AS v
FROM
  t_1_S AS S
GROUP BY 1),
t_2_Lo AS (SELECT
  t_3_S.r AS k,
  MIN(t_3_S.pr) AS v
FROM
  t_1_S AS t_3_S
GROUP BY 1)
SELECT
  Hi.k AS k,
  ((Hi.v) - (Lo.v)) AS v
FROM
  t_0_Hi AS Hi, t_2_Lo AS Lo
WHERE
  (Lo.k = Hi.k) ORDER BY k NULLS LAST;