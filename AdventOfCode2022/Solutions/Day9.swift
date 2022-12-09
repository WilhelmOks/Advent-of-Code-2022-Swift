//
//  Day9.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 09.12.22.
//

import Foundation

fileprivate struct GridPosition: Hashable {
    let x: Int
    let y: Int
    
    func moving(direction: Direction) -> Self {
        switch direction {
        case .up:       return .init(x: x, y: y - 1)
        case .down:     return .init(x: x, y: y + 1)
        case .left:     return .init(x: x - 1, y: y)
        case .right:    return .init(x: x + 1, y: y)
        }
    }
    
    func moving(towards: GridPosition) -> Self {
        if abs(self.x - towards.x) <= 1 && abs(self.y - towards.y) <= 1 {
            // Close enough. Doesn't need to move.
            return self
        }
        
        // delta vector
        let dx = towards.x - self.x
        let dy = towards.y - self.y
        
        // movement limited to a distance of 1
        let mx = dx < 0 ? -1 : dx > 0 ? 1 : 0
        let my = dy < 0 ? -1 : dy > 0 ? 1 : 0
        
        return .init(x: x + mx, y: y + my)
    }
}

fileprivate enum Direction {
    case up, down, left, right
    
    init?(from: String) {
        switch from {
        case "U": self = .up
        case "D": self = .down
        case "L": self = .left
        case "R": self = .right
        default: return nil
        }
    }
}
    
fileprivate struct Command {
    let direction: Direction
    let distance: Int
}

fileprivate func print(head: GridPosition, tails: [GridPosition], gridStart: GridPosition, gridEnd: GridPosition) {
    for y in gridStart.y...gridEnd.y {
        for x in gridStart.x...gridEnd.x {
            let position = GridPosition(x: x, y: y)
            if position == head {
                print("H", terminator: "")
            } else if let index = tails.firstIndex(where: { $0 == position }) {
                print("\(index + 1)", terminator: "")
            } else {
                print(".", terminator: "")
            }
        }
        print()
    }
}

fileprivate func printForExample2(head: GridPosition, tails: [GridPosition]) {
    print(head: head, tails: tails, gridStart: .init(x: -11, y: -15), gridEnd: .init(x: 14, y: 5))
}

func day9() {
    let lines = input9.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
    let commands = lines.map { line in
        let parts = line.split(separator: " ").map(String.init)
        let direction = Direction(from: parts[0])!
        let distance = Int(parts[1])!
        return Command(direction: direction, distance: distance)
    }
    
    var head = GridPosition(x: 0, y: 0)
    var tail = GridPosition(x: 0, y: 0)
    
    var tailPositions: Set<GridPosition> = .init([tail])

    for command in commands {
        for _ in 0..<command.distance {
            head = head.moving(direction: command.direction)
            tail = tail.moving(towards: head)
            tailPositions.insert(tail)
        }
    }
    
    print("day9 part1 result: \(tailPositions.count)") //6044
    
    head = GridPosition(x: 0, y: 0)
    let numberOfTails = 9
    var tails = Array(repeating: GridPosition(x: 0, y: 0), count: numberOfTails)
    var longTailPositions: Set<GridPosition> = .init([tails.last!])

    for command in commands {
        for _ in 0..<command.distance {
            head = head.moving(direction: command.direction)
            for tailIndex in tails.indices {
                let tail = tails[tailIndex]
                let target = tailIndex == 0 ? head : tails[tailIndex - 1]
                tails[tailIndex] = tail.moving(towards: target)
                if tailIndex == numberOfTails - 1 {
                    longTailPositions.insert(tail)
                }
            }
        }
        //printForExample2(head: head, tails: tails)
        //print()
    }
    
    print("day9 part2 result: \(longTailPositions.count)") //2384
}
