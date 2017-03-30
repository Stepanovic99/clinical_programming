*Macro to convert selected character variables to numeric variables;
%macro char_to_num(In_dsn=,   /*Name of the input data set*/                                                                            
                   Out_dsn=,  /*Name of the output data set*/                                                                           
                   Var_list=  /*List of character variables that you                                                                    
                                want to convert from character to                                                                       
                                numeric, separated by spaces*/);                                                                        
   /*Check for null var list */                                                                                                          
   %if &var_list ne %then %do;                                                                                                           
   /*Count the number of variables in the list */                                                                                       
   %let n=%sysfunc(countw(&var_list));                                                                                                  
   data &Out_dsn;                                                                                                                       
      set &In_dsn(rename=(                                                                                                             
      %do i = 1 %to &n;                                                                                                                 
      /* break up list into variable names */                                                                                           
         %let Var = %scan(&Var_list,&i);                                                                                                
      /*Rename each variable name to C_ variable name */                                                                                
         &Var = C_&Var                                                                                                                  
      %end;                                                                                                                             
      ));                                                                                                                               
 
   %do i = 1 %to &n;                                                                                                                   
      %let Var = %scan(&Var_list,&i);                                                                                                   
      &Var = input(C_&Var,best12.);                                                                                                     
   %end;                                                                                                                               
   drop C_:;                                                                                                                           
   run;                                                                                                                                 
  %end;                                                                                                                                 
%mend char_to_num;
