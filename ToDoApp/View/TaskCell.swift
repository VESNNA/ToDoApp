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
    
    private var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
    func configure(withTask task: Task, done: Bool = false) {
        
        if done {
            let attributedString = NSAttributedString(string: task.title, attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
            titleLbl.attributedText = attributedString
            dateLbl = nil
            locationLbl = nil
        } else {
            if let date = task.date {
                let dateString = dateFormatter.string(from: date)
                dateLbl.text = dateString
            }
            self.titleLbl.text = task.title
            self.locationLbl.text = task.location?.name
        }
    }
}
