use World

-- 1- Display all data for all the countries.
select * from Country

-- 2- Display all the languages you have. (Remove redundant data)
select distinct [Language] from CountryLanguage

-- 3- Display all countries that lie in Africa sorted Area.
select * from Country
where Continent = 'Africa'

-- 4- Display all cities that have population more than 2 million.
select * from City
where [Population] > 2000000

-- 5- Display all countries that became independent from 1920 to 1990
select * from Country
where IndepYear between 1920 and 1990

--6- Display all countries that have no independence year.
select * from Country
where IndepYear is null

--7- Display all countries that have any kind of ‘Republic’ government form.
select * from Country
where GovernmentForm like '%Republic%'

--8- Display all countries that lie in Asia and have population more than 100 million.
select * from Country
where Continent = 'Asia' and Population > 1e8 -- 100000000

--9- Display country code for all those speak Spanish as an official language.
select Code 
from Country C
join CountryLanguage L
on L.CountryCode = C.Code
where [Language] = 'Spanish' and IsOfficial = 1

--10- Display country code for all those speak more than 2 languages.
select Code
from Country C
join CountryLanguage L
on L.CountryCode = C.Code
group by Code
having COUNT(Language) > 2

--11- Display the number of people on earth.
select sum(Population) People
from dbo.Country
group by Region -- I make group by because without it overflow

--12- Display all Continents along with the number of countries and total population in each continent.
select 
    Continent,
    SUM(CAST(Population AS BIGINT)) AS TotalPopulation
from 
    Country
group by
    Continent;

--13- You have just discovered a new country, Add it to your database. (Of course, your country have some cities and languages)
insert into Country
values
('UA', 'United States', 'North America', 'Northern America', 9833517, 1776, 331002651, 78.8, 21433226, 20580234, 'United States', 'Federal Republic', 'Joe Biden', 1, 'US')

--14- In your country, increase life expectation by 5 years.
update Country
set LifeExpectancy += 5
where code = 'EGY'

--15- Try to delete your country, what happens?
delete from Country
where code = 'EGY'  
-- delete operation is being blocked because there are related records in the City table 'Foreign Key'
