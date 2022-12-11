//
//  main.swift
//  AdventOfCode2022_11
//
//  Created by Christopher Thielen on 12/10/22.
//

// DIRTY SOLUTION: This code was written against the clock in search of the answer.

// This code solves the puzzle at https://adventofcode.com/2022/day/11

import Foundation

struct Monkey {
    var id: Int
    var items: [Int]
    var operation: (_ oldWorryLevel: Int) -> Int
    var test: (_ worryLevel: Int) -> Bool
    var monkeyOnTestTrue: Int
    var monkeyOnTestFalse: Int
    var inspectionCount = 0
}

var monkeys: [Monkey] = []

// test data
//monkeys.append(Monkey(id: 0, items: [79, 98], operation: { oldWorryLevel in
//    return oldWorryLevel * 19
//}, test: { worryLevel in
//    return (worryLevel % 23) == 0
//}, monkeyOnTestTrue: 2, monkeyOnTestFalse: 3))
//
//monkeys.append(Monkey(id: 1, items: [54, 65, 75, 74], operation: { oldWorryLevel in
//    return oldWorryLevel + 6
//}, test: { worryLevel in
//    return (worryLevel % 19) == 0
//}, monkeyOnTestTrue: 2, monkeyOnTestFalse: 0))
//
//monkeys.append(Monkey(id: 2, items: [79, 60, 97], operation: { oldWorryLevel in
//    return oldWorryLevel * oldWorryLevel
//}, test: { worryLevel in
//    return (worryLevel % 13) == 0
//}, monkeyOnTestTrue: 1, monkeyOnTestFalse: 3))
//
//monkeys.append(Monkey(id: 3, items: [74], operation: { oldWorryLevel in
//    return oldWorryLevel + 3
//}, test: { worryLevel in
//    return (worryLevel % 17) == 0
//}, monkeyOnTestTrue: 0, monkeyOnTestFalse: 1))

monkeys.append(Monkey(id: 0, items: [89, 73, 66, 57, 64, 80], operation: { oldWorryLevel in
    return oldWorryLevel * 3
}, test: { worryLevel in
    return (worryLevel % 13) == 0
}, monkeyOnTestTrue: 6, monkeyOnTestFalse: 2))

monkeys.append(Monkey(id: 1, items: [83, 78, 81, 55, 81, 59, 69], operation: { oldWorryLevel in
    return oldWorryLevel + 1
}, test: { worryLevel in
    return (worryLevel % 3) == 0
}, monkeyOnTestTrue: 7, monkeyOnTestFalse: 4))

monkeys.append(Monkey(id: 2, items: [76, 91, 58, 85], operation: { oldWorryLevel in
    return oldWorryLevel * 13
}, test: { worryLevel in
    return (worryLevel % 7) == 0
}, monkeyOnTestTrue: 1, monkeyOnTestFalse: 4))

monkeys.append(Monkey(id: 3, items: [71, 72, 74, 76, 68], operation: { oldWorryLevel in
    return oldWorryLevel * oldWorryLevel
}, test: { worryLevel in
    return (worryLevel % 2) == 0
}, monkeyOnTestTrue: 6, monkeyOnTestFalse: 0))

monkeys.append(Monkey(id: 4, items: [98, 85, 84], operation: { oldWorryLevel in
    return oldWorryLevel + 7
}, test: { worryLevel in
    return (worryLevel % 19) == 0
}, monkeyOnTestTrue: 5, monkeyOnTestFalse: 7))

monkeys.append(Monkey(id: 5, items: [78], operation: { oldWorryLevel in
    return oldWorryLevel + 8
}, test: { worryLevel in
    return (worryLevel % 5) == 0
}, monkeyOnTestTrue: 3, monkeyOnTestFalse: 0))

monkeys.append(Monkey(id: 6, items: [86, 70, 60, 88, 88, 78, 74, 83], operation: { oldWorryLevel in
    return oldWorryLevel + 4
}, test: { worryLevel in
    return (worryLevel % 11) == 0
}, monkeyOnTestTrue: 1, monkeyOnTestFalse: 2))

monkeys.append(Monkey(id: 7, items: [81, 58], operation: { oldWorryLevel in
    return oldWorryLevel + 5
}, test: { worryLevel in
    return (worryLevel % 17) == 0
}, monkeyOnTestTrue: 3, monkeyOnTestFalse: 5))


// Part one

//for round in 1...20 {
//    print("Round: \(round)")
//
//    for monkey in monkeys {
//        print("Monkey \(monkey.id): \(monkey.items)")
//    }
//
//    for i in 0..<monkeys.count {
//        let monkey = monkeys[i]
//        print("Monkey \(monkey.id):")
//        for var item in monkey.items {
//            print("\tR \(round), Monkey inspects an item with a worry level of \(item).")
//            item = monkey.operation(item)
//            print("\t\tWorry level is now \(item).")
//            item = (item / 3)
//            print("\t\tMonkey gets bored with item. Worry level is divided by 3 to \(item).")
//            let nextMonkeyId = monkey.test(item) ? monkey.monkeyOnTestTrue : monkey.monkeyOnTestFalse
//            monkeys[nextMonkeyId].items.append(item)
//            print("\t\tItem with worry level \(item) is thrown to monkey \(nextMonkeyId).")
//            monkeys[monkey.id].inspectionCount += 1
//        }
//        monkeys[monkey.id].items = []
//    }
//}
//
//for monkey in monkeys {
//    print("Monkey \(monkey.id): \(monkey.items)")
//}
//
//for monkey in monkeys {
//    print("Monkey \(monkey.id) inspected items \(monkey.inspectionCount) times")
//}

// part one, right answer 119715




// Part two

for round in 1...10000 {
    print("Round: \(round)")
    
    for monkey in monkeys {
        print("Monkey \(monkey.id): \(monkey.items)")
    }
    
    for i in 0..<monkeys.count {
        let monkey = monkeys[i]
        print("Monkey \(monkey.id):")
        for var item in monkey.items {
            print("\tR \(round), Monkey inspects an item with a worry level of \(item).")
            item = monkey.operation(item)
            print("\t\tWorry level is now \(item).")
            //item = item % 100000
            item = item % 9699690 // hard-coded to the product of the divisors of all monkeys
            //print("\t\tMonkey gets bored with item. Worry level is divided by 3 to \(item).")
            let nextMonkeyId = monkey.test(item) ? monkey.monkeyOnTestTrue : monkey.monkeyOnTestFalse
            monkeys[nextMonkeyId].items.append(item)
            print("\t\tItem with worry level \(item) is thrown to monkey \(nextMonkeyId).")
            monkeys[monkey.id].inspectionCount += 1
        }
        monkeys[monkey.id].items = []
    }
}

for monkey in monkeys {
    print("Monkey \(monkey.id): \(monkey.items)")
}

for monkey in monkeys.sorted(by: { $0.inspectionCount > $1.inspectionCount }) {
    print("Monkey \(monkey.id) inspected items \(monkey.inspectionCount) times")
}

// part two not 25258720306
// part two answer: 18085004878
