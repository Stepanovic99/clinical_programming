*** to determine the name of the proc univariate output use ods trace ***;

ods trace on/listing;
 
proc univariate data=sashelp.cars(keep=Invoice) trim=.1;
   *The TRIM option used here will trim 10% from the top
    and bottom of the distribution;
   var Invoice;
run;
 
ods trace off;

*** write statistics in a SAS data set ***;

ods output TrimmedMeans = Trimmed;
 
proc univariate data=sashelp.Cars(keep=Invoice) trim=.1;
   *The TRIM option used here will trim 10% from the top
    and bottom of the distribution;
   var Invoice;
run;
 
ods output close;
