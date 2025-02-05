-- OBJECTIVE 2 Identify which vehicles are likely to be stolen
-- Find the vehicle types that are most often and least often stolen

SELECT * 
From stolen_vehicles;

select vehicle_type, Count(vehicle_id) AS num_vehicles
from stolen_vehicles
group by vehicle_type
order by num_vehicles DESC
LIMIT 5;

select vehicle_type, Count(vehicle_id) AS num_vehicles
from stolen_vehicles
group by vehicle_type
order by num_vehicles 
LIMIT 5;

-- For each vehicle type, find the average age of the cars that are stolen
select vehicle_type, Avg(year(date_stolen) - model_year) as avg_age
from stolen_vehicles
group by vehicle_type
order by avg_age DESC;

-- For each vehicle type, find the percent of vehicles stolen that are luxury versus standard
select * from stolen_vehicles;
select * from make_details;

with lux_standard as (select vehicle_type, case when make_type = 'Luxury' then 1 else 0 end as luxury, 1 as All_cars
from  stolen_vehicles sv left join make_details md
	on sv.make_id = md.make_id)
    
select vehicle_type, sum(luxury) / count(luxury) * 100 as pct_lux
from lux_standard
group by vehicle_type
order by pct_lux DESC;

-- Create a table where the rows represent the top 10 vehicle types, the columns represent the top 7 vehicle colors (plus 1 column for all other colors) and the values are the number of vehicles stolen
 select * from stolen_vehicles;

 
 select color, count(vehicle_id) as num_vehicles
 from stolen_vehicles
 group by color
 order by num_vehicles DESC;
 
 select vehicle_type, count(vehicle_id) as num_vehicles,
		sum(case when color = 'Silver' then 1 else 0 end) as sliver,
		sum(case when  color = 'White' then 1 else 0 end) as White,
        sum(case when color = 'Black' then 1 else 0 end) as Black,
		sum(case when color = 'Blue' then 1 else 0 end) as Blue,
		sum(case when color = 'Red' then 1 else 0 end ) as Red,
		sum(case when color = 'Grey' then 1 else 0 end) as  Grey,
		sum(case when color = 'Green' then 1 else 0 end) as Green,
		sum(case when color in ('gold','Brown','Yellow','Orange','Purple','Cream','Pink') then 1 else 0 end) as other
from stolen_vehicles
group by vehicle_type
order by num_vehicles desc
Limit 10;
     

