-- OBJECTIVE 3  Identify where vehicles are likely to be stolen

-- Find the number of vehicles that were stolen in each region
select * from locations;

select  region, count(vehicle_id) as num_vehicles
from stolen_vehicles sv left join locations l
     on sv.location_id = l.location_id
group by  region;

-- Combine the previous output with the population and density statistics for each region
select l.region, count(sv.vehicle_id) as num_vehicles,
        l.population, l.density
from stolen_vehicles sv left join locations l
     on sv.location_id = l.location_id
group by l.region, l.population, l.density
order by num_vehicles desc;


-- Do the types of vehicles stolen in the three most dense regions differ from the three least dense regions?
( select 'High Density',  sv.vehicle_type, count(sv.vehicle_id) as num_vehicles
from stolen_vehicles sv left join locations l
     on sv.location_id = l.location_id
where l.region in ('Auckland', 'Nelson', 'Wellington')
group by sv.vehicle_type
order by num_vehicles desc
Limit 5)

union

(select 'Low Density',sv.vehicle_type, count(sv.vehicle_id) as num_vehicles
from stolen_vehicles sv left join locations l
     on sv.location_id = l.location_id
where l.region in ('Otago', 'Gisborne', 'Southland')
group by sv.vehicle_type
order by num_vehicles desc
Limit 5);




