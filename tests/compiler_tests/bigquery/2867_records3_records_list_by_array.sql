WITH t_8_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      "b" AS n
   UNION ALL
  
    SELECT
      1 AS k,
      "c" AS n
   UNION ALL
  
    SELECT
      2 AS k,
      "a" AS n
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  ARRAY_AGG(STRUCT(V.n AS n) order by [V.k][offset(0)]) AS l
FROM
  t_8_V AS V),
t_0_J AS (SELECT
  ARRAY_AGG((CASE WHEN x_12 < 0 THEN NULL ELSE t_4_L.l[SAFE_OFFSET(x_12)] END).n order by [x_12][offset(0)]) AS s
FROM
  t_5_L AS t_4_L, UNNEST(GENERATE_ARRAY(0, ARRAY_LENGTH(t_4_L.l) - 1)) as x_12)
SELECT
  ARRAY_TO_STRING(J.s, "-") AS s
FROM
  t_0_J AS J;