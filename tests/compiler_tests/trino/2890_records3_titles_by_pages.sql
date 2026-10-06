WITH t_8_B AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Dune' AS title,
      'herbert' AS author,
      1965 AS year,
      412 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      2 AS id,
      'Emma' AS title,
      'austen' AS author,
      1815 AS year,
      474 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      3 AS id,
      'Ubik' AS title,
      'dick' AS author,
      1969 AS year,
      202 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      4 AS id,
      'Kim' AS title,
      'kipling' AS author,
      1901 AS year,
      368 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      5 AS id,
      'Solaris' AS title,
      'lem' AS author,
      1961 AS year,
      204 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      6 AS id,
      'Persuasion' AS title,
      'austen' AS author,
      1817 AS year,
      249 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      7 AS id,
      'Valis' AS title,
      'dick' AS author,
      1981 AS year,
      271 AS pages,
      true AS sf
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  ARRAY_AGG(CAST(ROW(B.title) AS ROW(t varchar)) order by B.pages) AS l
FROM
  t_8_B AS B),
t_0_J AS (SELECT
  ARRAY_AGG(ELEMENT_AT(t_4_L.l, x_12 + 1).t order by x_12) AS s
FROM
  t_5_L AS t_4_L, UNNEST(TRANSFORM(FILTER(SEQUENCE(0, CARDINALITY(t_4_L.l)), x -> x < CARDINALITY(t_4_L.l)), synalog_e -> ROW(synalog_e))) as pushkin(x_12))
SELECT
  ARRAY_JOIN(J.s, ', ') AS s
FROM
  t_0_J AS J;