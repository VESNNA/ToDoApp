//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Nikita Vesna on 19.06.2020.
//  Copyright © 2020 Nikita Vesna. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    func configure(withTask task: Task) {
        self.titleLbl.text = task.title
        
        self.locationLbl.text = task.location?.name
        
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        
        if let date = task.date {
            let dateString = df.string(from: date)
            dateLbl.text = dateString
        }
    }
}
