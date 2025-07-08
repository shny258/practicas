/*
## 08 - Reuniones empresariales
Dada una base de conocimientos de disponibilidad de horarios (bloques de 1 hora) para reuniones
*/

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

/*
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
*/

% 1
disponibilidad_reunion(Equipo, Cliente, Hora):-
    disponibilidad_equipo(Equipo, Hora),
    disponibilidad_cliente(Cliente, Hora).

% Base de conocimientos adicional del enunciado
reunion_pactada(ventas, google, 11).
reunion_pactada(marketing, apple, 10).

% 2: Posible solución utilizando la regla ya creada y restas de conjuntos
disponibilidad_reunion_pactadas(Equipo, Cliente, Hora):-
    disponibilidad_reunion(Equipo, Cliente, Hora),
    \+reunion_pactada(Equipo, _, Hora),
    \+reunion_pactada(_, Cliente, Hora).