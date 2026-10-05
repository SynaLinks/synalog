-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_0_Ship AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'acme' AS client,
      'paris' AS src,
      'lyon' AS dst,
      12 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      2 AS id,
      'acme' AS client,
      'lyon' AS src,
      'nice' AS dst,
      5 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      3 AS id,
      'bolt' AS client,
      'paris' AS src,
      'nice' AS dst,
      30 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      4 AS id,
      'bolt' AS client,
      'nice' AS src,
      'rome' AS dst,
      8 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      5 AS id,
      'cora' AS client,
      'rome' AS src,
      'milan' AS dst,
      14 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      6 AS id,
      'cora' AS client,
      'milan' AS src,
      'paris' AS dst,
      3 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      7 AS id,
      'acme' AS client,
      'paris' AS src,
      'rome' AS dst,
      22 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      8 AS id,
      'dune' AS client,
      'lyon' AS src,
      'paris' AS dst,
      9 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      9 AS id,
      'dune' AS client,
      'nice' AS src,
      'lyon' AS dst,
      11 AS kg,
      'dhl' AS carrier
  
) AS UNUSED_TABLE_NAME  ),
t_2_Excluded_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_3_Ship.id AS id
    FROM
      t_0_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.carrier = 'dhl')
   UNION ALL
  
    SELECT
      t_4_Ship.id AS id
    FROM
      t_0_Ship AS t_4_Ship
    WHERE
      (t_4_Ship.client = 'acme')
  
) AS UNUSED_TABLE_NAME  ),
t_1_Excluded AS (SELECT
  Excluded_MultBodyAggAux.id AS id
FROM
  t_2_Excluded_MultBodyAggAux AS Excluded_MultBodyAggAux
GROUP BY Excluded_MultBodyAggAux.id)
SELECT
  Ship.id AS id
FROM
  t_0_Ship AS Ship
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_4 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_Excluded AS Excluded, UNNEST(ARRAY[0]::numeric[]) as x_4
  WHERE
    (Excluded.id = Ship.id)) AS numeric) IS NULL) ORDER BY id;