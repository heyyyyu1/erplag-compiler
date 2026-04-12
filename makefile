compile: src/driver.c src/parser.c src/lexer.c src/ast.c src/symbolTable.c src/semantics.c src/codegen.c src/nasmcode.c
	gcc -o compiler src/driver.c src/parser.c src/lexer.c src/ast.c src/symbolTable.c src/semantics.c src/codegen.c src/nasmcode.c -Iheaders -lm -g
