-- Retail Startup Database (db)

-- 
DROP DATABASE retail;
-- create db 
CREATE DATABASE IF NOT EXISTS retail; 

-- use db
USE retail

-- create tables for db 
CREATE TABLE IF NOT EXISTS sales (
	store INT,
	dept INT, 
	date_id TEXT, 
	weekly_sales INT, 
	isHoliday VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS features (
	store INT, 
	date_id TEXT, 
	temp INT, 
	fuel_price INT, 
	markdown_1 INT, 
	markdown_2 INT, 
	markdown_3 INT, 
	markdown_4 INT, 
	markdown_5 INT, 
	cpi INT,
	unemployment INT,
	isHoliday VARCHAR(10)
); 


CREATE TABLE IF NOT EXISTS stores (
	store INT, 
	type VARCHAR(5),
	size INT, 
	dma VARCHAR(50) 
);

CREATE TABLE IF NOT EXISTS dma_data ( 
	dma INT,
	name VARCHAR(100),
	dma_name VARCHAR(100),
	area INT,
	latitude INT, 
	longitude INT, 
	country VARCHAR(50),
	pop_over_18 INT, 
	household_count INT, 
	med_hhld_income INT, 
	hhlds_no_vehicles INT,
	hhlds_1to2_vehicles INT, 
	hhlds_over_2_vehicles INT, 
	hhlds_exp_public_trans INT, 
	hhlds_exp_intercity_bus_fare INT, 
	hhlds_exp_mass_transit INT, 
	hhlds_exp_taxi INT, 
	hhlds_exp_other_public_trans INT, 
	white INT,
	african_american INT,
	american_indian INT, 
	asian INT, 
	hawaiian_pacific_islander INT, 
	other_race INT, 
	multi_race INT,
	hispanic INT
);



LOAD DATA LOCAL INFILE 'C:/git/mgsc410/docs/sales.csv' 
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/git/mgsc410/docs/features.csv' 
INTO TABLE features
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/git/mgsc410/docs/stores_w_dma.csv' 
INTO TABLE stores
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/git/mgsc410/docs/dma_data.csv' 
INTO TABLE dma_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;


