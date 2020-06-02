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
    let MAX_NAME_LENGTH : Int = 10
    var difficult : String!
    var name : String!
    var myLocation : MyLocation!
    
    @IBOutlet weak var name_TEXTFIELD_nameHolder: UITextField!
    @IBOutlet weak var name_BTN_readyButton: UIButton!
    
    @IBOutlet weak var name_BTN_back: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func onReadyButtonPressed(_ sender: UIButton) {
        
        name = name_TEXTFIELD_nameHolder.text
        if(name.isEmpty){
            name = "Player"
        } else if(name.count > MAX_NAME_LENGTH){
            name = String(name.prefix(MAX_NAME_LENGTH))
        }
        
          self.performSegue(withIdentifier: "goToGamePage", sender: self)
        
    }
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
                
       if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
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
            gamePage.myLocation = myLocation
            
        }
        
    }
    
    
}
