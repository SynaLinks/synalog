WITH t_8_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      'b' AS n
   UNION ALL
  
    SELECT
      1 AS k,
      'c' AS n
   UNION ALL
  
    SELECT
      2 AS k,
      'a' AS n
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  ARRAY_AGG(CAST(ROW(V.n) AS ROW(n varchar)) order by V.k) AS l
FROM
  t_8_V AS V),
t_0_J AS (SELECT
  ARRAY_AGG(ELEMENT_AT(t_4_L.l, x_12 + 1).n order by x_12) AS s
FROM
  t_5_L AS t_4_L, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, CARDINALITY(t_4_L.l)), x -> x < CARDINALITY(t_4_L.l)), synalog_e -> ROW(synalog_e))) as pushkin(x_12))
SELECT
  ARRAY_JOIN(J.s, '-') AS s
FROM
  t_0_J AS J;