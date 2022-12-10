//
//  Day10.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 10.12.22.
//

import Foundation

fileprivate enum Command: Hashable {
    case noop
    case addx(Int)
    case filler //to pad the addx command to two cycles
}

func day10() {
    let lines = input10.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
    let commands = lines.map { line in
        let parts = line.split(separator: " ")
        if parts[0] == "noop" {
            return Command.noop
        } else {
            return Command.addx(Int(parts[1])!)
        }
    }
    let commandsWithFillers = commands.flatMap { $0 == .noop ? [$0] : [.filler, $0] }
    
    let markers: [Int] = [20, 60, 100, 140, 180, 220]
    let lastMarkerCycle = markers.last!
    
    var register = 1
    
    var signalStrengths: [Int] = []

    for cycle in 1...lastMarkerCycle {
        if markers.contains(cycle) {
            signalStrengths.append(cycle * register)
        }
        let command = commandsWithFillers[cycle - 1]
        switch command {
        case .addx(let value):
            register += value
        default:
            break
        }
    }
    
    let sumOfSignalStrengths = signalStrengths.reduce(0) { $0 + $1 }

    print("day10 part1 result: \(sumOfSignalStrengths)") //13440
    
    let screenWidth = 40
    let screenHeight = 6
    
    register = 1
    
    var screenOutput = ""
    
    for cycle in 1...(screenWidth * screenHeight) {
        let horizontalPosition = (cycle - 1) % screenWidth
        let visible = abs(horizontalPosition - register) <= 1
        screenOutput += visible ? "#" : "."
        if cycle % screenWidth == 0 {
            screenOutput += "\n"
        }
        let command = commandsWithFillers[cycle - 1]
        switch command {
        case .addx(let value):
            register += value
        default:
            break
        }
    }
    
    print("day10 part2 result: \n\(screenOutput)") //PBZGRAZA
}
