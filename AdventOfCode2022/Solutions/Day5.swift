//
//  Day5.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 05.12.22.
//

import Foundation

private let input = { """
move 2 from 7 to 2
move 1 from 4 to 8
move 2 from 1 to 9
move 4 from 6 to 5
move 1 from 7 to 6
move 2 from 1 to 4
move 7 from 8 to 9
move 7 from 4 to 5
move 4 from 2 to 4
move 1 from 5 to 9
move 14 from 5 to 4
move 1 from 3 to 8
move 5 from 4 to 8
move 1 from 2 to 5
move 2 from 4 to 1
move 6 from 8 to 1
move 1 from 8 to 6
move 1 from 2 to 5
move 5 from 3 to 7
move 2 from 6 to 3
move 2 from 4 to 7
move 3 from 3 to 9
move 7 from 4 to 1
move 1 from 6 to 9
move 2 from 6 to 1
move 3 from 5 to 2
move 1 from 1 to 8
move 21 from 9 to 1
move 1 from 4 to 2
move 7 from 7 to 2
move 1 from 4 to 2
move 23 from 1 to 5
move 5 from 5 to 1
move 1 from 3 to 6
move 1 from 6 to 3
move 12 from 1 to 6
move 1 from 3 to 6
move 2 from 1 to 8
move 1 from 9 to 3
move 2 from 8 to 1
move 2 from 1 to 8
move 1 from 1 to 3
move 2 from 3 to 1
move 2 from 8 to 1
move 3 from 6 to 1
move 1 from 8 to 7
move 4 from 6 to 2
move 3 from 6 to 9
move 2 from 5 to 7
move 2 from 7 to 8
move 1 from 7 to 9
move 9 from 1 to 5
move 12 from 5 to 9
move 1 from 8 to 6
move 1 from 6 to 9
move 1 from 6 to 9
move 7 from 9 to 4
move 10 from 2 to 1
move 12 from 5 to 4
move 7 from 4 to 9
move 7 from 4 to 7
move 1 from 5 to 4
move 7 from 7 to 8
move 1 from 6 to 3
move 1 from 3 to 1
move 3 from 2 to 4
move 1 from 6 to 8
move 7 from 1 to 2
move 1 from 6 to 7
move 12 from 9 to 4
move 3 from 8 to 5
move 1 from 7 to 3
move 6 from 9 to 1
move 10 from 1 to 9
move 7 from 9 to 5
move 3 from 9 to 5
move 1 from 3 to 4
move 2 from 2 to 1
move 1 from 5 to 1
move 9 from 4 to 3
move 1 from 1 to 3
move 8 from 4 to 7
move 7 from 5 to 3
move 2 from 7 to 2
move 8 from 3 to 9
move 1 from 1 to 8
move 10 from 2 to 3
move 4 from 8 to 7
move 12 from 3 to 4
move 9 from 7 to 2
move 2 from 1 to 3
move 1 from 9 to 6
move 2 from 4 to 9
move 1 from 7 to 6
move 5 from 5 to 9
move 8 from 3 to 1
move 2 from 6 to 3
move 14 from 4 to 3
move 15 from 3 to 9
move 1 from 3 to 1
move 3 from 9 to 8
move 1 from 8 to 1
move 1 from 3 to 2
move 5 from 2 to 8
move 1 from 4 to 2
move 2 from 1 to 3
move 2 from 3 to 9
move 3 from 2 to 4
move 6 from 1 to 8
move 2 from 2 to 6
move 1 from 6 to 4
move 2 from 4 to 7
move 5 from 8 to 5
move 1 from 6 to 9
move 7 from 9 to 6
move 1 from 5 to 3
move 2 from 7 to 8
move 2 from 2 to 4
move 3 from 5 to 6
move 1 from 3 to 8
move 1 from 5 to 6
move 2 from 4 to 1
move 3 from 1 to 6
move 21 from 9 to 5
move 1 from 4 to 3
move 1 from 4 to 9
move 2 from 9 to 2
move 1 from 3 to 9
move 4 from 2 to 3
move 3 from 8 to 1
move 14 from 5 to 9
move 7 from 5 to 4
move 3 from 8 to 4
move 4 from 3 to 2
move 3 from 8 to 5
move 1 from 2 to 3
move 1 from 5 to 1
move 2 from 5 to 4
move 3 from 2 to 9
move 11 from 4 to 1
move 17 from 9 to 2
move 17 from 2 to 9
move 10 from 9 to 2
move 2 from 8 to 2
move 3 from 8 to 3
move 8 from 9 to 7
move 4 from 7 to 3
move 2 from 3 to 2
move 3 from 2 to 3
move 9 from 3 to 5
move 1 from 1 to 9
move 8 from 5 to 1
move 2 from 7 to 9
move 24 from 1 to 3
move 24 from 3 to 6
move 1 from 5 to 3
move 10 from 2 to 1
move 1 from 4 to 5
move 3 from 9 to 1
move 1 from 3 to 5
move 17 from 6 to 5
move 1 from 7 to 4
move 13 from 5 to 4
move 3 from 5 to 8
move 1 from 7 to 9
move 3 from 6 to 9
move 8 from 6 to 4
move 1 from 9 to 6
move 11 from 1 to 8
move 1 from 5 to 6
move 12 from 4 to 9
move 2 from 5 to 1
move 1 from 1 to 7
move 5 from 9 to 2
move 1 from 7 to 9
move 3 from 1 to 5
move 3 from 5 to 9
move 7 from 9 to 3
move 4 from 9 to 6
move 3 from 6 to 8
move 5 from 4 to 3
move 2 from 2 to 6
move 3 from 9 to 3
move 3 from 6 to 4
move 4 from 2 to 6
move 11 from 3 to 5
move 11 from 6 to 9
move 2 from 3 to 5
move 1 from 5 to 8
move 3 from 6 to 2
move 7 from 9 to 2
move 8 from 5 to 7
move 6 from 4 to 5
move 2 from 4 to 3
move 1 from 8 to 6
move 4 from 8 to 3
move 13 from 8 to 3
move 1 from 9 to 5
move 6 from 7 to 2
move 1 from 7 to 6
move 1 from 6 to 5
move 2 from 6 to 7
move 13 from 3 to 5
move 6 from 2 to 7
move 1 from 6 to 1
move 1 from 2 to 8
move 2 from 7 to 8
move 14 from 5 to 8
move 1 from 1 to 4
move 9 from 2 to 1
move 14 from 8 to 7
move 3 from 3 to 9
move 11 from 5 to 3
move 1 from 4 to 5
move 4 from 9 to 8
move 4 from 8 to 7
move 5 from 3 to 9
move 11 from 7 to 8
move 9 from 1 to 3
move 4 from 3 to 2
move 6 from 8 to 4
move 2 from 8 to 2
move 13 from 3 to 6
move 1 from 4 to 1
move 5 from 4 to 2
move 10 from 2 to 6
move 4 from 9 to 1
move 8 from 7 to 8
move 10 from 8 to 5
move 2 from 3 to 2
move 2 from 8 to 6
move 1 from 7 to 1
move 2 from 7 to 6
move 2 from 2 to 9
move 2 from 8 to 6
move 6 from 1 to 7
move 5 from 9 to 1
move 4 from 7 to 8
move 1 from 7 to 2
move 2 from 1 to 7
move 1 from 3 to 8
move 1 from 1 to 6
move 2 from 2 to 6
move 1 from 7 to 8
move 1 from 1 to 9
move 8 from 5 to 7
move 2 from 7 to 9
move 9 from 6 to 3
move 13 from 6 to 8
move 3 from 9 to 1
move 5 from 6 to 1
move 3 from 8 to 1
move 3 from 3 to 4
move 1 from 4 to 3
move 1 from 4 to 8
move 4 from 6 to 3
move 11 from 8 to 2
move 1 from 6 to 9
move 8 from 3 to 9
move 3 from 5 to 8
move 4 from 1 to 2
move 6 from 8 to 5
move 6 from 5 to 1
move 5 from 1 to 3
move 3 from 3 to 4
move 3 from 8 to 4
move 2 from 4 to 5
move 10 from 7 to 8
move 5 from 9 to 2
move 1 from 7 to 5
move 3 from 5 to 2
move 4 from 9 to 3
move 4 from 1 to 5
move 1 from 3 to 2
move 3 from 5 to 2
move 6 from 2 to 5
move 10 from 8 to 3
move 4 from 4 to 5
move 4 from 2 to 8
move 12 from 3 to 8
move 1 from 1 to 3
move 9 from 8 to 6
move 1 from 4 to 1
move 6 from 8 to 7
move 3 from 1 to 7
move 9 from 5 to 7
move 11 from 7 to 2
move 2 from 7 to 3
move 9 from 2 to 7
move 1 from 8 to 7
move 1 from 5 to 2
move 2 from 6 to 2
move 2 from 1 to 2
move 6 from 3 to 5
move 2 from 3 to 6
move 4 from 7 to 3
move 3 from 3 to 1
move 2 from 1 to 5
move 7 from 7 to 6
move 1 from 1 to 5
move 3 from 2 to 4
move 1 from 3 to 2
move 18 from 2 to 1
move 4 from 2 to 7
move 6 from 5 to 9
move 1 from 4 to 8
move 2 from 6 to 1
move 19 from 1 to 2
move 4 from 9 to 5
move 5 from 7 to 2
move 1 from 8 to 7
move 1 from 1 to 2
move 6 from 5 to 7
move 1 from 3 to 8
move 6 from 7 to 6
move 1 from 4 to 1
move 4 from 7 to 9
move 1 from 1 to 3
move 1 from 2 to 5
move 1 from 4 to 8
move 1 from 3 to 4
move 3 from 5 to 4
move 2 from 8 to 9
move 9 from 2 to 4
move 19 from 6 to 4
move 1 from 4 to 7
move 5 from 9 to 5
move 10 from 2 to 9
move 2 from 5 to 4
move 14 from 4 to 7
move 2 from 2 to 1
move 3 from 9 to 1
move 1 from 1 to 3
move 13 from 7 to 6
move 1 from 5 to 9
move 1 from 6 to 9
move 1 from 7 to 2
move 5 from 9 to 7
move 1 from 5 to 2
move 3 from 7 to 3
move 3 from 4 to 9
move 1 from 5 to 2
move 4 from 4 to 2
move 2 from 7 to 3
move 4 from 1 to 6
move 1 from 7 to 9
move 11 from 9 to 5
move 8 from 2 to 9
move 6 from 9 to 6
move 8 from 4 to 5
move 14 from 5 to 6
move 1 from 5 to 4
move 3 from 5 to 1
move 1 from 5 to 2
move 2 from 6 to 4
move 2 from 4 to 2
move 1 from 9 to 2
move 1 from 2 to 3
move 1 from 9 to 3
move 3 from 2 to 7
move 7 from 6 to 7
move 5 from 4 to 3
move 23 from 6 to 1
move 5 from 7 to 2
move 22 from 1 to 6
move 6 from 6 to 3
move 6 from 2 to 4
move 6 from 4 to 1
move 3 from 7 to 8
move 3 from 1 to 8
move 4 from 3 to 2
move 1 from 1 to 3
move 3 from 3 to 1
move 1 from 7 to 5
move 1 from 6 to 5
move 1 from 7 to 4
move 4 from 6 to 9
move 5 from 3 to 6
move 2 from 2 to 1
move 3 from 9 to 4
move 11 from 1 to 9
move 2 from 4 to 7
move 4 from 6 to 1
move 1 from 5 to 4
move 5 from 8 to 9
move 1 from 7 to 1
move 3 from 2 to 7
move 4 from 1 to 2
move 3 from 4 to 2
move 1 from 8 to 5
move 1 from 5 to 4
move 1 from 5 to 4
move 5 from 6 to 1
move 3 from 7 to 6
move 5 from 2 to 8
move 15 from 9 to 2
move 1 from 3 to 9
move 10 from 6 to 8
move 1 from 4 to 9
move 1 from 8 to 3
move 1 from 4 to 6
move 4 from 6 to 3
move 2 from 9 to 7
move 1 from 7 to 6
move 1 from 1 to 6
move 3 from 3 to 8
move 2 from 7 to 8
move 3 from 8 to 4
move 12 from 2 to 9
move 14 from 9 to 5
move 12 from 8 to 2
move 1 from 6 to 7
move 8 from 3 to 1
move 2 from 4 to 6
move 1 from 3 to 6
move 5 from 6 to 1
move 17 from 1 to 2
move 29 from 2 to 1
move 1 from 8 to 5
move 1 from 4 to 3
move 1 from 8 to 5
move 1 from 8 to 7
move 5 from 2 to 1
move 1 from 3 to 5
move 1 from 6 to 4
move 6 from 5 to 8
move 1 from 4 to 9
move 1 from 7 to 2
move 1 from 2 to 6
move 7 from 8 to 7
move 1 from 6 to 9
move 2 from 9 to 2
move 2 from 2 to 8
move 15 from 1 to 2
move 2 from 8 to 3
move 9 from 1 to 2
move 24 from 2 to 7
move 11 from 1 to 2
move 1 from 3 to 1
move 22 from 7 to 6
move 6 from 5 to 2
move 2 from 6 to 5
move 1 from 1 to 9
move 1 from 9 to 6
move 6 from 5 to 1
move 12 from 6 to 2
move 3 from 1 to 5
move 1 from 3 to 2
move 25 from 2 to 6
move 4 from 7 to 5
move 8 from 5 to 4
move 4 from 4 to 8
move 1 from 1 to 8
move 5 from 8 to 4
move 4 from 4 to 1
move 2 from 1 to 9
move 20 from 6 to 8
move 4 from 2 to 6
move 19 from 8 to 7
move 2 from 9 to 3
move 1 from 8 to 2
move 11 from 6 to 7
move 3 from 1 to 2
move 5 from 4 to 3
move 1 from 1 to 3
move 1 from 3 to 5
move 2 from 2 to 8
move 33 from 7 to 3
move 1 from 5 to 3
move 1 from 8 to 7
move 1 from 7 to 4
move 5 from 6 to 8
move 2 from 7 to 6
move 2 from 2 to 3
move 1 from 2 to 5
move 1 from 7 to 9
move 1 from 5 to 7
move 1 from 8 to 2
move 1 from 4 to 3
move 43 from 3 to 7
move 1 from 3 to 8
move 1 from 6 to 8
move 8 from 7 to 5
move 3 from 5 to 3
move 1 from 6 to 4
move 2 from 6 to 7
move 4 from 8 to 7
move 3 from 3 to 2
move 1 from 9 to 6
move 3 from 8 to 3
move 1 from 6 to 7
move 1 from 4 to 6
move 1 from 3 to 7
move 1 from 3 to 2
move 5 from 2 to 5
move 1 from 6 to 1
move 1 from 3 to 2
move 42 from 7 to 5
move 44 from 5 to 4
move 2 from 5 to 8
move 1 from 7 to 3
move 16 from 4 to 6
move 3 from 5 to 9
"""
}()

