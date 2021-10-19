PROC IMPORT datafile='/home/u59699361/gapminder.csv' OUT = imported REPLACE;
DATA new;
SET imported;
PROC SORT; by country;
PROC FREQ DATA = imported;
LABEL 	/*Economy indicators*/
		country="The country"
		incomeperperson="Gross Domestic Product per capita in constant 2000 US$"
		/*Social indicators*/
		lifeexpectancy="Life expectancy at birth (years)"
		femaleemployrate="Female employees age 15+ (% of population)"
		employrate="Total employees age 15+ (% of population)"
		urbanrate="Urban population (% of total)"
		internetuserate="Internet users (per 100 people)"
		/*Environmental indicators*/
		co2emissions="cumulative CO2 emission (metric tons)"
		oilperperson="oil Consumption per capita (tonnes per year and person)"
		relectricperperson="residential electricity consumption, per person (kWh)";
TABLES country incomeperperson lifeexpectancy femaleemployrate employrate urbanrate internetuserate co2emissions oilperperson relectricperperson;
RUN;