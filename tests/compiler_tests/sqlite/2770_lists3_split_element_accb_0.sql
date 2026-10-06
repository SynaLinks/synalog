SELECT
  JSON_EXTRACT(SPLIT('a,,b', ','), '$[' || 0 || ']') AS e;