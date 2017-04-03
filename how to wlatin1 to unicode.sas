This is a way harcoded way to replace Umlaute in WLATIN1 to UNICODE. 
This snippet is used for web2sas reports in order to correctly display the characters in csv output.


WLATIN1
Ä     C4
Ö     D6
Ü     DC
ä     E4
ö     F6
ü     FC
ß     DF
UNICODE
Ã„    C384
Ã–    C396
Ãœ    C39C
Ã¤    C3A4
Ã¶    C3B6
Ã¼    C3BC
ÃŸ    C39F

array _cvars $ _character_;

do _i = 1 to ubound(_cvars);
    _cvars{_i} = tranwrd( _cvars{_i}, 'C4'x, 'C384'x);
end;
drop _i;
