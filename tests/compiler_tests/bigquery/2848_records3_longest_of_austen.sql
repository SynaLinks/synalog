WITH t_2_B AS (SELECT * FROM (
  
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
t_0_L AS (SELECT
  ARRAY_AGG(STRUCT(B.title AS title, B.pages AS pages) order by  [B.pages][offset(0)] desc limit 1)[OFFSET(0)] AS best
FROM
  t_2_B AS B
WHERE
  (B.author = "austen"))
SELECT
  L.best.title AS title,
  L.best.pages AS pages
FROM
  t_0_L AS L;