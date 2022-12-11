//
//  Day11.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 11.12.22.
//

import Foundation

fileprivate typealias WorryLevel = UInt64

fileprivate class Monkey {
    var items: [WorryLevel]
    let operation: Operation
    let testDivisibleBy: WorryLevel
    let trueThrowTo: Int
    let falseThrowTo: Int
    var numberOfInspectedItems = 0
    
    init(items: [WorryLevel], operation: Operation, testDivisibleBy: WorryLevel, trueThrowTo: Int, falseThrowTo: Int) {
        self.items = items
        self.operation = operation
        self.testDivisibleBy = testDivisibleBy
        self.trueThrowTo = trueThrowTo
        self.falseThrowTo = falseThrowTo
    }
    
    static func parsed(lines: [String]) -> Monkey {
        return .init(
            items: lines[1].components(separatedBy: ": ").last!.components(separatedBy: ", ").map { WorryLevel($0)! },
            operation: .parsed(line: lines[2]),
            testDivisibleBy: WorryLevel(String(lines[3].split(separator: " ").last!))!,
            trueThrowTo: Int(lines[4].split(separator: " ").last!)!,
            falseThrowTo: Int(lines[5].split(separator: " ").last!)!
        )
    }
}

fileprivate enum Operation {
    case add(WorryLevel)
    case multiplyBy(WorryLevel)
    case square
    
    static func parsed(line: String) -> Operation {
        let parts = line.split(separator: " ").suffix(2).map(String.init)
        switch (parts[0], parts[1]) {
        case ("*", "old"):
            return .square
        case ("*", let value):
            return .multiplyBy(WorryLevel(value)!)
        case ("+", let value):
            return .add(WorryLevel(value)!)
        default:
            fatalError("unrecognized operation")
        }
    }
    
    func apply(to oldValue: WorryLevel) -> WorryLevel {
        switch self {
        case .add(let operationValue): return oldValue + operationValue
        case .multiplyBy(let operationValue): return oldValue * operationValue
        case .square: return oldValue * oldValue
        }
    }
}

func day11() {
    let lines = input11.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
    let rawMonkeys = lines.split(separator: "").map { monkey in monkey.map { String($0) } }
    
    do {
        let monkeys = rawMonkeys.map(Monkey.parsed)
        let numberOfRounds = 20
        
        for _ in 1...numberOfRounds {
            for monkey in monkeys {
                while !monkey.items.isEmpty {
                    var item = monkey.items.removeFirst()
                    item = monkey.operation.apply(to: item)
                    item /= 3
                    if item.isMultiple(of: monkey.testDivisibleBy) {
                        monkeys[monkey.trueThrowTo].items.append(item)
                    } else {
                        monkeys[monkey.falseThrowTo].items.append(item)
                    }
                    monkey.numberOfInspectedItems += 1
                }
            }
        }
        
        let monkeyBusiness = monkeys.map(\.numberOfInspectedItems).sorted(by: >).prefix(2).reduce(1) { $0 * $1 }
        
        print("day11 part1 result: \(monkeyBusiness)") //118674
    }
    
    do {
        let monkeys = rawMonkeys.map(Monkey.parsed)
        let numberOfRounds = 10000
        
        let totalDivisibility = monkeys.reduce(1) { $0 * $1.testDivisibleBy }
        
        for _ in 1...numberOfRounds {
            for monkey in monkeys {
                while !monkey.items.isEmpty {
                    var item = monkey.items.removeFirst()
                    item = monkey.operation.apply(to: item)
                    item %= totalDivisibility
                    if item.isMultiple(of: monkey.testDivisibleBy) {
                        monkeys[monkey.trueThrowTo].items.append(item)
                    } else {
                        monkeys[monkey.falseThrowTo].items.append(item)
                    }
                    monkey.numberOfInspectedItems += 1
                }
            }
        }
        
        let monkeyBusiness = monkeys.map(\.numberOfInspectedItems).sorted(by: >).prefix(2).reduce(1) { $0 * $1 }
        
        print("day11 part2 result: \(monkeyBusiness)") //32333418600
    }
}
