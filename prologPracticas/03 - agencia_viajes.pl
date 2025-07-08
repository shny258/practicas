/*
03 - Agencia de viajes
Una agencia de viajes propone a sus clientes viajes de una o varias semanas a Roma, Londres o Túnez. El catálogo de la agencia contiene, para cada destino, el precio del transporte (con independencia de la duración) y el precio de una semana de estancia que varía según el destino y el nivel de comodidad elegidos: hotel, hostal o camping.

Escribir el conjunto de declaraciones que describen este catálogo.
*/
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

/*
1. Crear la regla `viaje/4` tal que se cumpla que: "el viaje a una Ciudad durante S semanas con un Hospedaje valido con un Precio total"
2. Completar con `viajeeconomico/5`, agregando un parámetro extra que defina el Precio máximo del viaje.
3. (Opcional) Utilizando el predicado [var/1](https://www.swi-prolog.org/pldoc/man?predicate=var/1), intentar definir el precio si Semanas esta definido, sino dejar la expresion planteada.
4. (Opcional) Utilizando el modulo clpfd `:- use_module(library(clpfd)).`, reemplazar el is/2 del punto 1 por el operador #=/2 y comprobar que pasa si no se tiene información suficiente de las semanas y del precio, y luego comprobar si es capaz de predecir las semanas. Nota: #=/2 funciona solo para enteros.
*/

viaje(Ciudad, Semanas, Hospedaje, Precio):-
    transporte(Ciudad, PrecioTransporte),
    alojamiento(Ciudad, Hospedaje, PrecioSemanalHospedaje),
    Precio is PrecioTransporte + PrecioSemanalHospedaje * Semanas.


viajeeconomico(Ciudad, Semanas, Hospedaje, Precio, PrecioMinimo):-
    viaje(Ciudad, Semanas, Hospedaje, Precio),
    Precio =< PrecioMinimo.


viaje2(Ciudad, Semanas, Hospedaje, Precio):-
    transporte(Ciudad, PrecioTransporte),
    alojamiento(Ciudad, Hospedaje, PrecioSemanalHospedaje),
    (
    	(
        	\+var(Semanas),
            Precio is PrecioTransporte + PrecioSemanalHospedaje * Semanas
        );
        (
        	var(Semanas),
            Precio = PrecioTransporte + PrecioSemanalHospedaje * Semanas
        )
    ).


:- use_module(library(clpfd)).

viaje3(Ciudad, Semanas, Hospedaje, Precio):-
    transporte(Ciudad, PrecioTransporte),
    alojamiento(Ciudad, Hospedaje, PrecioSemanalHospedaje),
    PrecioTransporte + PrecioSemanalHospedaje * Semanas #= Precio.

% Permite no solo usar semanas como variable, sino también definir un precio total
% viaje3(Ciudad, Semanas, Hospedaje, 100)
% roma	8	camping
% tunez	18	camping