/*
        [H]         [S]         [D]
    [S] [C]         [C]     [Q] [L]
    [C] [R] [Z]     [R]     [H] [Z]
    [G] [N] [H] [S] [B]     [R] [F]
[D] [T] [Q] [F] [Q] [Z]     [Z] [N]
[Z] [W] [F] [N] [F] [W] [J] [V] [G]
[T] [R] [B] [C] [L] [P] [F] [L] [H]
[H] [Q] [P] [L] [G] [V] [Z] [D] [B]
 1   2   3   4   5   6   7   8   9
*/

let initialStacks: [[Character]] = [
    ["H", "T", "Z", "D"],
    ["Q", "R", "W", "T", "G", "C", "S"],
    ["P", "B", "F", "Q", "N", "R", "C", "H"],
    ["L", "C", "N", "F", "H", "Z"],
    ["G", "L", "F", "Q", "S"],
    ["V", "P", "W", "Z", "B", "R", "C", "S"],
    ["Z", "F", "J"],
    ["D", "L", "V", "Z", "R", "H", "Q"],
    ["B", "H", "G", "N", "F", "Z", "L", "D"],
]

func day5() {
    let lines = input.split(separator: "\n", omittingEmptySubsequences: false).map { String($0) }
    let commands: [(count: Int, from: Int, to: Int)] = lines.map { line in
        let lineParts = line.split(separator: " ").map { String($0) }
        return (count: Int(lineParts[1])!, from: Int(lineParts[3])!, to: Int(lineParts[5])!)
    }
    do {
        var stacks = initialStacks
        for command in commands {
            let fromStack = command.from - 1
            let toStack = command.to - 1
            for _ in 0..<command.count {
                let item = stacks[fromStack].popLast()!
                stacks[toStack].append(item)
            }
        }
        let topItems = stacks.map { $0.last! }
        let topItemsJoined = topItems.reduce("") { $0 + String($1) }
        
        print("day5 part1 result: \(topItemsJoined)")
    }
    
    do {
        var stacks = initialStacks
        for command in commands {
            let fromStack = command.from - 1
            let toStack = command.to - 1
            let items = stacks[fromStack].suffix(command.count)
            stacks[fromStack].removeLast(command.count)
            stacks[toStack].append(contentsOf: items)
        }
        let topItems = stacks.map { $0.last! }
        let topItemsJoined = topItems.reduce("") { $0 + String($1) }
        
        print("day5 part2 result: \(topItemsJoined)")
    }
}
