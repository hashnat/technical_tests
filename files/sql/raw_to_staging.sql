-- RAW TO STAGING
CREATE OR REPLACE TABLE `stg_transactions.stg_trades` AS
SELECT DISTINCT
  trade_id,
  user_id,
  token_id,
  side,
  price_usd,
  quantity,
  status,
  DATETIME(trade_created_time, "Asia/Jakarta") AS trade_created_time,
  DATETIME(trade_updated_time, "Asia/Jakarta") AS trade_updated_time
FROM `raw_transaction.raw_trades`
WHERE trade_id IS NOT NULL;

CREATE OR REPLACE TABLE `stg_transactions.stg_p2p_transfers` AS
SELECT DISTINCT
  transfer_id,
  sender_id,
  receiver_id,
  token_id,
  amount,
  status,
  DATETIME(transfer_created_time, "Asia/Jakarta") AS transfer_created_time,
  DATETIME(transfer_created_time, "Asia/Jakarta") AS transfer_updated_time
FROM `raw_transaction.raw_p2p_transfers`
WHERE transfer_id IS NOT NULL;

CREATE OR REPLACE TABLE  `stg_config.stg_tokens` AS
SELECT DISTINCT
  token_id,
  token_name,
  categ
FROM `raw_config.raw_tokens`
WHERE token_id IS NOT NULL;


CREATE OR REPLACE TABLE  `stg_kyc.stg_users` AS
SELECT DISTINCT
  user_id,
  region,
  signup_date
FROM `raw_kyc.raw_users`
WHERE user_id IS NOT NULL;

