/*
1- num of Q1 dated emails, Q2 dated emails
2- emails from apple, facebook, google, oracle
3- emails from apple which have attachments
4- display the input without the email body
*/
%{
int q1 = 0, q2 = 0, apl = 0, fcb = 0, gog = 0, orc = 0, apat = 0;
%}
%%
^From:[^@]+"@apple.com"[^:]+:[^:]+:" Yes" { ++apl; ++apat; printf("%s", yytext);}
^From:[^@]+"@apple.com"[^:]+:[^:]+:" No" { ++apl; printf("%s", yytext);}
^"From:"[^@]+"@facebook.com" { ++fcb; printf("%s", yytext); }
^"From:"[^@]+"@google.com" { ++gog; printf("%s", yytext); }
^"From:"[^@]+"@oracle.com" { ++orc; printf("%s", yytext); }
^"Date: "[123]?[0-9]"/"[123]"/2017" { ++q1; printf("%s", yytext);}
^"Date: "[123]?[0-9]"/"[456]"/"2017 { ++q2; printf("%s", yytext);}
^Body:"["[^]]+"]" { printf("Body:[]");}
%%
int main(){
yylex();
puts("*************************result***************************");
printf("E-mails recieved from\nApple: %i (%i have attachments)\nFacebook: %i\nGoogle: %i\nOracle: %i\n", apl, apat, fcb, gog, orc);
printf("E-mails recieved in\nQ1: %i\nQ2: %i\n", q1, q2);
return 0;
}
