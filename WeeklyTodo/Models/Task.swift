//
//  Task.swift
//  WeeklyTodo
//
//  Created by Audrey Patricia on 13/10/2024.
//

import SwiftUI
import UniformTypeIdentifiers

struct Task: Codable, Transferable {
    var id: UUID = .init()
    let title: String
    let note: String
    var isDone: Bool
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .task)
    }
}

extension UTType {
    static let task = UTType(exportedAs: "personal.com.WeeklyTodo")
}
