SELECT
  CARDINALITY(SPLIT('a, b', ',')) AS n,
  ARRAY_JOIN(SPLIT('a, b', ','), ',') AS s;