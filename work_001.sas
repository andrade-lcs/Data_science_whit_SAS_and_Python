PROC IMPORT datafile='/home/u59699361/gapminder.csv' OUT = imported REPLACE;
DATA new;
SET imported;
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
/*Clustering the variables*/
IF incomeperperson<100 THEN incomeperperson=.;
IF incomeperperson<1000 AND incomeperperson>100 THEN incomeperperson=1;
IF incomeperperson<10000 AND incomeperperson>1000 THEN incomeperperson=2;
IF incomeperperson<100000 AND incomeperperson>10000 THEN incomeperperson=3;
IF incomeperperson>100000 THEN incomeperperson=4;

IF lifeexpectancy<47 THEN lifeexpectancy=.;
IF lifeexpectancy<=60 AND lifeexpectancy>47 THEN lifeexpectancy=1;
IF lifeexpectancy<=70 AND lifeexpectancy>60 THEN lifeexpectancy=2;
IF lifeexpectancy<=80 AND lifeexpectancy>70 THEN lifeexpectancy=3;
IF lifeexpectancy>80 THEN lifeexpectancy=4;

IF femaleemployrate<10 THEN femaleemployrate=.;
IF femaleemployrate<=50 AND femaleemployrate>10 THEN femaleemployrate=1;
IF femaleemployrate>50 THEN femaleemployrate=2;

IF employrate<10 THEN employrate=.;
IF employrate<=50 AND employrate>10 THEN employrate=1;
IF employrate>50 THEN employrate=2;

IF urbanrate<10 THEN urbanrate=.;
IF urbanrate<=50 AND urbanrate>10 THEN urbanrate=1;
IF urbanrate>50 THEN urbanrate=2;

IF internetuserate<10 THEN internetuserate=.;
IF internetuserate<=50 AND internetuserate>10 THEN internetuserate=1;
IF internetuserate>50 THEN internetuserate=2;

IF co2emissions<100000 THEN co2emissions=.;
IF co2emissions<1000000     AND co2emissions>100000 THEN co2emissions=1;
IF co2emissions<10000000    AND co2emissions>1000000 THEN co2emissions=2;
IF co2emissions<100000000   AND co2emissions>10000000 THEN co2emissions=3;
IF co2emissions<1000000000  AND co2emissions>100000000 THEN co2emissions=4;
IF co2emissions<10000000000 AND co2emissions>1000000000 THEN co2emissions=5;
IF co2emissions>10000000000 THEN co2emissions=6;

IF oilperperson<0.01 THEN oilperperson=.;
IF oilperperson<0.1  AND oilperperson>0.01 THEN oilperperson=1;
IF oilperperson<1.0  AND oilperperson>0.1 THEN oilperperson=-1;
IF oilperperson<10.0 AND oilperperson>1.0 THEN oilperperson=3;
IF oilperperson>10.0 THEN oilperperson=4;
IF oilperperson=-1 THEN oilperperson=2;

IF relectricperperson<=0 THEN relectricperperson=.;
IF relectricperperson<10 AND relectricperperson>0 THEN relectricperperson=1;
IF relectricperperson<100  AND relectricperperson>10 THEN relectricperperson=2;
IF relectricperperson<1000 AND relectricperperson>100 THEN relectricperperson=3;
IF relectricperperson<10000 AND relectricperperson>1000 THEN relectricperperson=4;
IF relectricperperson>10000 THEN relectricperperson=5;

PROC FREQ;
TABLES incomeperperson lifeexpectancy femaleemployrate employrate urbanrate internetuserate co2emissions oilperperson relectricperperson;
RUN;