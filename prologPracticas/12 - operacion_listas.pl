/*
## 12 - Operaciones de listas
Utilizando los conceptos de lista y recursividad y sin utilizar los predicados existentes para listas en prolog, resolver:

1. Suma de todos los valores de una lista. suma/2 (Lista, Total)
2. Contar cuantos valores repetidos de un elemento hay en una lista. contar/3 (Lista, Elemento, Cantidad)
3. Buscar todas las posiciones de un elemento en una lista. indice_de/3 (Lista, Elemento, Posicion)

Pudiendo utilizar predicados existentes, resolver

4. Para un listado de 0 a n hechos nota/1, con notas de 1 a 10, hallar el promedio de las mismas. promedio_nota/1
*/

% Suma de todos los valores de una lista

suma([], 0).
suma([Cabeza | Cola], Total):-
    suma(Cola, Acum),
    Total is Acum + Cabeza.



% Contar cuantos valores repetidos de un elemento hay en una lista.

% Se podría haber usado ; en vez de definir otra regla
igual_int(A, A, 1).
igual_int(A, B, 0):-A \== B.

contar([], _, 0).
contar([Cabeza | Cola], X, Total):-
    contar(Cola, X, Parcial),
    igual_int(Cabeza, X, A),
    Total is Parcial + A.



% Buscar todas las posiciones de un elemento en una lista

% Si X es el primer elemento de la sublista, Pos es 0
indice_de([X | _], X, 0).

% No importa que relacion tenga cabeza con X, sigo consultando el resto de los elementos
% Para cada elemento que haya sido matcheada por la regla anterior, voy a incrementar su posicion hasta la actual
indice_de([_ | Cola], X, Posicion):-
    indice_de(Cola, X, Posicion1),
    Posicion is Posicion1 + 1.



% Para un listado de 0 a n hechos nota/1, con notas de 1 a 10, hallar el promedio de las mismas

nota(2).
nota(6).
nota(2).
nota(2).
nota(9).
nota(7).

promedio_nota(Promedio):-
    findall(X, (nota(X)), ListaNotas),
    ListaNotas \= [], % Previene dividir por 0
    sum_list(ListaNotas, Suma),
    length(ListaNotas, Largo),
    Promedio is Suma / Largo.
