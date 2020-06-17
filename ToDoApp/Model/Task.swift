//
//  Task.swift
//  ToDoApp
//
//  Created by Nikita Vesna on 16.06.2020.
//  Copyright © 2020 Nikita Vesna. All rights reserved.
//

import Foundation

struct Task {
    let title: String
    let description: String?
    private(set) var date: Date?
    let location: Location?
    
    init(title: String,
         description: String? = nil,
         location: Location? = nil) {
        self.title = title
        self.description = description
        self.date = Date()
        self.location = location
    }
}

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        if lhs.title == rhs.title,
            lhs.description == rhs.description,
            lhs.location == rhs.location {
            return true
        }
        return false
    }
}
