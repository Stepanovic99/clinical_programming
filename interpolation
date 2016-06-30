***********************
    INTERPOLATION     *
***********************;
*imputation 2: in case of missing visits between linear interpolation will be performed (based on visits);


/*set visitnum at end of treatment to the consecutive integer of the last non missing visit!!*/

proc sort data=qs5;
    by studyid usubjid parcat1n paramcd descending visitnum qsseq;
run;
data qs5;
    set qs5;
    by studyid usubjid parcat1n paramcd descending visitnum qsseq;

    *set visit with missing aval to missing;
    if __aval_bw ne . then __visitnum=visitnum;
    else if __aval_bw=. then __visitnum=.;

    retain __nextval __nexttime;  
    if first.paramcd then do;
        __nextval=.;
        __nexttime=.;
    end;
    if __aval_bw ne . then do;
        __nextval=__aval_bw;
        __nexttime=__visitnum;
    end;
run;

proc sort data=qs5 out=qs6;
    by studyid usubjid parcat1n paramcd visitnum qsseq;
run;
data qs6;
    set qs6;
    by studyid usubjid parcat1n paramcd visitnum qsseq;

    *set visit with missing aval to missing;
    if __aval_bw ne . then __visitnum=visitnum;
    else if __aval_bw=. then __visitnum=.;

    retain __prevval __prevtime;  
    if first.paramcd then do;
        __prevval=.;
        __prevtime=.;
    end;
    if __aval_bw ne . then do;
        __prevval=__aval_bw;
        __prevtime=__visitnum;
    end;
run;

data qs7;
    set qs6;
    if __aval_bw ne . then aval=__aval_bw;
    else if __aval_bw=. then aval=__prevval + ((__nextval-__prevval)*(visitnum-__prevtime))
                                        /(__nexttime-__prevtime);
run;
