WITH t_8_B AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "Dune" AS title,
      "herbert" AS author,
      1965 AS year,
      412 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      2 AS id,
      "Emma" AS title,
      "austen" AS author,
      1815 AS year,
      474 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      3 AS id,
      "Ubik" AS title,
      "dick" AS author,
      1969 AS year,
      202 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      4 AS id,
      "Kim" AS title,
      "kipling" AS author,
      1901 AS year,
      368 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      5 AS id,
      "Solaris" AS title,
      "lem" AS author,
      1961 AS year,
      204 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      6 AS id,
      "Persuasion" AS title,
      "austen" AS author,
      1817 AS year,
      249 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      7 AS id,
      "Valis" AS title,
      "dick" AS author,
      1981 AS year,
      271 AS pages,
      true AS sf
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  ARRAY_AGG(STRUCT(B.title AS t) order by [B.pages][offset(0)]) AS l
FROM
  t_8_B AS B),
t_0_J AS (SELECT
  ARRAY_AGG(t_4_L.l[OFFSET(x_12)].t order by [x_12][offset(0)]) AS s
FROM
  t_5_L AS t_4_L, UNNEST(GENERATE_ARRAY(0, ARRAY_LENGTH(t_4_L.l) - 1)) as x_12)
SELECT
  ARRAY_TO_STRING(J.s, ", ") AS s
FROM
  t_0_J AS J;