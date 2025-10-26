
CREATE OR REPLACE TABLE `data_warehouse_layer.fact_trades` AS
SELECT
  t.trade_id,
  t.user_id,
  t.token_id,
  t.side,
  tk.token_name,
  tk.category AS token_category_name,
  t.price_usd,
  t.quantity,
  t.price_usd * t.quantity AS total_trade_amount_usd,
  t.status AS trade_status_name,
  t.trade_created_time,
  t.trade_updated_time
FROM `stg_transactions.stg_trades`t
LEFT JOIN `stg_config.stg_tokens` tk ON t.token_id = tk.token_id;


CREATE OR REPLACE TABLE `data_warehouse_layer.fact_p2p_transfers` AS
SELECT
  p2p.transfer_id,
  p2p.sender_id,
  p2p.receiver_id,
  p2p.token_id,
  p2p.amount AS transfer_amount,
  status AS p2p_status_name,
  p2p.transfer_created_time,
  p2p.transfer_updated_time,
  tk.token_name,
  tk.category AS token_category_name
FROM `stg_transactions.stg_p2p_transfers` p2p
LEFT JOIN `stg_config.stg_tokens` tk
  ON p2p.token_id = tk.token_id;




CREATE OR REPLACE TABLE `data_warehouse_layer.dim_tokens` AS
SELECT DISTINCT
  token_id,
  token_name,
  category AS token_category_name
FROM `stg_config.stg_tokens`;


CREATE OR REPLACE TABLE `data_warehouse_layer.dim_users` AS
SELECT
  user_id,
  region AS user_region_name,
  signup_date
FROM `stg_kyc.stg_users`;



