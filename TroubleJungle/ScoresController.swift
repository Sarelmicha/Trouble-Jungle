//
//  ScoresController.swift
//  TroubleJungle
//
//  Created by user167401 on 5/21/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit

class ScoresController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var scores_LST_scores: UITableView!
    
    var animalsImages = [#imageLiteral(resourceName: "crocodile"),#imageLiteral(resourceName: "zebra"),#imageLiteral(resourceName: "sloth"),#imageLiteral(resourceName: "tiger"),#imageLiteral(resourceName: "gorilla"),#imageLiteral(resourceName: "monkey"),#imageLiteral(resourceName: "frog"),#imageLiteral(resourceName: "beatle")]

    
    var highScores = [HighScore(name: "Sarel",score : 500),
                      HighScore(name: "Mor",score : 450),
                      HighScore(name: "Hod",score : 300),
                      HighScore(name: "Eli",score : 300),
                      HighScore(name: "Shai",score : 280),
                      HighScore(name: "Noa",score : 250),
                      HighScore(name: "Kepler",score : 250),
                      HighScore(name: "Sarel",score : 220),
                      HighScore(name: "Asaf",score : 200),
                      HighScore(name: "Guy",score : 190),
                      HighScore(name: "Shemsh",score : 100),
                      HighScore(name: "Ori",score : 60),
                      HighScore(name: "Klopper",score : 30),
                      HighScore(name: "Hydi",score : 20),
                      
    ]
    
    
    
  
    
    let cellReuseIdentifier = "score_cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupList()
        
        // Do any additional setup after loading the view.
    }
    
    func setupList(){
        
        scores_LST_scores.delegate = self
        scores_LST_scores.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.highScores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : MyCustomCell? = self.scores_LST_scores.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? MyCustomCell
        
        cell?.cell_LBL_score?.text = String(self.highScores[indexPath.row].score)
        cell?.cell_LBL_name?.text = String(self.highScores[indexPath.row].name)
        cell?.cell_IMG_scoreImage?.image = animalsImages[indexPath.row % animalsImages.count]
        
        
        if(cell == nil){
            cell = MyCustomCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellReuseIdentifier)
        }
        
        return cell!
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

