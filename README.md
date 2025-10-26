# General Explanations:

## 1. **Data lineage** 
Tracks the data flow from sources to the analytical layer and ready to-be used.
  - Raw Layer: Extracting from multiple CSV files and those are loaded into separate schemas to preserve their original structure and content.
  - Staging Layer: data is standardized and cleaned to ensure consistency across sources. Includes: Deduplication (e.g., reducing raw_trades from 303 rows to 300 unique records), timezone conversion from UTC to Asia/Jakarta (UTC+7) for all timestamp fields, basic validation and type casting (ensuring numeric, date, and text fields align with schema definitions).
  - Data Warehouse: curated data is integrated and modeled for reporting and analysis.
  
  **Related documents**: diagram `Data Lineage.png`, query `raw_to_staging` & `staging_to_dwh`
  
  **Tools used**: `draw.io`

## 2. **ERD**
Defines the relationship between key entities
  - Users: master table for users
  - Trades: table of trading activities that linked to users via user_id and to tokens via token_id
  - P2P Transfers: transfer activities that linked to users through sender_id and receiver_id, and to tokens via token_id
  - Tokens: master table of token informations

  **Related documents**: `ERD.png`
  
  **Tools used**: `Visual Paradigm`

## 3. **Data Analysis**
  **Related documents**: `EDA.xls`
  
  **Tools used**: `bigquery` (preprocessing), `google sheets`

##
**Other Documents**: `Data Governance Plan`
