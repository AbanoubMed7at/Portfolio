select * from corona.coviddeaths;

# Infection in Albania
select location, date, population, total_cases, (total_cases/population) * 100 as PopulationInfectedPercentage
from corona.coviddeaths
where location like '%Albania%';

# Highest Infection Percentage per Country
select location, population, max(total_cases), max((total_cases/population)) * 100 as PopulationInfectedPercentage
from corona.coviddeaths
group by location, population
order by PopulationInfectedPercentage desc;

# Highest Number of Death in a Country
select location, max(total_deaths) as TotalDeathCount
from corona.coviddeaths
group by location
order by TotalDeath desc;