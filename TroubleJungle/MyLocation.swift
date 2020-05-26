//
//  MyLocation.swift
//  TroubleJungle
//
//  Created by user167401 on 5/26/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation


class MyLocation : Codable {
    
    var lat : Double?
    var lng : Double?
    
    init(lat : Double, lng : Double) {
        
        self.lat = lat
        self.lng = lng
    }
    
    
}
