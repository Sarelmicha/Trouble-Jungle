//
//  GameOverController.swift
//  TroubleJungle
//
//  Created by user167401 on 5/19/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class GameOverController: UIViewController {
    
    
    @IBOutlet weak var gameover_BTN_newGame: UIButton!
    @IBOutlet weak var gameover_BTN_restart: UIButton!
    
    @IBOutlet weak var gameover_LBL_moves: UILabel!
    @IBOutlet weak var gameover_LBL_time: UILabel!
    
    let RESTART : String = "Restart"
    let NEW_GAME : String = "New Game"
    
    
    var moves : Int!
    var time : Int!
    var lastGameNumOfRows: Int!;
    var lastGameNumOfCardsPerRow: Int!;
    var chosenOption : String!
    var timerHelper : TimerHelper!
    var name : String!
    var myLocation : MyLocation!
    var highScores = [HighScore]()
    var userHighScore : HighScore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerHelper = TimerHelper()
        gameover_LBL_time.text = timerHelper.convertTimeToMinutesAndSeconds(timePassed: time)
        gameover_LBL_moves.text = (String(moves))
        highScores = MyLocalStorage.getDataFromLocalStorage()
        insertNewHighScoreToHighScores()
        MyLocalStorage.saveHighScoresInLocalStorage(highScores: highScores)
       
        
        
        
    }
    
    @IBAction func onOptionButtonPressed(_ sender: UIButton) {
        
        chosenOption = sender.titleLabel!.text!
        if(chosenOption == RESTART){
            self.performSegue(withIdentifier: "goToGamePage", sender: self)
        } else if(chosenOption == NEW_GAME){
            self.performSegue(withIdentifier: "goToMenuPage", sender: self)
        }
    }
    
    
    func insertNewHighScoreToHighScores(){
        
        if(highScores.isEmpty){
            highScores.append(userHighScore)
            return
        }
        
        insertToListByTime()
        
        if(highScores.count > 10){
            //DELETE the 11 highscore
            highScores.remove(at: highScores.count - 1)
        }
        
    }
    
    func insertToListByTime(){
        for i in  0 ..< highScores.count {
            if(userHighScore.time < highScores[i].time){
                highScores.insert(userHighScore, at: i)            }
        }
    }
    
    
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "goToGamePage"){
            print("here man!")
            let gamePage = segue.destination as! GameController
            gamePage.numOfRows = lastGameNumOfRows
            gamePage.numOfCardsPerRow = lastGameNumOfCardsPerRow
            
            
        } else if(segue.identifier == "goToMenuPage"){
            _ = segue.destination as! MenuController
        }
        
    }
    
}
