/* File : library.i */
%module swiglibrary

%inline %{
extern void hello();
extern int    fact(int);
extern int    my_mod(int n, int m);
%}