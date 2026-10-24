-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
WITH t_0_Customer AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Ada' AS first,
      'Lovelace' AS last,
      'ada@analytical.org' AS email
   UNION ALL
  
    SELECT
      2 AS id,
      'alan' AS first,
      'TURING' AS last,
      'alan@bletchley.uk' AS email
   UNION ALL
  
    SELECT
      3 AS id,
      'Grace' AS first,
      'Hopper' AS last,
      'grace@navy.mil' AS email
   UNION ALL
  
    SELECT
      4 AS id,
      'Edsger' AS first,
      'Dijkstra' AS last,
      'ewd@utexas.edu' AS email
   UNION ALL
  
    SELECT
      5 AS id,
      'Barbara' AS first,
      'Liskov' AS last,
      'liskov@mit.edu' AS email
   UNION ALL
  
    SELECT
      6 AS id,
      'Ken' AS first,
      'Thompson' AS last,
      'ken@bell-labs.com' AS email
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Customer.id AS id,
  ((LENGTH(Customer.first)) + (LENGTH(Customer.last))) AS n
FROM
  t_0_Customer AS Customer ORDER BY id, n;