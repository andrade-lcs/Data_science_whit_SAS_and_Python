PROC IMPORT datafile='/home/u59699361/gapminder.csv' OUT = imported REPLACE;
DATA new;
SET imported;
RUN;