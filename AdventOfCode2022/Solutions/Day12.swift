//
//  Day12.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 12.12.22.
//

import Foundation

fileprivate func elevationFrom(_ from: String.Element) -> Int {
    Int(from.asciiValue!) - 97
}

/*fileprivate class PathStep {
    let position: GridPosition
    var directions: [Direction]
    var parent: PathStep?
    var children: [PathStep]
    var isEnd: Bool = false
    var leadsToEnd: Bool = false
    
    init(position: GridPosition, directions: [Direction], parent: PathStep?, children: [PathStep]) {
        self.position = position
        self.directions = directions
        self.parent = parent
        self.children = children
    }
    
    var parentPositions: [GridPosition] {
        if let parent {
            return [position] + parent.parentPositions
        } else {
            return [position]
        }
    }
    
    var flatSteps: [PathStep] {
        [self] + children.flatMap { $0.flatSteps }
    }
}*/

fileprivate class PathStep {
    let position: GridPosition
    var parent: PathStep?
    var child: PathStep?
    
    init(position: GridPosition, parent: PathStep?, child: PathStep?) {
        self.position = position
        self.parent = parent
        self.child = child
    }
    
    var parentPositions: [GridPosition] {
        if let parent {
            return [position] + parent.parentPositions
        } else {
            return [position]
        }
    }
    
    var flatSteps: [PathStep] {
        [self] + (child.flatMap { $0.flatSteps } ?? [])
    }
}

fileprivate func printGrid(width: Int, height: Int, positions: [GridPosition]) {
    var output = ""
    for y in 0..<height {
        for x in 0..<width {
            output += positions.contains(.init(x: x, y: y)) ? "#" : "."
        }
        output += "\n"
    }
    print(output)
}

fileprivate func printGrid(width: Int, height: Int, directions: [(GridPosition, Direction?)]) {
    var output = ""
    for y in 0..<height {
        for x in 0..<width {
            let found = directions.first { $0.0 == .init(x: x, y: y) }?.1
            switch found {
            case .left: output += "<"
            case .right: output += ">"
            case .up: output += "^"
            case .down: output += "v"
            case nil: output += "."
            }
        }
        output += "\n"
    }
    print(output)
}

extension Array where Element == Direction {
    mutating func popClosest(from: GridPosition, to: GridPosition) -> Direction? {
        let dx = to.x - from.x
        let dy = to.y - from.y
        let priorities: [(Direction, Int)] = [(.right, dx), (.left, -dx), (.down, dy), (.up, -dy)].sorted { $0.1 > $1.1 }
        let picked = priorities.first { priority in self.contains(priority.0) }?.0
        if let picked {
            self.removeAll { $0 == picked }
            return picked
        } else {
            return nil
        }
    }
}

/*
fileprivate func constructPath(start: GridPosition, end: GridPosition, directionsMap: Array2D<[Direction]>) -> PathStep {
    let path = PathStep(position: start, directions: directionsMap[start], parent: nil, children: [])
    var currentStep = path
    
    /*var deadEnds: [Direction: Array2D<Bool>] = [
        .left:  Array2D(width: directionsMap.width, height: directionsMap.height, initialValue: false),
        .right: Array2D(width: directionsMap.width, height: directionsMap.height, initialValue: false),
        .up:    Array2D(width: directionsMap.width, height: directionsMap.height, initialValue: false),
        .down:  Array2D(width: directionsMap.width, height: directionsMap.height, initialValue: false),
    ]*/
    var deadEnds = Array2D(width: directionsMap.width, height: directionsMap.height, initialValue: false)
    
    //var deadEndsFound = 0
    //var deadEndsSkipped = 0

    while true {
        if let direction = currentStep.directions.popClosest(from: currentStep.position, to: end) {
            //printGrid(width: directionsMap.width, height: directionsMap.height, positions: currentStep.parentPositions)
            
            let nextPosition = currentStep.position.moving(direction: direction)
            
            //if deadEnds[direction]![nextPosition] {
            if deadEnds[nextPosition] {
                //deadEndsSkipped += 1
                continue
            }
            
            let absoluteDirections = directionsMap[nextPosition]
            var directions = absoluteDirections
            directions.removeAll { dir in
                currentStep.parentPositions.contains(nextPosition.moving(direction: dir))
            }
            
            let childStep = PathStep(position: nextPosition, directions: directions, parent: currentStep, children: [])
            currentStep.children.append(childStep)
                        
            currentStep = childStep
            
            if currentStep.position == end {
                currentStep.isEnd = true
                currentStep = currentStep.parent!
                currentStep.leadsToEnd = true
            } else {
                if currentStep.directions.isEmpty {
                    //deadEnds[direction]![currentStep.position] = true
                    deadEnds[currentStep.position] = true
                    //deadEndsFound += 1
                }
            }
        } else {
            if let parent = currentStep.parent {
                if currentStep.leadsToEnd || currentStep.isEnd {
                    parent.leadsToEnd = true
                } else {
                    if parent.directions.isEmpty {
                        /*if let direction = parent.position.direction(to: currentStep.position) {
                            deadEnds[direction]![parent.position] = true
                        }*/
                        deadEnds[parent.position] = true
                    }
                }
                currentStep = parent
                currentStep.children.removeAll { !$0.leadsToEnd && !$0.isEnd }
            } else {
                return path
            }
        }
    }
}*/

