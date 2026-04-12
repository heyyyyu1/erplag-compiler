# Compiler-Construction
It is a compiler, completely written in C, for a toy language. The langugage (referred to as ERPLAG henceforth) specifications can be found at [Language Specifications](Language%20specifications.pdf).
The input given is the program written in ERPLAG. The compiler's output is 32-bit assembly code. This assembly code is converted to machine code using NASM.

## Index
* [Motivation](#motivation-index)
* [Directory Structure](#directory-structure-index)
* [Understanding directory structure](#understanding-directory-structure-index)
* [Tech used](#tech-used-index)
* [Dev Setup](#dev-setup-index)
* [How to run](#how-to-run-index)
* [Demo](#demo-index)
* [Credits](#credits-index)
* [Disclaimer](#disclaimer-index)

## Motivation [[Index](#index)]
The aim of the project is to
* understand the various stages of compilation in details
* implement every stage from scratch using C
* understand how code generation and optimization takes place

## Directory structure [[Index](#index)]
```bash
.
├── Coding Intricacies and Details.pdf
├── Coding_Details_Stage1.pdf
├── Group 33 - Compiler AST rules.pdf
├── Language specifications.pdf
├── README.md
├── grammar.txt
├── headers
│   ├── ast.h
│   ├── astDef.h
│   ├── codegen.h
│   ├── codegenDef.h
│   ├── lexer.h
│   ├── lexerDef.h
│   ├── nasmcode.h
│   ├── nasmcodeDef.h
│   ├── parser.h
│   ├── parserDef.h
│   ├── semantics.h
│   ├── semanticsDef.h
│   ├── symbolTable.h
│   └── symbolTableDef.h
├── makefile
├── readme.txt
├── sampleOutputs
│   ├── Sample_Symbol_table.txt
│   └── ast.txt
├── src
│   ├── ast.c
│   ├── codegen.c
│   ├── driver.c
│   ├── lexer.c
│   ├── nasmcode.c
│   ├── parser.c
│   ├── semantics.c
│   └── symbolTable.c
└── testFiles
    ├── a.txt
    ├── c1.txt
    ├── c10.txt
    ├── c11.txt
    ├── c12.txt
    ├── c13.txt
    ├── c2.txt
    ├── c3.txt
    ├── c4.txt
    ├── c5.txt
    ├── c6.txt
    ├── c7.txt
    ├── c8.txt
    ├── c9.txt
    ├── t1.txt
    ├── t10.txt
    ├── t11.txt
    ├── t12.txt
    ├── t13.txt
    ├── t14.txt
    ├── t15.txt
    ├── t16.txt
    ├── t17.txt
    ├── t18.txt
    ├── t19.txt
    ├── t2.txt
    ├── t20.txt
    ├── t21.txt
    ├── t22.txt
    ├── t23.txt
    ├── t3.txt
    ├── t4.txt
    ├── t5.txt
    ├── t6(with_syntax_errors).txt
    ├── t6.txt
    ├── t7.txt
    ├── t8.txt
    ├── t9.txt
    └── test_grammar.txt
```

Note that after cloning the repository, you'll need to make certain changes to this directory structure (refer to step (1) in [How to run](#how-to-run)) for more details. The directory strcuture has been deliberately kept different for more wholesome understanding of the project structure.

## Understanding directory structure [[Index](#index)]
* The grammar given in [Language Specifications](Language%20specifications.pdf) isn't LL(1). It has been made LL(1) and written in [grammar.txt](grammar.txt) file.
* [AST Rules](Group%2033%20-%20Compiler%20AST%20rules.pdf) contains all the AST rules that have been used for AST creation. It also contains all the updated grammar rules.
* The names of the files in `src` and `headers` folder are self explanatory and each name represents a particular part of the compiler being implemented. Thus, the implementation has been divided into following parts:
  * **Stage 1 (Syntax analysis):**
    * Lexical Analysis (`lexer.h`, `lexerDef.h`, `lexer.c`)
    * Parsing (`parser.h`, `parserDef.h`, `parser.c`)
  * **Stage 2 (Semantic analysis and nasm code generation):**
    * AST creation (`ast.h`, `astDef.h`, `ast.c`)
    * Symbol table creation (`symbolTable.h`, `symbolTableDef.h`, `symbolTable.c`)
    * Semantic analysis (`semantics.h`, `semanticsDef.h`, `semantics.c`)
    * Intermediate code generation (`codegen.h`, `codegenDef.h`, `codegen.c`)
    * NASM code generation (`nasm.h`, `nasmDef.h`, `nasm.c`)
* `testFiles` folder conatins many test programs written in ERPLAG that can be used to test the compiler for code generation, symbol table creation, syntax and semantic error detection, etc.
* `sampleOutputs` folder contains sample symbol table and AST that is created by the compiler.
* Refer to the [Coding Details - 1](Coding%20Intricacies%20and%20Details.pdf) and [Coding Details - 2](Coding_Details_Stage1.pdf) files for understanding how each part of compiler has been implemented.

## Tech used [[Index](#index)]
* Code is completely written in C
* `gcc` and `multilib` library of `gcc` must be installed
* `nasm` was used to convert the assembly code generated by our compiler into machine code

## Dev Setup [[Index](#index)]
Install `gcc, gcc-multilib, g++-multilib and nasm` using:
```
sudo apt-get update
sudo apt install gcc gcc-multilib g++-multilib
sudo apt install nasm
```

## How to run [[Index](#index)]
**1.** Clone the repository. **Before moving onto the next step, please ensure that all files in `headers` and `src` folders are present in one single folder (i.e. at same hierarchy). `makefile` and `grammar.txt` should also be present in the same folder.**

**2.** Copy the program that you want to compile (the one that would be written in ERPLAG) into the folder created in step (1). 

**3.** Run the makefile (as `make`) to generate the `compiler` executable. `compiler` can henceforth be used as we use `gcc` in Linux i.e. it's now the compiler for any program written in ERPLAG.

**4.** Now compile your test program using: 
```bash
./compiler <Name_of_the_program_file> code.asm
```
Note that `code.asm` is the name of the file that would containt the assembly code that is generated by the compiler. This name can be anything but ensure that it's an asm file.

**5.** Now run the following commands in sequence to generate the executable from the `code.asm` file generated in step (4):
```bash
nasm -f elf -F dwarf -g code.asm
gcc -m32 code.o -o code
./code
```
## Demo [[Index](#index)]
![Demo gif](Demo.gif)

## Credits [[Index](#index)]
This was a group project. Other contributors are:
* [Akshit Khanna](https://github.com/ra1ph2)
* [Aryan Mehra](https://github.com/aryanmehra1999)
* [Swadesh Vaibhav](https://github.com/swadesh-vaibhav)

## Disclaimer [[Index](#index)]
The code present here is just for aiding the understanding of students pursuing this course in the future. This repository is not supposed to be used for any unfair means by the readers. The author is not responsible for any unfair use of the code present here.

