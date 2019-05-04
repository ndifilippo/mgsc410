-- Retail Startup Database (db)

-- 
DROP DATABASE retail;
-- create db 
CREATE DATABASE IF NOT EXISTS retail; 

-- use db
USE retail

-- create tables for db 
CREATE TABLE IF NOT EXISTS sales (
	store DOUBLE,
	dept DOUBLE, 
	date_id TEXT, 
	weekly_sales DOUBLE, 
	isHoliday VARCHAR(10),
	month INT, 
	year INT
);

CREATE TABLE IF NOT EXISTS features (
	store DOUBLE, 
	date_id TEXT, 
	temp DOUBLE, 
	fuel_price DOUBLE, 
	markdown_1 DOUBLE, 
	markdown_2 DOUBLE, 
	markdown_3 DOUBLE, 
	markdown_4 DOUBLE, 
	markdown_5 DOUBLE, 
	cpi DOUBLE,
	unemployment DOUBLE,
	isHoliday VARCHAR(10)
); 


CREATE TABLE IF NOT EXISTS stores (
	store DOUBLE, 
	type VARCHAR(5),
	size DOUBLE, 
	dma VARCHAR(50), 
	msa VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS dma_data ( 
	dma DOUBLE,
	name VARCHAR(100),
	dma_name VARCHAR(100),
	area DOUBLE,
	latitude DOUBLE, 
	longitude DOUBLE, 
	country VARCHAR(50),
	pop_over_18 DOUBLE, 
	household_count DOUBLE, 
	med_hhld_income DOUBLE, 
	hhlds_no_vehicles DOUBLE,
	hhlds_1to2_vehicles DOUBLE, 
	hhlds_over_2_vehicles DOUBLE, 
	hhlds_exp_public_trans DOUBLE, 
	hhlds_exp_DOUBLEercity_bus_fare DOUBLE, 
	hhlds_exp_mass_transit DOUBLE, 
	hhlds_exp_taxi DOUBLE, 
	hhlds_exp_other_public_trans DOUBLE, 
	white DOUBLE,
	african_american DOUBLE,
	american_indian DOUBLE, 
	asian DOUBLE, 
	hawaiian_pacific_islander DOUBLE, 
	other_race DOUBLE, 
	multi_race DOUBLE,
	hispanic DOUBLE
);

CREATE TABLE IF NOT EXISTS population ( 
	State VARCHAR(150),
	city_state VARCHAR(150),
	County VARCHAR(150),
	DMA VARCHAR(150),
	year INT,
	population DOUBLE
);

CREATE TABLE IF NOT EXISTS msa ( 
	date_id  DOUBLE,
	region VARCHAR(50),
	location VARCHAR(50),
	number_of_consumer_units__in_thousands_ DOUBLE,
	income_before_taxes DOUBLE,
	age_of_reference_person DOUBLE,
	persons DOUBLE,
	children_under_18 DOUBLE,
	persons_65_and_over DOUBLE,
	earners DOUBLE,
	vehicles DOUBLE,
	percent_homeowner DOUBLE,
	average_annual_expenditures DOUBLE,
	food DOUBLE,
	food_at_home DOUBLE,
	cereals_and_bakery_products DOUBLE,
	x___meats__poultry__fish__and_eggs DOUBLE,
	dairy_products DOUBLE,
	fruits_and_vegetables DOUBLE,
	other_food_at_home DOUBLE,
	food_away_from_home DOUBLE,
	alcoholic_beverages DOUBLE,
	housing DOUBLE,
	shelter DOUBLE,
	owned_dwellings DOUBLE,
	rented_dwellings DOUBLE,
	other_lodging DOUBLE,
	x__utilities__fuels__and_public_services DOUBLE,
	household_operations DOUBLE,
	housekeeping_supplies DOUBLE,
	household_furnishings_and_equipment DOUBLE,
	apparel_and_services DOUBLE,
	transportation DOUBLE,
	vehicle_purchases__net_outlay_ DOUBLE,
	gasoline_and_motor_oil DOUBLE,
	other_vehicle_expenses DOUBLE,
	public_and_other_transportation DOUBLE,
	health_care DOUBLE,
	entertainment DOUBLE,
	personal_care_products_and_services DOUBLE,
	reading DOUBLE,
	education DOUBLE,
	tobacco_products_and_smoking_supplies DOUBLE,
	miscellaneous DOUBLE,
	cash_contributions DOUBLE,
	personal_insurance_and_pensions DOUBLE,
	life_and_other_personal_insurance DOUBLE,
	pensions_and_social_security DOUBLE
);
CREATE TABLE IF NOT EXISTS agg_pop ( 
	State VARCHAR(150),
	city_state VARCHAR(150),
	County VARCHAR(150),
	DMA VARCHAR(150),
	year INT,
	population DOUBLE,
	perc_change DOUBLE
);

CREATE TABLE IF NOT EXISTS master_sales ( 
	store VARCHAR(50),
	weekly_sales INT,
	dma VARCHAR(50),
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
	isHoliday TEXT, 
	dept TEXT,
	month INT,
	year INT, 
	type VARCHAR(10),
	size INT,
	msa VARCHAR(50)
);


LOAD DATA LOCAL INFILE 'C:/git/mgsc410/datasets/sales.csv' 
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/git/mgsc410/datasets/features.csv' 
INTO TABLE features
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/git/mgsc410/datasets/stores_w_dma.csv' 
INTO TABLE stores
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/git/mgsc410/datasets/dma_data.csv' 
INTO TABLE dma_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/git/mgsc410/datasets/population.csv' 
INTO TABLE population
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/git/mgsc410/datasets/msa_data.csv' 
INTO TABLE msa
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/git/mgsc410/datasets/pop_grouped.csv' 
INTO TABLE agg_pop
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;


LOAD DATA LOCAL INFILE 'C:/git/mgsc410/datasets/sales_feat_dma.csv' 
INTO TABLE master_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;
