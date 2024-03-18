%{
#include <stdio.h>
%}

%%

[ \t\n]           /* Ignore whitespace */
[0-9]+            { printf("%s,integer\n", yytext); }
[\+\-\*/]         { printf("%s,operator\n", yytext); }
\(                { printf("%s,left_parenthesis\n", yytext); }
\)                { printf("%s,right_parenthesis\n", yytext); }
.                 { fprintf(stderr, "Error: Invalid character '%s'\n", yytext); }

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening file");
        return 1;
    }

    yyin = input_file;
    yylex();

    fclose(input_file);
    return 0;
}
