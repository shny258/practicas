/*
## 07 - Conjuntos de actividades
Dado el siguiente listado de actividades extracurriculares que realiza cada estudiante
*/

natacion(a).
natacion(b).
natacion(c).
natacion(d).

futbol(a).
futbol(b).
futbol(e).
futbol(f).

teatro(a).
teatro(c).
teatro(e).
teatro(g).

/*
Se desea saber
1. Qué estudiantes participan de todas las actividades
2. Qué estudiantes realizan futbol y no teatro
3. Qué estudiantes realizan al menos alguna actividad. Evitar duplicados
4. Qué estudiantes participan de al menos dos actividades
5. Teniendo un listado de estudiantes total estudiantes/1 comprendido entre \[a, j\], qué estudiantes no realizan ninguna actividad
*/

% Qué estudiantes participan de todas las actividades
todas_actividades(Estudiante):-
    natacion(Estudiante),
    futbol(Estudiante),
    teatro(Estudiante).

% Qué estudiantes realizan futbol y no teatro
futbol_sin_teatro(Estudiante):-
    futbol(Estudiante),
    \+teatro(Estudiante).

% Qué estudiantes realizan al menos alguna actividad. Evitar duplicados
alguna_actividad(Estudiante):-
    natacion(Estudiante).
alguna_actividad(Estudiante):-
    futbol(Estudiante),
    \+natacion(Estudiante).
alguna_actividad(Estudiante):-
    teatro(Estudiante),
    \+natacion(Estudiante),
    \+futbol(Estudiante).

% Qué estudiantes participan de al menos dos actividades
% Nota: Si se elige quitar del conjunto a teatro en este caso, se debe agregar una regla extra que incluya a todas_actividades adicionalmente, sino quedará fuera "a"
dos_o_mas_actividades(Estudiante):-
    natacion(Estudiante),
    futbol(Estudiante).
dos_o_mas_actividades(Estudiante):-
    natacion(Estudiante),
    teatro(Estudiante),
    \+futbol(Estudiante).
dos_o_mas_actividades(Estudiante):-
    futbol(Estudiante),
    teatro(Estudiante),
    \+natacion(Estudiante).

% Teniendo un listado de estudiantes total estudiantes/1 comprendido entre [a, j], qué estudiantes no realizan ninguna actividad
estudiantes(a).
estudiantes(b).
estudiantes(c).
estudiantes(d).
estudiantes(e).
estudiantes(f).
estudiantes(g).
estudiantes(h).
estudiantes(i).
estudiantes(j).

sin_actividad(Estudiante):-
    estudiantes(Estudiante),
    \+alguna_actividad(Estudiante).

sin_actividad2(Estudiante):-
    estudiantes(Estudiante),
    \+natacion(Estudiante),
    \+futbol(Estudiante),
    \+teatro(Estudiante).