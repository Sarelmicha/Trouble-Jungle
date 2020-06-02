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
    var date : Date

    
    init(name : String, time : Int, location: MyLocation,date : Date) {
        
        self.name = name
        self.time = time
        self.location = location
        self.date = date
        
    }
    
}