fileprivate func constructPath(start: GridPosition, end: GridPosition, directionsMap: Array2D<[Direction]>) -> PathStep {
    let path = PathStep(position: start, parent: nil, child: nil)
    var currentStep = path
    
    var checked = Array2D(width: directionsMap.width, height: directionsMap.height, initialValue: false)
    checked[start] = true
    
    while true {
        //printGrid(width: directionsMap.width, height: directionsMap.height, positions: currentStep.parentPositions)
        //printGrid(width: directionsMap.width, height: directionsMap.height, directions: path.flatSteps.map { ($0.position, $0.position.direction(to: $0.child?.position)) })
        
        var directions = directionsMap[currentStep.position]
        directions.removeAll { direction in
            checked[currentStep.position.moving(direction: direction)]
        }
        
        /*let loopCandidates = Direction.allCases.map { (currentStep.position.moving(direction: $0), $0) }
        let foundLoopCandidate = loopCandidates.first { (pos, dir) in checked[pos] && directionsMap[pos].contains(dir.opposite) }
        if let foundLoopCandidate {
            repeat {
                checked[currentStep.position] = false
                currentStep = currentStep.parent!
                currentStep.child = nil
            } while currentStep.position != foundLoopCandidate.0
        }*/
        
        if let direction = directions.popClosest(from: currentStep.position, to: end) {
            let newPosition = currentStep.position.moving(direction: direction)
            
            if checked[newPosition] {
                repeat {
                    currentStep = currentStep.parent!
                    currentStep.child = nil
                } while currentStep.position != newPosition
            } else {
                let nextStep = PathStep(position: newPosition, parent: currentStep, child: nil)
                currentStep.child = nextStep
                currentStep = nextStep
                checked[currentStep.position] = true
                if currentStep.position == end {
                    return path
                }
            }
        } else {
            currentStep = currentStep.parent!
            currentStep.child = nil
        }
    }
}

func day12() {
    let lines = input12.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
    
    let width = lines.first!.count
    let height = lines.count
    var elevationMap = Array2D(width: width, height: height, initialValue: 0)
    
    var start: GridPosition!
    var end: GridPosition!

    for y in 0..<height {
        let line = Array(lines[y])
        for x in 0..<width {
            let rawElevation = line[x]
            let elevation: Int
            if rawElevation == "S" {
                start = .init(x: x, y: y)
                elevation = elevationFrom("a")
            } else if rawElevation == "E" {
                end = .init(x: x, y: y)
                elevation = elevationFrom("z")
            } else {
                elevation = elevationFrom(rawElevation)
            }
            elevationMap[x, y] = elevation
        }
    }
    
    var directionsMap = Array2D<[Direction]>(width: width, height: height, initialValue: [])
    
    for y in 0..<height {
        for x in 0..<width {
            let position = GridPosition(x: x, y: y)
            let elevation = elevationMap[x, y]
            for direction in Direction.allCases {
                let newPosition = position.moving(direction: direction)
                if elevationMap.isIndexValid(newPosition) {
                    let newElevation = elevationMap[newPosition]
                    let stepIsPossible = newElevation - 1 <= elevation
                    if stepIsPossible {
                        directionsMap[position].append(direction)
                    }
                }
            }
        }
    }
    
    let path = constructPath(start: start!, end: end!, directionsMap: directionsMap)
    
    //let minNumberOfSteps = path.flatSteps.filter { $0.isEnd }.map { $0.parentPositions.count - 1 }.min()!
    //let path =
    
    printGrid(width: directionsMap.width, height: directionsMap.height, directions: path.flatSteps.map { ($0.position, $0.position.direction(to: $0.child?.position)) })
    
    print("day12 part1 result: \(path.flatSteps.count - 1)") //718 too high, 704 too high
    //print("day12 part2 result: \(aaa)")
}
