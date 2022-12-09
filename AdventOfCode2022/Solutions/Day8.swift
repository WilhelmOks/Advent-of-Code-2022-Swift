//
//  Day8.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 08.12.22.
//

import Foundation

fileprivate struct Array2D<T> {
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
}

fileprivate func checkVisible(treeSizes: Array2D<Int>, x: Int, y: Int, directionX: Int, directionY: Int) -> Bool {
    let checkingSize = treeSizes[x, y]
    var x = x + directionX
    var y = y + directionY
    while treeSizes.isIndexValid(x: x, y: y) {
        if treeSizes[x, y] >= checkingSize {
            return false
        }
        x += directionX
        y += directionY
    }
    return true
}

fileprivate func visibleTrees(treeSizes: Array2D<Int>, x: Int, y: Int, directionX: Int, directionY: Int) -> Int {
    let checkingSize = treeSizes[x, y]
    var x = x + directionX
    var y = y + directionY
    var count = 0
    while treeSizes.isIndexValid(x: x, y: y) {
        count += 1
        if treeSizes[x, y] >= checkingSize {
            return count
        }
        x += directionX
        y += directionY
    }
    return count
}

func day8() {
    let lines = input8.split(separator: "\n", omittingEmptySubsequences: false).map { String($0) }
    
    let width = lines.first!.count
    let height = lines.count
    
    var treeSizes = Array2D(width: width, height: height, initialValue: -1)
    
    for (y, line) in lines.enumerated() {
        for (x, rawSize) in line.enumerated() {
            let treeSize = Int(String(rawSize))!
            treeSizes[x, y] = treeSize
        }
    }
    
    let directions: [(x: Int, y: Int)] = [(1,0), (-1,0), (0,1), (0,-1)]
    
    var numberOfVisibleTrees = 0
    
    for y in 0..<height {
        for x in 0..<width {
            for direction in directions {
                let visible = checkVisible(treeSizes: treeSizes, x: x, y: y, directionX: direction.x, directionY: direction.y)
                if visible {
                    numberOfVisibleTrees += 1
                    break
                }
            }
        }
    }
    
    var maxScenicScore = 0
    
    for y in 0..<height {
        for x in 0..<width {
            let scores = directions.map { direction in
                visibleTrees(treeSizes: treeSizes, x: x, y: y, directionX: direction.x, directionY: direction.y)
            }
            let scenicScore = scores.reduce(1) { $0 * $1 }
            if scenicScore > maxScenicScore {
                maxScenicScore = scenicScore
            }
        }
    }
    
    print("day8 part1 result: \(numberOfVisibleTrees)") //1820
    print("day8 part2 result: \(maxScenicScore)") //385112
}
