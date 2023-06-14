-- atleast 3 columns and can't use sub query to get distinct region_id for in()
-- In Pivot we only using population and region_id and not mentioned sub_region_id
-- here o/p is 5 region_id 10 20 30 40 50 and population is agregated for each sub_region_id row 
select * from
(select region_id, sub_region_id, population from eba_countries)
pivot (sum(population) for region_id in (10,20,30,40,50));

-- For following query on region_id 10, 20 columns will be there remaing will be similar to above query
select * from
(select region_id, sub_region_id, population from eba_countries)
PIVOT (sum(population) for region_id in (10,20) );

-- Following query is throwing error ORA-00936: missing expression
select * from
(select region_id, sub_region_id, population from eba_countries)
pivot (sum(population) for region_id in (select distinct region_id from eba_countries));
