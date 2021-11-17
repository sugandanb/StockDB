use trades;
SELECT stock_symbol, VARIANCE(share_price) var 
  FROM trade 
  GROUP BY stock_symbol 
  ORDER BY var DESC limit 10;
