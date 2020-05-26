//
//  Converter.swift
//  TroubleJungle
//
//  Created by user167401 on 5/26/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import Foundation

class Converter {
    
    
    static func fromJsonToHighScoreList(highScoreJson: String) ->[HighScore]{
        
        
        let decoder = JSONDecoder()
        let data = Data(highScoreJson.utf8)
        do {
            return try decoder.decode([HighScore].self, from: data)
            
        } catch {
            print("somthing went wrong in fromJsonToHighScoreList")
        }
        
        return [HighScore]()
        
    }
    
    static func fromHighScoreListToJson(highScores : [HighScore]) -> String{
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(highScores)
        let highScoresJson: String = String(data: data, encoding: .utf8)!
        
        return highScoresJson
        
    }
    
    
}
