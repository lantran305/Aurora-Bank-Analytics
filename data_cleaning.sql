-- cards_data table

--overview
SELECT * 
FROM raw.cards_data
LIMIT 50;

-- data type
SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'raw'
  AND table_name = 'cards_data';
  
-- create table
DROP TABLE IF EXISTS staging.cards_data;

CREATE TABLE staging.cards_data AS
SELECT
    id,
    client_id,
    card_brand,
    card_type,
    card_number::TEXT AS card_number,
    -- Expiration date: first day of month
    TO_DATE('01-' || expires,'DD-Mon-YY') AS expires,
    has_chip,
    num_cards_issued,
    REPLACE(credit_limit, '$', '')::NUMERIC(18,2) AS credit_limit,
    -- Account opening date: first day of month
    TO_DATE('01-' || acct_open_date,'DD-Mon-YY') AS acct_open_date,
	year_pin_last_changed
FROM raw.cards_data;

-- check
SELECT * FROM staging.cards_data
LIMIT 10;
--------------------------------------------------------------------------------------
-- mcc_codes table

--overview
SELECT * 
FROM raw.mcc_codes
LIMIT 20;

--create table
DROP TABLE IF EXISTS staging.mcc_codes;

CREATE TABLE staging.mcc_codes AS
SELECT *
FROM raw.mcc_codes;
--------------------------------------------------------------------------------------
-- transactions_data table

SELECT * 
FROM transactions_data
LIMIT 20;

-- data type
SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'raw'
  AND table_name = 'transactions_data';
  
-- create table
DROP TABLE IF EXISTS staging.transactions_data;

CREATE TABLE staging.transactions_data AS
SELECT
    id,
    TO_TIMESTAMP(date, 'MM/DD/YY HH24:MI')::DATE AS date,
    TO_TIMESTAMP(date, 'MM/DD/YY HH24:MI')::TIME AS time,
    client_id,
    card_id,
    amount::NUMERIC(18,2) AS amount,
    use_chip,
    merchant_id,
    merchant_city,
    merchant_state,
    LPAD(zip::BIGINT::TEXT, 5, '0') AS zip,
    mcc,
    errors
FROM raw.transactions_data;

-- check
SELECT * FROM staging.transactions_data
LIMIT 10;
--------------------------------------------------------------------------------------

-- users_data table

-- overview  
SELECT * 
FROM users_data
LIMIT 20;

-- data type
SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'raw'
  AND table_name = 'users_data';

SELECT
    *
FROM raw.users_data
WHERE latitude !~ '^-?[0-9]+(\.[0-9]+)?$';
  
-- create table
DROP TABLE IF EXISTS staging.users_data;

CREATE TABLE staging.users_data AS
SELECT
    id,
    current_age,
    retirement_age,
    birth_year,
    birth_month,
    gender,
    address,
	-- Convert valid latitude values to DOUBLE PRECISION.
    -- Replace invalid values (e.g., "27-Aug") with NULL.
    CASE WHEN TRIM(latitude) ~ '^-?[0-9]+(\.[0-9]+)?$'
    		THEN TRIM(latitude)::DOUBLE PRECISION
    		ELSE NULL
		END AS latitude,
    longitude,
    REPLACE(per_capita_income, '$', '')::NUMERIC(18,2)
        AS per_capita_income,
    REPLACE(yearly_income, '$', '')::NUMERIC(18,2)
        AS yearly_income,
    REPLACE(total_debt, '$', '')::NUMERIC(18,2)
        AS total_debt,
    credit_score,
    num_credit_cards
FROM raw.users_data;
