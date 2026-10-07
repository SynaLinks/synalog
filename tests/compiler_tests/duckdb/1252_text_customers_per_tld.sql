-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Customer AS (SELECT * FROM (
  
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
  (CASE WHEN ((LEN(SPLIT(Customer.email, '.'))) - (1)) < 0 THEN NULL ELSE array_extract(SPLIT(Customer.email, '.'), CAST(((LEN(SPLIT(Customer.email, '.'))) - (1)) + 1 AS BIGINT)) END) AS tld,
  SUM(1) AS n
FROM
  t_1_Customer AS Customer
GROUP BY (CASE WHEN ((LEN(SPLIT(Customer.email, '.'))) - (1)) < 0 THEN NULL ELSE array_extract(SPLIT(Customer.email, '.'), CAST(((LEN(SPLIT(Customer.email, '.'))) - (1)) + 1 AS BIGINT)) END) ORDER BY tld, n;