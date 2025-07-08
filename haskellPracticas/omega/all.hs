--1. Escribir una función que sume dos números enteros.
sumar :: Int -> Int -> Int
sumar a b = a + b

--2. Implementar una función que calcule el área de un círculo dado su radio.
areaCirc :: Float -> Float
areaCirc a = pi * a * a

--3. Definir una función que determine si un número es par o impar.
esPar :: Int -> Bool
esPar a = mod a 2 == 0

--4. Escribir una función que calcule el factorial de un número.
factorial :: Int -> Int
factorial 0 = 1
factorial a = a * factorial (a-1)

--5. Implementar una función que invierta una lista.
invertir :: [a] -> [a]
invertir [] = []
invertir (x:xs) = invertir (xs) ++ [x]

--6. Definir una función que determine si una lista está ordenada de forma ascendente.
esOrdAsc :: [Int] -> Bool
esOrdAsc [a] = True
esOrdAsc (x:y:xs) =  x <= y && esOrdAsc (y:xs)

--7. Escribir una función que cuente la cantidad de elementos en una lista.
cantElem :: [a] -> Int
cantElem [] = 0
cantElem [a] = 1
cantElem (x:xs) = 1 + cantElem xs

--8. Implementar una función que obtenga los elementos en posiciones pares de una lista.
elemPosPares :: [Int] -> [Int]
elemPosPares [] = []
elemPosPares [a] = [a]
elemPosPares (x:y:xs) = x:elemPosPares xs

--8.1. Implementar una función que obtenga los elementos pares de una lista.
esPar :: Int -> Bool
esPar a = mod a 2 == 0

elemPares :: [Int] -> [Int]
elemPares [] = []
elemPares (x:xs) = if esPar x
  then x:elemPares (xs)
  else elemPares xs

--9. Definir una función que calcule el máximo común divisor de dos números.
mcd :: Int -> Int -> Int
mcd a 0 = a
mcd a b = mcd b (mod a b)

--11. Implementar una función que calcule la suma de los dígitos de un número entero.
sumaDigitos :: Int -> Int
sumaDigitos 0 = 0
sumaDigitos n = mod n 10 + sumaDigitos (div n 10)

--12. Definir una función que encuentre el elemento mínimo en una lista.
menor :: Int -> Int -> Int
menor a b = if a < b
  then a
  else b

elemMinimo :: [Int] -> Int
elemMinimo [a] = a
elemMinimo (x:xs) = menor x (elemMinimo xs)

--13. Escribir una función que obtenga el enésimo número de la secuencia de Fibonacci.
fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-2) + fibonacci (n-1)

--14. Implementar una función que verifique si una cadena de texto es un palíndromo.
esPalindromo :: String -> Bool
esPalindromo s = s == reverse s

esPalindromo2 :: String -> Bool
esPalindromo2 [] = True
esPalindromo2 [x] = True
esPalindromo2 (x:xs) = x == last xs && esPalindromo2 (init xs)

--15. Definir una función que elimine los duplicados de una lista.
elimDupli :: [Int] -> [Int]
elimDupli [] = []
elimDupli [a] = [a]
elimDupli (x:xs) if elem x xs
  then elimDupli xs
  else x : elimDupli xs

--16. Implementar una función que obtenga el producto de todos los elementos de una lista.
prodLst :: [Int] -> Int
prodLst [a] = a
prodLst (x:xs) = a * prodLst xs