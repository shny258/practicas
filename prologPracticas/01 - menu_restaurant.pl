/*
01 - Menú de restaurant
La siguiente base de conocimiento corresponde al programa "menú" de un restaurante. El restaurante ofrece menús completos compuestos por una entrada, un plato principal y un postre. El plato principal puede ser carne o pescado.
*/

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

/*
Implementar las reglas necesarias para formular las siguientes consultas en Prolog:
1. ¿Cuáles son los menús que ofrece el restaurante? (menu/3)
2. ¿Cuáles son los menús que tienen consomé en las entradas? (menu_con_consomé/3). ¿Sería mejor esta regla con 2 parámetros?
3. ¿Cuáles son los menús que no contienen flan como postre? (menu_sin_flan/3)
4. ¿Cuáles son los menús que tienen carne como plato principal? (menu_con_carne/3)
5. Completar el programa "menú" de manera que una comida esté formada también por la elección de una bebida, a elegir entre vino, cerveza o agua mineral. (menu/4)
*/