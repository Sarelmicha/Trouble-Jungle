//
//  MenuController.swift
//  TroubleJungle
//
//  Created by user167401 on 5/19/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    
    @IBOutlet weak var menu_BTN_easy: UIButton!
    @IBOutlet weak var menu_BTN_hard: UIButton!
    @IBOutlet weak var menu_BTN_scores: UIButton!
    
    let EASY_MODE = "Easy"
    let HARD_MODE = "Hard"
    
    var difficult : String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onDifficultButtonPressed(_ sender: UIButton) {
        
        difficult = sender.titleLabel!.text
        
        self.performSegue(withIdentifier: "goToGamePage", sender: self)
        
    }
    
    
    @IBAction func onScoresButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToScoresPage", sender: self)
    }
    
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToGamePage"){
            let gamePage = segue.destination as! GameController
             //Set the game parameters
            if(difficult == EASY_MODE){
        
                gamePage.numOfRows = 3;
                gamePage.numOfCardsPerRow = 4;
            } else if (difficult == HARD_MODE){
                
                gamePage.numOfRows = 4;
                gamePage.numOfCardsPerRow = 4;
            }
        } else if(segue.identifier == "goToScoresPage"){
            _ = segue.destination as! ScoresController
            
        }
    }
}
