//
//  NameController.swift
//  TroubleJungle
//
//  Created by user167401 on 5/26/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class NameController: UIViewController {
    
    let EASY_MODE = "Easy"
    let HARD_MODE = "Hard"
    var difficult : String!
    var name : String!
    
    @IBOutlet weak var name_TEXTFIELD_nameHolder: UITextField!
    @IBOutlet weak var name_BTN_readyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func onReadyButtonPressed(_ sender: UIButton) {
        
        name = name_TEXTFIELD_nameHolder.text
        if(name?.count == 0){
            name = "Player"
        }
        
          self.performSegue(withIdentifier: "goToGamePage", sender: self)
        
        
    }
    
    
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Set the game parameters
        if(segue.identifier == "goToGamePage"){
            
            let gamePage = segue.destination as! GameController
            if(difficult == EASY_MODE){
                
                gamePage.numOfRows = 3;
                gamePage.numOfCardsPerRow = 4;
            } else if (difficult == HARD_MODE){
                
                gamePage.numOfRows = 4;
                gamePage.numOfCardsPerRow = 4;
            }
            
            gamePage.name = name
            
        }
        
    }
    
    
}
