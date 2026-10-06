SELECT
  ARRAY_LENGTH(SPLIT("one--two", "--")) AS n,
  SPLIT("one--two", "--")[OFFSET(0)] AS first,
  SPLIT("one--two", "--")[OFFSET(((ARRAY_LENGTH(SPLIT("one--two", "--"))) - (1)))] AS last;