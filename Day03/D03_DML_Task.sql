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

select * from [dbo].[CountryLanguage] 
--10- Display country code for all those speak more than 2 languages.
select Code 
from Country C
join CountryLanguage L
on L.CountryCode = C.Code
where [Language] = 'Spanish' and IsOfficial = 1