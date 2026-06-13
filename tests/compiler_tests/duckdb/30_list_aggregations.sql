-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_1_Tags AS (SELECT * FROM (
  
    SELECT
      E'post1' AS col0,
      E'tech' AS col1
   UNION ALL
  
    SELECT
      E'post1' AS col0,
      E'news' AS col1
   UNION ALL
  
    SELECT
      E'post1' AS col0,
      E'featured' AS col1
   UNION ALL
  
    SELECT
      E'post2' AS col0,
      E'tech' AS col1
   UNION ALL
  
    SELECT
      E'post2' AS col0,
      E'tutorial' AS col1
   UNION ALL
  
    SELECT
      E'post3' AS col0,
      E'news' AS col1
   UNION ALL
  
    SELECT
      E'post3' AS col0,
      E'news' AS col1
  
) AS UNUSED_TABLE_NAME  ),
t_0_TagCount AS (SELECT
  Tags.col0 AS col0,
  SUM(1) AS count
FROM
  t_1_Tags AS Tags
GROUP BY Tags.col0)
SELECT
  TagCount.col0 AS post,
  TagCount.count AS count
FROM
  t_0_TagCount AS TagCount ORDER BY post;