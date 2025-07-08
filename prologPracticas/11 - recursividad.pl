/*
## 11 - Recursividad

1. Codifique en prolog las reglas necesarias para obtener el término N en la serie de Gauss
2. Codifique en prolog las reglas necesarias para obtener el término N en la serie de Fibonacci (sin, y con mejora)
3. Codifique en prolog las reglas necesarias para obtener el factorial de un número natural N. 
4. Codifique en prolog las reglas necesarias para obtener el producto de dos numeros X e Y, aplicando sumas sucesivas. 
5. Codifique en prolog las reglas necesarias para obtener la potencia N de un numero X aplicando multiplicaciones sucesivas. 
6. Codifique en prolog las reglas necesarias para obtener la el cociente entre dos números a partir de restas sucesivas. 
7. Idem 6, pero que permita obtener el cociente y el resto.
Definir la relación `mcd(X,Y,Z)` que se verifique si Z es el máximo común divisor entre X e Y. 
Por ejemplo:

```prolog
mcd(10,15,X).
> X = 5
```
8. Define un predicado `mcm(X,Y,M)` que signifique "M es el mínimo común múltiplo de X e Y"
*/

% 2

% sin mejora
fib(0,0).
fib(1,1).
fib(N,R):-
    N > 1,
    NA is N - 1,
    NAA is N - 2,
    fib(NA,RA),
    fib(NAA,RAA),
    R is RA + RAA.

% con mejora
fibonacci(0,0,0).
fibonacci(1,1,0).
fibonacci(N,R,RA):-
    N > 1,
    NA is N - 1,
    % NAA is N - 2,
    fibonacci(NA, RA, RAA),
    % fibonacci(NAA,RAA,RAAA),
    R is RA + RAA.

fibonacci(N,R):-
    fibonacci(N,R,_).