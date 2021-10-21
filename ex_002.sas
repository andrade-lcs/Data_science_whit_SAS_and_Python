LIBNAME mydata "/courses/d1406ae5ba27fe300 " access=readonly;
DATA new; set mydata.nesarc_pds;

IF S2AQ3 NE 9 AND S2AQ8A=. THEN S2AQ8A=11;

PROC SORT; by IDNUM;
PROC FREQ; TABLES S2AQ3 S2AQ8A;
RUN;
