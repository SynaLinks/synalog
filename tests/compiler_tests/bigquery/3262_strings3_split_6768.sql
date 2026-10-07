SELECT
  ARRAY_LENGTH(SPLIT("one--two", "--")) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE SPLIT("one--two", "--")[SAFE_OFFSET(0)] END) AS first,
  (CASE WHEN ((ARRAY_LENGTH(SPLIT("one--two", "--"))) - (1)) < 0 THEN NULL ELSE SPLIT("one--two", "--")[SAFE_OFFSET(((ARRAY_LENGTH(SPLIT("one--two", "--"))) - (1)))] END) AS last;