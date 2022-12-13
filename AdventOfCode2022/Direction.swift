//
//  Direction.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 12.12.22.
//

import Foundation

enum Direction: CaseIterable {
    case up, down, left, right
    
    var opposite: Direction {
        switch self {
        case .up: return .down
        case .down: return .up
        case .left: return .right
        case .right: return .left
        }
    }
}
