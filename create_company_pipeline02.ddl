CREATE PIPELINE company_pipeline
AS LOAD DATA S3 's3://singlestore-test/companylist.csv'
CONFIG '{\"region\":\"us-west-1\"}'
CREDENTIALS '{"aws_access_key_id": "AKIAVL66XGD5RLFJQC6F", "aws_secret_access_key": "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"}'
INTO TABLE company
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
