//
//  TimerHelper.swift
//  TroubleJungle
//
//  Created by user167401 on 5/26/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation

class TimerHelper {
    
    var minutes : Int = 0
    var seconds : Int = 0
    var minutesText : String = "0"
    var secondsText : String = "0"
    
    
    func convertTimeToMinutesAndSeconds(timePassed: Int) -> String{
        
        
        //Calucalte minutes and seconds
        minutes = timePassed / 60
        if(timePassed >= 60){
            seconds = timePassed - minutes * 60
        } else {
            seconds = timePassed
        }
        
        
        
        //Show zero before seconds/minutes if less than 10
        if(seconds < 10){
            secondsText = "0\(seconds)"
        } else {
            secondsText = "\(seconds)"
        }
        
        if(minutes < 10){
            minutesText = "0\(minutes)"
        } else {
            minutesText = "\(minutes)"
        }
            
        //Set text on screen
        return "\(minutesText) : \(secondsText)"
        
        
    }
    
    
    
}
