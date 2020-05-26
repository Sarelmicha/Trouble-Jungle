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
    
    var RESTART : String = "Restart"
    var NEW_GAME : String = "New Game"
    
    var moves : Int!
    var time : Int!
    var lastGameNumOfRows: Int!;
    var lastGameNumOfCardsPerRow: Int!;
    var chosenOption : String!
    var timerHelper : TimerHelper!
    var name : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerHelper = TimerHelper()
        gameover_LBL_time.text = timerHelper.convertTimeToMinutesAndSeconds(timePassed: time)
        gameover_LBL_moves.text = (String(moves))

    }
    
    @IBAction func onOptionButtonPressed(_ sender: UIButton) {
        
        chosenOption = sender.titleLabel!.text!
        if(chosenOption == RESTART){
        self.performSegue(withIdentifier: "goToGamePage", sender: self)
        } else if(chosenOption == NEW_GAME){
            self.performSegue(withIdentifier: "goToMenuPage", sender: self)
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
