use trades;
SELECT stock_symbol, COUNT(*) AS c 
  FROM trade 
  GROUP BY stock_symbol 
  ORDER BY c DESC limit 10;
