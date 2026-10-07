SELECT
  CARDINALITY(SPLIT('', ',')) AS n,
  ARRAY_JOIN(SPLIT('', ','), ',') AS s;