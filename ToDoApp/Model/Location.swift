//
//  Location.swift
//  ToDoApp
//
//  Created by Nikita Vesna on 16.06.2020.
//  Copyright © 2020 Nikita Vesna. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
    
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        guard rhs.coordinate?.latitude == lhs.coordinate?.latitude && rhs.coordinate?.longitude == lhs.coordinate?.longitude && rhs.name == rhs.name else { return false }
        return true
    }
}
