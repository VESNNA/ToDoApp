//
//  NewTaskViewController.swift
//  ToDoApp
//
//  Created by Nikita Vesna on 13.12.2020.
//  Copyright © 2020 Nikita Vesna. All rights reserved.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {
    
    var taskManager: TaskManager!
    var geocoder = CLGeocoder()
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var saveBtn: UIButton!
    @IBOutlet var cancelBtn: UIButton!
    
    @IBAction func save () {
        let titleString = titleTextField.text
        let locationString = locationTextField.text
        let dateString = df.date(from: dateTextField.text!) //Unsecure
        let descriprionString = descriptionTextField.text
        let addressString = addressTextField.text
        
        geocoder.geocodeAddressString(addressString!) { [unowned self] (placemarks, error) in
            let placemark = placemarks?.first
            let coordinate = placemark?.location?.coordinate
            let location = Location(name: locationString!, coordinate: coordinate)
            
            let task = Task(title: titleString!, description: descriprionString, date: dateString, location: location)
            self.taskManager.add(task: task)
        }
        dismiss(animated: true, completion: nil)
    }
    
    var df: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
}
