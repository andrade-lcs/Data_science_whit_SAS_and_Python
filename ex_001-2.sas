LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
DATA new; set mydata.nesarc_pds; */marscrater_pds addhealth_pds gapminder*/;
LABEL	TAB12MDX="Tabacco Dependece Past 12 Months"
		CHECK321="Smoked Cigaretts in Past 12 Months"
		S3AQ3B1="Usual Smoking Frequency"
		S3AQ3C1="Usual Smoking Quantity";
/*Subseting the data to include only past 12 moth smokers, age 18-25+*/
IF CHECK321 = 1;
IF AGE LE 25;
PROC SORT; by IDNUM; */ID AID COUNTRY*/;
PROC FREQ; TABLES TAB12MDX CHECK321 S3AQ3B1 S3AQ3C1 AGE;
RUN;