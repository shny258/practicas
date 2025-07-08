/*
## 04 - Notas de examen
Se dispone de un listado con los resultados de los parciales de los alumnos del curso de **Paradigmas de Programación**, organizado de la siguiente manera:
*/

parcial1(luisa, 6). 
parcial1(pedro, 5).
parcial1(maria, 8).
parcial1(carlos, 1).
parcial1(laura, 3).
parcial1(agos, 8.5).
parcial1(juan, 10).
parcial1(julio, 2).
parcial2(luisa, 7).
parcial2(pedro, 6).
parcial2(maria, 9).
parcial2(carlos, 8).
parcial2(laura, 4).
parcial2(agos, 8.5).
parcial2(juan, 4).
parcial2(julio, 1).

/*
Se desea obtener:

1. El listado de los alumnos que promocionan la materia
2. El mismo listado pero esta vez incluyendo la nota final (promedio de los dos parciales) para cada uno
3. El listado de los alumnos que recursan la materia.
4. El listado de los alumnos que obtendrán la cursada. 
5. (maximos) A fin de entregar la medalla al mérito, encontrar de aquellos que promocionan (1b), el o los alumnos con mayor nota final (nombre y nota)
6. (maximos) Ahora se desea obtener cuales fueron las dos notas más altas, considerando simplemente a la nota como el promedio de la nota de parcial1 y parcial2. Solo interesan los números. Un tip es pensar la resolución en dos etapas, la más alta, y después la más alta de lo restante
*/

% 1
promocion(A, Nota):-
    parcial1(A, N1),
    parcial2(A, N2),
    N1 >= 7,
    N2 >= 7,
    Nota is (N1 + N2) / 2.

% 2
recursa(A):-
    parcial1(A, N1),
    parcial2(A, N2),
    (N1 < 4; N2 < 4).

% 3
alumno(A):-parcial1(A, _), parcial2(A, _).
cursada(A):-
    alumno(A),
    \+ promocion(A, _),
    \+ recursa(A, _).

% CASI 4 y CASI 5 juntos
nota(Alumno, Nota):-
    parcial1(Alumno, P1),
    parcial2(Alumno, P2),
    Nota is (P1 + P2) / 2.
producto_cartesiano(A, B):-
    nota(_, A), nota(_, B).
seleccion(A, B):-
    producto_cartesiano(A, B),
    A < B.
proyeccion(A):-
    seleccion(A, _).
% alias
todos_menos_max(A):-
    proyeccion(A).
maximo(X):-
    nota(_, X), \+todos_menos_max(X).