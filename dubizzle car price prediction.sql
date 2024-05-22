create database car_sales;
use car_sales;
show tables;

select * from dubai_car_sales1; ## (dubai_car_sales as dubzzile car sales)

###   Sales and Demand Insights   ###

##### Trend of car sales over the years:

SELECT year, COUNT(*) AS total_sales
FROM dubai_car_sales1
GROUP BY year
ORDER BY year;


##### Most popular car models and brands:

SELECT brand, model, COUNT(*) AS count
FROM dubai_car_sales1
GROUP BY brand, model
ORDER BY count DESC
LIMIT 10;


###   Pricing Strategy Insights   ###

##### Average pricing by car type and age:

select body_type,vehicle_age_years, avg(price) as avg_price_in_AED
from dubai_car_sales1 
group by body_type,vehicle_age_years;


#### Price distribution by region:

select city,avg(price) as avg_price_in_AED,
min(price) as min_price_in_AED,
max(price) as max_price_in_AED
from dubai_car_sales1 group by city;


###  Market Segmentation Insights  ###

#### Distribution of vehicle types by region:

select city,body_type,count(*) as vehicle_count
from dubai_car_sales1 
group by city,body_type
order by vehicle_count desc;

### Regional Demand Patterns

SELECT city, COUNT(*) AS total_listings
FROM dubai_car_sales1
GROUP BY city
ORDER BY total_listings DESC;



####  Preferences in fuel types and transmission types

select fuel_type,transmission_type,count(*) as vehicle_counts 
from dubai_car_sales1 
group by fuel_type,transmission_type 
order by vehicle_counts desc;


###  Inventory and Operational Insights  ###

##### Stock age analysis:

select model,vehicle_age_years,count(*) as number_of_cars
from dubai_car_sales1
group by model,vehicle_age_years;


#### Analysis of cars with warranty:

select warranty,count(*) as count 
from dubai_car_sales1
group by warranty;


###  Advanced Analysis  ###

#### Correlation between price and kilometers driven:

SELECT price, kilometers
FROM dubai_car_sales1
WHERE kilometers IS NOT NULL
order by kilometers desc;


###  Impact of Kilometers on Listings

SELECT kilometers, AVG(price) AS average_price
FROM dubai_car_sales1
WHERE kilometers IS NOT NULL
GROUP BY kilometers
ORDER BY kilometers;

#### YoY Sales Growth Calculation

SELECT year,total_sales,
LAG(total_sales) OVER (ORDER BY year) AS previous_year_sales,
((total_sales - LAG(total_sales) OVER (ORDER BY year)) / LAG(total_sales) 
OVER (ORDER BY year)) * 100 AS yoy_growth_percentage
FROM (SELECT year, COUNT(*) AS total_sales
FROM dubai_car_sales1
GROUP BY year
ORDER BY year
) AS yearly_sales;


###   Impact of Body Type and Fuel Type on Pricing

select body_type,fuel_type,avg(price) as avg_price 
from dubai_car_sales1 
group by body_type,fuel_type 
order by avg_price desc;

### Influence of Transmission Type and Number of Doors on Price

select transmission_type,doors,avg(price) as avg_price 
from dubai_car_sales1 
group by transmission_type,doors 
order by avg_price;


### Detailed Price Analysis by Features and Specifications

SELECT hp_category, EngineCategory, seating_capacity, AVG(price) AS average_price
FROM dubai_car_sales1
WHERE hp_category IS NOT NULL AND EngineCategory IS NOT NULL
GROUP BY hp_category, EngineCategory, seating_capacity
ORDER BY average_price DESC;





