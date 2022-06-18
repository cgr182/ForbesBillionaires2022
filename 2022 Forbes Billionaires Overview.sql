For a visual representation of some of these queries, here is my https://public.tableau.com/app/profile/christian1038/viz/ForbesBillionaires_16554463491400/Dashboard1?publish=yes); it is under Forbes Billionaires.
create database Forbes;
use forbes;                        

#let's to see if the table imported correctly

select *
from billionaires;


-- Networth is casted as text so I need to remove the dollar sign and then convert it 
update billionaires
   set networth=replace (networth,'$','');
  
  ALTER TABLE `forbes`.`billionaires` 
CHANGE COLUMN `networth` `networth` INT NULL DEFAULT NULL ;
   
-- how big is the dataset, nmeaning how many billionaires are there

select count(*)
from billionaires;

-- Who are the top 10 billionaires 
select *
from billionaires
order by ranked asc limit 10;


-- How many billionaires per country?
Select country, count(*) as Total_Billionaires_By_Country
from billionaires
group by country 
order by Total_Billionaires_By_Country desc;

-- What source of wealth is the most common?
Select source, count(*) as source_total
from billionaires
group by source
order by source_total desc;

-- What industry is the most common?

Select industry, count(*) as Industry_total
from billionaires
group by Industry 
order by Industry_total desc;

-- What is the highest Average age by country?

Select country, avg(age) as Average_age
from billionaires
group by country 
order by average_age desc;

-- What is the lowest average age by country

Select country, avg(age) as Average_age
from billionaires
group by country 
order by average_age asc;

-- Who are the youngest billionairee, where are they from and what is the source of their wealth?
Select name, country, min(age) as age, Source
from billionaires
group by country 
order by age asc;

-- Who are the billionaires that are not from the United States
select *
from billionaires
where country <> "united states"
order by networth desc;

-- What is the total networth of each industry?

Select distinct industry, round(sum(networth)) as Total_Wealth_By_Industry
from billionaires
group by industry
order by Total_Wealth_By_Industry desc;

-- What is the total networth of each source of wealth?
Select distinct source, round(sum(networth)) as Total_Wealth_By_source
from billionaires
group by source
order by Total_Wealth_By_source desc ; 
