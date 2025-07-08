--1. Dado dos números enteros A y B, implemente una función que retorne la división entera de ambos por el método de las restas sucesivas
divRestas :: Int -> Int -> Int
divRestas a b = if a < b
  then 0
  else 1 + divRestas (a - b) b

--2. Escribir una función para hallar la potencia de un número
potencia :: Int -> Int -> Int
potencia a 0 = 1
potencia a 1 = a
potencia a b = a * potencia a (b-1)

--3. Definir una función menor que devuelve el menor de sus dos argumentos enteros
menor :: Int -> Int -> Int
menor a b = if a < b
  then a
  else b

--4. Definir una función maximoDeTres que devuelve el máximo de sus argumentos enteros
mayor :: Int -> Int -> Int
mayor a b = if a > b
  then a
  else b

maximoDeTres :: Int -> Int -> Int -> Int
maximoDeTres a b c = mayor (mayor a b) c