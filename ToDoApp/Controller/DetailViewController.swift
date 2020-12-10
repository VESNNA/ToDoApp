//
//  DetailViewController.swift
//  ToDoApp
//
//  Created by Nikita Vesna on 10.12.2020.
//  Copyright © 2020 Nikita Vesna. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var task: Task!
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.titleLbl.text = task.title
        self.descriptionLbl.text = task.description
        self.locationLbl.text = task.location?.name
        self.dateLbl.text = dateFormatter.string(from: task.date)
        
        if let coordinate = task.location?.coordinate {
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.region = region
        }
    }
}
