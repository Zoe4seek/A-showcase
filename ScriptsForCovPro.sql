use newdatabase;
#### Looking at total death by location
SELECT 
    location, 
    MAX(CAST(total_deaths AS UNSIGNED)) AS TotalDeathCount 
FROM 
    newdatabase.coviddeath2 
GROUP BY 
    location 
ORDER BY 
    TotalDeathCount DESC;
    
#### Looking at global deaths
SELECT 
    date,
    SUM(new_cases) AS total_cases,
    SUM(CAST(new_deaths AS UNSIGNED)) AS total_deaths,
    SUM(CAST(new_deaths AS UNSIGNED)) / SUM(new_cases) * 100 AS DeathPercentage
FROM
    newdatabase.coviddeath2
GROUP BY DATE;

### Joining 2 tables
Select dea.continent,
 dea.location, 
 dea.date, 
 dea.population,
 vac.new_vaccinations,
 SUM(vac.new_vaccinations)OVER(Partition by dea.location)asTotalDeath
 From coviddeath2 as dea
 join covidvaccine2 as vac
 On dea.location = vac.location
 and dea.date  = vac.date;
 
 SELECT 
    dea.continent,
    dea.location, 
    dea.date, 
    dea.population,
    vac.new_vaccinations,
    SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location) AS TotalVaccinations
FROM 
    coviddeath2 AS dea
JOIN 
    covidvaccine2 AS vac
ON 
    dea.location = vac.location
    AND dea.date = vac.date;

