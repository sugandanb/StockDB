CREATE PIPELINE company_pipeline 
AS LOAD DATA S3 'lochbihler/stockdb'
CONFIG '{"region": "us-east-1"}'
INTO TABLE company
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
