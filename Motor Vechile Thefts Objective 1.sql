-- OBJECTIVE 1 Identify when vehicles are likely to be stolen
-- Find the number of vehicles stolen each year
select * FROM stolen_vehicles;
select year(date_stolen), count(vehicle_id) AS num_vehicles
from stolen_vehicles
group by year(date_stolen);

-- Find the number of vehicles stolen each month
select month(date_stolen), count(vehicle_id) AS num_vehicles
from stolen_vehicles
group by month(date_stolen);

select year(date_stolen), month(date_stolen), count(vehicle_id) AS num_vehicles
from stolen_vehicles
group by year(date_stolen), month(date_stolen);

-- Find the number of vehicles stolen each day of the week

select dayofweek(date_stolen) as dow , count(vehicle_id) AS num_vehicles
from stolen_vehicles
group by dayofweek(date_stolen)
order by dow;

-- Replace the numeric day of week values with the full name of each day of the week (Sunday, Monday, Tuesday, etc.)
select dayofweek(date_stolen) as dow , 
       case when dayofweek(date_stolen) = 1 then 'Sunday'
            when dayofweek(date_stolen) = 2 then 'Monday'
            when dayofweek(date_stolen) = 3 then 'Tuesday'
			when dayofweek(date_stolen) = 1 then 'Wednesday'
            when dayofweek(date_stolen) = 1 then 'Thursday'
            when dayofweek(date_stolen) = 1 then 'Friday'
       Else 'Saturday' END as day_of_week,
       count(vehicle_id) AS num_vehicles
from stolen_vehicles
group by dayofweek(date_stolen) , day_of_week
order by dow;



