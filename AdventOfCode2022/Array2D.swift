//
//  Array2D.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 12.12.22.
//

import Foundation

struct Array2D<T> {
    let width: Int
    let height: Int
    var values: [T]
    
    init(width: Int, height: Int, initialValue: T) {
        self.width = width
        self.height = height
        values = Array(repeating: initialValue, count: width * height)
    }
    
    func isIndexValid(x: Int, y: Int) -> Bool {
        x >= 0 && x < width && y >= 0 && y < height
    }
    
    func isIndexValid(_ gridPosition: GridPosition) -> Bool {
        isIndexValid(x: gridPosition.x, y: gridPosition.y)
    }
    
    subscript(x: Int, y: Int) -> T {
        get {
            assert(isIndexValid(x: x, y: y), "Invalid index")
            return values[y * width + x]
        }
        set {
            assert(isIndexValid(x: x, y: y), "Invalid index")
            values[y * width + x] = newValue
        }
    }
    
    subscript(_ gridPosition: GridPosition) -> T {
        get {
            self[gridPosition.x, gridPosition.y]
        }
        set {
            self[gridPosition.x, gridPosition.y] = newValue
        }
    }
}
