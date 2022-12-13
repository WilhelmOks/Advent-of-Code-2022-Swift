//
//  GridPosition.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 12.12.22.
//

import Foundation

struct GridPosition: Hashable {
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
    
    func direction(to: GridPosition?) -> Direction? {
        guard let to else { return nil }
        
        let dx = to.x - x
        let dy = to.y - y
        
        switch (dx, dy) {
        case (1, 0): return .right
        case (-1, 0): return .left
        case (0, 1): return .down
        case (0, -1): return .up
        default: return nil
        }
    }
}
