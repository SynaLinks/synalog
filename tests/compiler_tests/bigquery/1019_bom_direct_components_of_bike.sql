WITH t_0_Uses AS (SELECT * FROM (
  
    SELECT
      "bike" AS part,
      "frame" AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      "bike" AS part,
      "wheel" AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      "wheel" AS part,
      "rim" AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      "wheel" AS part,
      "spoke" AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      "wheel" AS part,
      "hub" AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      "hub" AS part,
      "bearing" AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      "frame" AS part,
      "tube" AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      "scooter" AS part,
      "wheel" AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      "scooter" AS part,
      "deck" AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Uses.component AS component,
  Uses.qty AS qty
FROM
  t_0_Uses AS Uses
WHERE
  (Uses.part = "bike") ORDER BY component;