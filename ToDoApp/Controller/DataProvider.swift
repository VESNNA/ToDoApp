//
//  DataProvider.swift
//  ToDoApp
//
//  Created by Nikita Vesna on 17.06.2020.
//  Copyright © 2020 Nikita Vesna. All rights reserved.
//

import UIKit

enum Section: Int {
    case todo
    case done
}
    
    
class DataProvider: NSObject {
    var taskManager = TaskManager()
}

extension DataProvider: UITableViewDelegate {
    
}

extension DataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = Section(rawValue: section) else
            { fatalError() }
        
        switch section {
        case .todo: return taskManager.tasksCount
        case .done: return taskManager.doneTasksCount
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: indexPath) as! TaskCell
        return TaskCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    
}
