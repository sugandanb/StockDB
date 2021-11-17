WITH folio AS (
  SELECT id, stock_symbol, shares, share_price, trade_time
  FROM trade 
),
AggCalcs AS (
  SELECT
    stock_symbol AS ACsymb,
    MAX(share_price) AS pmax,
    MIN(share_price) AS pmin,
    STD(share_price) AS pstd,
    SUM(share_price*shares)/SUM(shares) AS avg_pps,  ## Weighted Average
    SUM(share_price*shares) AS total_pvalue
  FROM trade 
  GROUP BY 1
)
SELECT 
  DISTINCT folio.stock_symbol,
  avg_pps,
  pmin,
  pmax,
  percentile_cont(.25) WITHIN group (ORDER BY share_price) OVER (PARTITION BY stock_symbol) AS Q1,
  percentile_cont(.5) WITHIN group (ORDER BY share_price) OVER (PARTITION BY stock_symbol)  AS median,
  percentile_cont(.75) WITHIN group (ORDER BY share_price) OVER (PARTITION BY stock_symbol) AS Q3
FROM folio
JOIN AggCalcs ON (folio.stock_symbol = ACsymb)
ORDER BY folio.stock_symbol;
