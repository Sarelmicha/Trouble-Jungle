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
        
        self.performSegue(withIdentifier: "goToNamePage", sender: self)
        
    }
    
    
    @IBAction func onScoresButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToScoresPage", sender: self)
    }
    
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToNamePage"){
            let namePage = segue.destination as! NameController
            namePage.difficult = difficult
            
        } else if(segue.identifier == "goToScoresPage"){
            _ = segue.destination as! ScoresController
            
        }
    }
}
