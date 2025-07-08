# Guía de Ejercicios: Prolog

Resolver los siguientes ejercicios utilizando el lenguaje de programación Prolog, con el paradigma lógico, intentando buscar la mejor solución posible para cada caso

## 01 - Menú de restaurant
La siguiente base de conocimiento corresponde al programa "menú" de un restaurante. El restaurante ofrece menús completos compuestos por una entrada, un plato principal y un postre. El plato principal puede ser carne o pescado.

```prolog
entrada(paella).
entrada(gazpacho).
entrada(consomé).

carne('filete de cerdo').
carne('pollo asado').

pescado(trucha).
pescado(bacalao).

postre(flan).
postre(helado).
postre(pastel).
```

Implementar las reglas necesarias para formular las siguientes consultas en Prolog:
1. ¿Cuáles son los menús que ofrece el restaurante? (menu/3)
2. ¿Cuáles son los menús que tienen consomé en las entradas? (menu_con_consomé/3). ¿Sería mejor esta regla con 2 parámetros?
3. ¿Cuáles son los menús que no contienen flan como postre? (menu_sin_flan/3)
4. ¿Cuáles son los menús que tienen carne como plato principal? (menu_con_carne/3)
5. Completar el programa "menú" de manera que una comida esté formada también por la elección de una bebida, a elegir entre vino, cerveza o agua mineral. (menu/4)


## 02 - Árbol genealógico
El árbol genealógico siguiente se describe con el programa Prolog:

```prolog
hombre(pedro).
hombre(manuel).
hombre(arturo).
mujer(maría).
padre(pedro, manuel).
padre(pedro, arturo).
padre(pedro, maría).
```

A partir de estas afirmaciones, formular las reglas generales de:

```prolog
niño(X,Y) % expresa que X es hijo o hija de Y.
hijo(X,Y) % expresa que X es un hijo varón de Y.
hija(x,y) % expresa que X es una hija de Y.
hermano-o-hermana(X,Y) % expresa que X es hermano o hermana de Y.
hermano(X,Y) % expresa que X es un hermano de Y.
hermana(X,Y) % expresa que X es una hermana de Y.
```

> **Nota:** Un individuo no puede ser hermano ni hermana de sí mismo.


## 03 - Agencia de viajes
Una agencia de viajes propone a sus clientes viajes de una o varias semanas a Roma, Londres o Túnez. El catálogo de la agencia contiene, para cada destino, el precio del transporte (con independencia de la duración) y el precio de una semana de estancia que varía según el destino y el nivel de comodidad elegidos: hotel, hostal o camping.

Escribir el conjunto de declaraciones que describen este catálogo.

```prolog
transporte(roma, 20).
transporte(londres, 30).
transporte(tunez, 10).

alojamiento(roma, hotel, 50).
alojamiento(roma, hostal, 30).
alojamiento(roma, camping, 10).
alojamiento(londres, hotel, 60).
alojamiento(londres, hostal, 40).
alojamiento(londres, camping, 20).
alojamiento(tunez, hotel, 40).
alojamiento(tunez, hostal, 20).
alojamiento(tunez, camping, 5).
```

