//
//  Day7.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 07.12.22.
//

import Foundation

fileprivate enum FileSystemEntry {
    case directory(name: String, contents: [EntryRef])
    case file(name: String, size: Int)
}

/// class wrapper for FileSystemEntry to get reference semantics
fileprivate class EntryRef {
    var entry: FileSystemEntry
    
    init(_ entry: FileSystemEntry) {
        self.entry = entry
    }
}

fileprivate extension Collection where Element == EntryRef {
    func directory(named: String) -> Element? {
        self.first { entry in
            switch entry.entry {
            case .file(name: _, size: _):
                return false
            case .directory(name: let name, contents: _):
                return name == named
            }
        }
    }
    
    func containsEntry(_ entry: Element) -> Bool {
        self.contains { element in
            switch (entry.entry, element.entry) {
            case (.directory(name: let entryName, contents: _), .directory(name: let elementName, contents: _)) where entryName == elementName:
                return true
            case (.file(name: let entryName, size: _), .file(name: let elementName, size: _)) where entryName == elementName:
                return true
            default:
                return false
            }
        }
    }
}

fileprivate class TreeEntry {
    var entry: EntryRef
    let parent: TreeEntry?
    
    init(entry: EntryRef, parent: TreeEntry?) {
        self.entry = entry
        self.parent = parent
    }
    
    func changingDirectory(_ directoryName: String) -> TreeEntry {
        switch entry.entry {
        case .directory(name: _, contents: let contents):
            if let existing = contents.directory(named: directoryName) {
                return .init(entry: existing, parent: self)
            } else {
                return .init(entry: .init(.directory(name: directoryName, contents: [])), parent: self)
            }
        case .file(name: _, size: _):
            fatalError("tried to change directory from a file")
        }
    }
    
    func add(subEntry: EntryRef) {
        switch entry.entry {
        case .directory(name: let selfName, contents: let contents):
            if !contents.containsEntry(subEntry) {
                entry.entry = .directory(name: selfName, contents: contents + [subEntry])
            }
        case .file(name: _, size: _):
            fatalError("tried to add an entry to a file")
        }
    }
}

fileprivate enum Command {
    case cd(directory: String)
    case cdParent
    case cdRoot
    case ls
}

fileprivate func parseEntry(_ line: String) -> FileSystemEntry {
    let parts = line.split(separator: " ").map(String.init)
    if parts[0] == "dir" {
        return .directory(name: parts[1], contents: [])
    } else {
        return .file(name: parts[1], size: Int(parts[0]) ?? 0)
    }
}

fileprivate func parseCommand(_ line: String) -> Command {
    let parts = line.split(separator: " ").map(String.init)
    if parts[1] == "cd" {
        if parts[2] == ".." {
            return .cdParent
        } else if parts[2] == "/" {
            return .cdRoot
        } else {
            return .cd(directory: parts[2])
        }
    } else if parts[1] == "ls" {
        return .ls
    } else {
        fatalError("invalid command")
    }
}

fileprivate func isCommand(_ line: String) -> Bool {
    line.split(separator: " ").first == "$"
}

func day7() {
    let lines = input7.split(separator: "\n", omittingEmptySubsequences: false).map { String($0) }
    
    let root = TreeEntry(entry: .init(.directory(name: "/", contents: [])), parent: nil)
    var currentTreeEntry = root
    
    for line in lines {
        if isCommand(line) {
            let command = parseCommand(line)
            switch command {
            case .cdRoot:
                currentTreeEntry = root
            case .cdParent:
                if let parent = currentTreeEntry.parent {
                    currentTreeEntry = parent
                }
            case .cd(directory: let directoryName):
                currentTreeEntry = currentTreeEntry.changingDirectory(directoryName)
            case .ls:
                break
            }
        } else {
            let entry = parseEntry(line)
            currentTreeEntry.add(subEntry: .init(entry))
        }
    }
    
    print(root)
}
