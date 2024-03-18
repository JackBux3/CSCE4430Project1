To use the lexer, please make sure that flex is istalled.

Next, compile the lexer by using the following commands:
	flex lexer.l
	gcc lex.yy.c -o lexer_exe -lfl

To test the lexer, please use the provided input.txt file.
To test it, run the following command:
	./lexer_exe input.txt > output.txt

When oppening it, it should read:
2,integer
*,operator
3,integer
+,operator
5,integer