1. Crear la regla `viaje/4` tal que se cumpla que: "el viaje a una Ciudad durante S semanas con un Hospedaje valido con un Precio total"
2. Completar con `viajeeconomico/5`, agregando un parámetro extra que defina el Precio máximo del viaje.
3. (Opcional) Utilizando el predicado [var/1](https://www.swi-prolog.org/pldoc/man?predicate=var/1), intentar definir el precio si Semanas esta definido, sino dejar la expresion planteada.
4. (Opcional) Utilizando el modulo clpfd `:- use_module(library(clpfd)).`, reemplazar el is/2 del punto 1 por el operador #=/2 y comprobar que pasa si no se tiene información suficiente de las semanas y del precio, y luego comprobar si es capaz de predecir las semanas. Nota: #=/2 funciona solo para enteros.


## 04 - Notas de examen
Se dispone de un listado con los resultados de los parciales de los alumnos del curso de **Paradigmas de Programación**, organizado de la siguiente manera:

### Versión 1

```prolog
parcial1(ana,7).
parcial1(juan,4).
parcial1(julio, 2).
parcial1(maria, 10).

parcial2(ana,9).
parcial2(juan,8).
parcial2(julio, 4).
parcial2(maria, 2).
```

Se desea obtener:

1. El listado de los alumnos que promocionan la materia
2. El mismo listado pero esta vez incluyendo la nota final (promedio de los dos parciales) para cada uno
3. El listado de los alumnos que recursan la materia.
4. El listado de los alumnos que obtendrán la cursada. 
5. (maximos) A fin de entregar la medalla al mérito, encontrar de aquellos que promocionan (1b), el o los alumnos con mayor nota final (nombre y nota)
6. (maximos) Ahora se desea obtener cuales fueron las dos notas más altas, considerando simplemente a la nota como el promedio de la nota de parcial1 y parcial2. Solo interesan los números. Un tip es pensar la resolución en dos etapas, la más alta, y después la más alta de lo restante

### Versión 2
El listado se compone de al menos una nota para cada alumno. En caso de que algún alumno adeude uno de los parciales (es decir no tenga un hecho relacionado a su parcial), su condición es ausente.
No se toman en cuenta quienes no dieron ninguno de los parciales.


## 05 - Agencia matrimonial
Una agencia matrimonial de los años '80 tiene un fichero de candidatos al matrimonio organizado según las declaraciones siguientes:

```prolog
hombre(N,A,C,E).
mujer(N,A,C,E).
```
Donde `N` es el nombre de un hombre o una mujer, `A` su altura (alta, media, baja), `C` el color de su cabello (rubio, castaño, pelirrojo, negro) y `E` su edad (joven,adulta,vieja).

```prolog
gusta(N,M,L,S).
```
Que indica que a la persona `N` le gusta el género de música `M` (clásica, pop, jazz), el género de literatura `L` (aventura, ciencia-ficción, policíaca), y practica el deporte `S` (tenis, natación, jogging).

```prolog
busca(N,A,C,E).
```
Que expresa que la persona `N` busca una pareja de altura `A`, con cabello color `C` y edad `E`.

Se considera que dos personas x e y de sexos diferentes son adecuadas si x conviene a y e y conviene a x.
Se dice que x conviene a y si x conviene físicamente a y (la altura, edad y color de cabello de y son los que busca x) y si, además, los gustos de x e y en música, literatura y deporte coinciden.


## 06 - Corte de control
Con el ejercico resuelto de 'menú', describir la semántica de las siguientes tres consultas Prolog y decir cuál es el resultado de la ejecución:

```prolog
menu(E,PP,P), !.
menu(E,PP,P), pescado(PP), !.
menu(E,PP,P), !, pescado(PP).
```

Analizar el comportamiento del operador ! (operador de corte o " cut").


## 07 - Conjuntos de actividades
Dado el siguiente listado de actividades extracurriculares que realiza cada estudiante

```prolog
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
```

Se desea saber
1. Qué estudiantes participan de todas las actividades
2. Qué estudiantes realizan futbol y no teatro
3. Qué estudiantes realizan al menos alguna actividad. Evitar duplicados
4. Qué estudiantes participan de al menos dos actividades
5. Teniendo un listado de estudiantes total estudiantes/1 comprendido entre \[a, j\], qué estudiantes no realizan ninguna actividad


## 08 - Reuniones empresariales
Dada una base de conocimientos de disponibilidad de horarios (bloques de 1 hora) para reuniones

```prolog
disponibilidad_equipo(marketing, 9).
disponibilidad_equipo(marketing, 10).
disponibilidad_equipo(desarrollo, 10).
disponibilidad_equipo(desarrollo, 11).
disponibilidad_equipo(ventas, 9).
disponibilidad_equipo(ventas, 11).

disponibilidad_cliente(google, 9).
disponibilidad_cliente(google, 10).
disponibilidad_cliente(google, 11).
disponibilidad_cliente(apple, 10).
disponibilidad_cliente(apple, 11).
disponibilidad_cliente(microsoft, 9).
disponibilidad_cliente(microsoft, 11).
```

1. Se desea saber la disponibilidad para formar una reunión entre nuestros equipos y los clientes. Se debe crear la regla disponibilidad_reunion/3 que determine las reuniones posibles de cada uno de nuestros equipos con cada uno de nuestros clientes en cada horario posible. Para el caso planteado, la salida la siguiente

| Equipo     | Cliente   | Hora |
| ---------- | --------- | ---- |
| marketing  | google    | 9    |
| marketing  | microsoft | 9    |
| marketing  | google    | 10   |
| marketing  | apple     | 10   |
| desarrollo | google    | 10   |
| desarrollo | apple     | 10   |
| ...        | ...       | ...  |


2. Se agrega la posibilidad de reservar un horario de reunión para un equipo y un cliente en un horario en especifico, con el hecho reunion_pactada/3. Se pide crear una nueva regla disponibilidad_reunion_final/3 donde se tenga en cuenta las reuniones ya pactadas y se excluyan de las reuniones disponibles, pero ojo, si por ejemplo una de las reuniones pactadas es de ventas con google a las 11, el equipo de ventas no estará disponible a las 11, pero tampoco lo estará el equipo de google (ya que se considera solo 1 disponibilidad por equipo y cliente por horario)

Ejemplo: Para las siguientes reuniones pactadas

```prolog
reunion_pactada(ventas, google, 11).
reunion_pactada(marketing, apple, 10).
```

La salida esperada será
| Equipo     | Cliente   | Hora |
| ---------- | --------- | ---- |
| marketing  | google    | 9    |
| marketing  | microsoft | 9    |
| desarrollo | google    | 10   |
| desarrollo | apple     | 11   |
| desarrollo | google    | 11   |
| ventas     | google    | 9    |
| ventas     | microsoft | 9    |


## 09 - Mínimas calorias
1. Modificar el programa del ejercicio **01 - Menú de restaurant** para poder consultar cual es el menú completo que tiene menor cantidad de calorías (agregando las calorias como parte de la información de los hechos). Se recomienda primero hacer un menu/4 donde incluya las calorias totales.
2. Hallar el menú completo que tiene la menor cantidad de calorias, sin contar al menor de todos (hallar el segundo mínimo)

## 10 - Vendedores
Dado el listado de vendedores y ventas semestrales se desea obtener el listado anual de comisiones. Las comisiones se liquidan de la siguiente manera:

- 20% del total vendido en el año para aquellos vendedores que hayan tenido ventas en ambos semestres y cada una de ellas supera los $ 20000.
- 10% del total vendido en el año para aquellos vendedores que hayan tenido ventas en ambos semestres, pero no superan los $ 20000 en alguno de estos.
- 5% del total vendido para los vendedores que no registran ventas en algún semestre 

Se dispone de los siguientes datos:

```prolog
ventas1erSem(vendedor, importe).
.
.
ventas2doSem(vendedor, importe).
```

> **Nota:** No todos los vendedores venden en ambos semestres, todos los importes son mayores que cero. En caso de no registrarse ventas en algún semestre, no figura la regla correspondiente para ese vendedor.

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


## 12 - Operaciones de listas
Utilizando los conceptos de lista y recursividad y sin utilizar los predicados existentes para listas en prolog, resolver:

1. Suma de todos los valores de una lista. suma/2 (Lista, Total)
2. Contar cuantos valores repetidos de un elemento hay en una lista. contar/3 (Lista, Elemento, Cantidad)
3. Buscar todas las posiciones de un elemento en una lista. indice_de/3 (Lista, Elemento, Posicion)

Pudiendo utilizar predicados existentes, resolver

4. Para un listado de 0 a n hechos nota/1, con notas de 1 a 10, hallar el promedio de las mismas. promedio_nota/1
