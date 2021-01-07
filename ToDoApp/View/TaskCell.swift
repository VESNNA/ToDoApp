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
            dateLbl.text = ""
            locationLbl.text = ""
            backgroundColor  = #colorLiteral(red: 0.9230422456, green: 0.9230422456, blue: 0.9230422456, alpha: 1)
        } else {
            let dateString = dateFormatter.string(from: task.date)
            dateLbl.text = dateString
            let nonAttributedString = NSAttributedString(string: task.title, attributes: [:])
            self.titleLbl.attributedText = nonAttributedString
            self.locationLbl.text = task.location?.name
            backgroundColor = .white
        }
    }
}
