//
//  Day6.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 06.12.22.
//

import Foundation

private func position(forMarkerLength markerLength: Int) -> Int {
    let input = input6
    var currentIndex = input.startIndex
    let endIndex = input.endIndex
    var processedCharacters = markerLength
    repeat {
        guard let substringEndIndex = input.index(currentIndex, offsetBy: markerLength, limitedBy: endIndex) else {
            fatalError("failed to make index")
        }
        let substring = input[currentIndex..<substringEndIndex]
        assert(substring.count <= markerLength)
        if substring.count == markerLength {
            let allUnique = Set(substring).count == markerLength
            if allUnique {
                return processedCharacters
            }
        }
        processedCharacters += 1
        currentIndex = input.index(currentIndex, offsetBy: 1)
    } while currentIndex < endIndex
    fatalError("nothing found")
}

func day6() {
    let part1 = position(forMarkerLength: 4)
    let part2 = position(forMarkerLength: 14)

    print("day6 part1 result: \(part1)") //1658
    print("day6 part2 result: \(part2)") //2260
}
