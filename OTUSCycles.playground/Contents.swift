import UIKit

// Описание/Пошаговая инструкция выполнения домашнего задания:

/* Сгенерировать массив случайных чисел (например 200 чисел).
 Найти индекс первого повторяющегося числа в массиве. Если все числа разные - то -1.
 
 Пример : [3, 4, 5, 6, 8, 78, 67, 4, 88] - 4, индекс 1 */

// Решение

//1. Генерируем массив
func makeList(_ n: Int) -> [Int] {
    return (0..<n).map{ _ in Int(arc4random_uniform(200) + 11) }
}

let list = makeList(200)

//2. Метод для поиска числа (будет возвращать Int)

func findFirstRepeated(numbersArray: [Int]) -> Int {
    var resultDictionary: [Int: Int] = [:]
    
    var minimalIndex = Int.max
    
    for el in 0..<numbersArray.count {
        if let previousIndex = resultDictionary[numbersArray[el]] {
            if minimalIndex > previousIndex {
                minimalIndex = previousIndex
            }
        }
        resultDictionary[numbersArray[el]] = el
    }
    
    return minimalIndex == Int.max ? -1 : minimalIndex
}

let result = findFirstRepeated(numbersArray: list.sorted())
print(list.sorted())
print(result)

