//
//  HighScore.swift
//  TroubleJungle
//
//  Created by user167401 on 5/24/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation
import UIKit

class HighScore : Codable{ 
    
    var name : String
    var time : Int
    var location : MyLocation

    
    init(name : String, time : Int, location: MyLocation) {
        
        self.name = name
        self.time = time
        self.location = location
        
    }
    
}
