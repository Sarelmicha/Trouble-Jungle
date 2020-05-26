//
//  MyLocalStorage.swift
//  TroubleJungle
//
//  Created by user167401 on 5/26/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation

class MyLocalStorage {
    
    static let HIGH_SCORES_KEY = "HIGH_SCORES"
    
    static func getDataFromLocalStorage() -> [HighScore]{
        
        //load the data from local storage and convert it the list of HighScore
        
        let highScoresJson = UserDefaults.standard.string(forKey: HIGH_SCORES_KEY)
        print("highsocres : \(highScoresJson)")
        
        if let safeHighScoresJson = highScoresJson {
            return Converter.fromJsonToHighScoreList(highScoreJson: safeHighScoresJson)
        }
        
        return [HighScore]()
    }
    
    static func saveHighScoresInLocalStorage(highScores : [HighScore]) {
    
        let highScoresJson: String = Converter.fromHighScoreListToJson(highScores: highScores)
        UserDefaults.standard.set(highScoresJson, forKey: HIGH_SCORES_KEY)
    }
    
    
}
