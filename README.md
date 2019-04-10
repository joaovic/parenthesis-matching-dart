# parenthesis-matchig-dart

This project presents Dart implementation of the Parenthesis Matching algorithm. It's based on Bruno's (brunogcarneiro) Java 8 implementation of the Class Hierarchy approach.

## Problem Definition

Given an expression string exp , write a program to examine whether the pairs and the orders of “{“,”}”,”(“,”)”,”[“,”]” are correct in exp. 

## Solution (Algorithm)

1) Declare a character stack S.
2) Now traverse the expression string exp.
    * a) If the current character is a starting bracket (‘(‘ or ‘{‘ or ‘[‘) then push it to stack.
    * b) If the current character is a closing bracket (‘)’ or ‘}’ or ‘]’) then pop from stack and if the popped character is the matching starting bracket then fine else parenthesis are not balanced.
3) After complete traversal, if there is some starting bracket left in stack then “not balanced”

## Test Cases

* (a[0]+b[2c[6]]){24 + 53} -> true
* f(e(d)) -> true
* [()]{}([]) -> true
* ((b)-> false
* (c]-> false
* {(a[]))}-> false
* ([)]-> false
* )(-> false
* empty-> true
