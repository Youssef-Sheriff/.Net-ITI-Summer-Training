/*
SQL problems – Part2
Using “World” database, do the following:
*/

--1- Display all cities that belong to Egypt.
select * from City
where CountryCode = 'EGY'

--2- Display all countries that have cities with population more than 5 million.
select c.[Name], i.[Population] from Country c
join City i on c.Code = i.CountryCode
where i.Population > 5e6

--3- Display all countries that speak “Dutch” as a secondary language.
select [Name] from Country C
join CountryLanguage L on C.Code = L.CountryCode
where Language = 'Dutch' and IsOfficial = 0 -- IsOfficial = False

--4- Display all countries names along with their official language.
select [Name], [Language] from Country C
join CountryLanguage L on C.Code = L.CountryCode
where IsOfficial = 1

--5- Display all cities that have the same district name.
SELECT [Name], District FROM City
WHERE 
    District IN (
        SELECT District FROM City
        GROUP BY District
        HAVING COUNT(*) > 1 )
ORDER BY District, [Name];

--6- Display African countries names along with number of cities in each country.
select C.[Name] CountryName, count(I.[Name]) NumberOfCities from Country C
join City I on C.Code = I.CountryCode
where C.Continent = 'Africa'
group by C.[Name]

--7- Display countries names with number of non-official languages.
select C.[Name] CountryName, count(l.[Language]) NumberOfLanguages from Country C
left join CountryLanguage L on C.Code = L.CountryCode
where L.IsOfficial = 0
group by C.[Name]

--8- Display countries names who has more than one official language.
select [Name] , count([Language]) [No.OfOfficialLang] from Country
join CountryLanguage  on Code = CountryCode
where IsOfficial = 1
group by [Name]
having count([Language]) > 1

--9- Display the most country whose inhabitants are expected to die early.
select top(1) [Name], LifeExpectancy from Country
order by LifeExpectancy desc

--10- Display countries names with number of cities only if its cities population exceed 100 million.
select Country.[Name], count(City.[Name]) from Country
join city on Country.Code = City.CountryCode
group by Country.[Name]
having sum(City.[Population]) > 1e8

--11- Display country with the highest city population.
select top 1 Country.[Name] Country from Country
join city on Country.Code = City.CountryCode
order by city.[Population] desc

/*12- Create new table “WaterResource” containing water resources for different countries. The table must have the following fields:
•	ID
•	CountryCode.
•	Type (e.g.: River, Sea, Ocean, Channel….etc.)
•	Name. 
*/
create table WaterResource(
ID int primary key,
[Name] varchar(50),
CountryCode char(3) foreign key references Country(Code),
[Type] char(10),
)

-- 13- Insert data in the created table for Egypt.
insert into WaterResource 
values
	(1, 'Nile River', 'EGY', 'River'),
	(2, 'Mediterranean Sea', 'EGY', 'Sea'),
	(3, 'Red Sea', 'EGY', 'Sea'),
	(4, 'Suez Canal', 'EGY', 'Canal'),
	(5, 'Lake Nasser', 'EGY', 'Lake');
