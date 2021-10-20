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

IF co2emissions<=100000 THEN co2emissions=.;
IF co2emissions<=1000000     AND co2emissions>100000 THEN co2emissions=1;
IF co2emissions<=10000000    AND co2emissions>1000000 THEN co2emissions=2;
IF co2emissions<=100000000   AND co2emissions>10000000 THEN co2emissions=3;
IF co2emissions<=1000000000  AND co2emissions>100000000 THEN co2emissions=4;
IF co2emissions<=10000000000 AND co2emissions>1000000000 THEN co2emissions=5;
IF co2emissions>=10000000000 THEN co2emissions=6;

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

/*Formating Variables*/
PROC FORMAT;
VALUE FORMAT_A
1 = 'X > 1000'
2 = '1000 < X < 10000'
3 = '10000< X < 100000'
4 = 'X > 100000';

VALUE FORMAT_B
1 = 'X < 60'
2 = '60<= X < 70'
3 = '70<= X < 80'
4 = 'X >= 80';

VALUE FORMAT_C
1 = 'X < 50'
2 = 'X >= 50';

VALUE FORMAT_D
1 = 'X < 10000'
2 = '10000 <= X < 100000'
3 = '100000<= X < 1000000'
4 = '1000000<= X < 10000000'
5 = '10000000<= X < 100000000'
6 = 'X>=100000000';

VALUE FORMAT_E
1 = 'X < 0.1'
2 = '0.1 <= X < 1'
3 = '1 <= X < 10'
4 = 'X>=10';

VALUE FORMAT_F
1 = 'X < 10'
2 = '10 <= X < 100'
3 = '100<= X < 1000'
4 = '1000<= X < 10000'
5 = 'X>=10000';

PROC FREQ;
TABLE incomeperperson; 
FORMAT incomeperperson FORMAT_A.;

TABLE lifeexpectancy;
FORMAT lifeexpectancy FORMAT_B.;
 
TABLE femaleemployrate;
FORMAT femaleemployrate FORMAT_C.;

TABLE employrate;
FORMAT employrate FORMAT_C.; 

TABLE urbanrate;
FORMAT urbanrate FORMAT_C.;

TABLE internetuserate;
FORMAT internetuserate FORMAT_C.;  

TABLE co2emissions;
FORMAT co2emissions FORMAT_D.;  

TABLE oilperperson ;
FORMAT oilperperson  FORMAT_E.;  

TABLE relectricperperson;
FORMAT relectricperperson FORMAT_F.;  

RUN;