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
    @IBOutlet weak var scores_BTN_back: UIButton!
    
    
    var animalsImages = [#imageLiteral(resourceName: "crocodile"),#imageLiteral(resourceName: "zebra"),#imageLiteral(resourceName: "sloth"),#imageLiteral(resourceName: "tiger"),#imageLiteral(resourceName: "gorilla"),#imageLiteral(resourceName: "monkey"),#imageLiteral(resourceName: "frog"),#imageLiteral(resourceName: "beatle")]
    var highScores : [HighScore]!
    let cellReuseIdentifier = "score_cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Read from local storage the highscores
        highScores = MyLocalStorage.getDataFromLocalStorage()
        setupList()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        
        print("im here!");
        
       if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
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
        
        cell?.cell_LBL_score?.text = String(self.highScores[indexPath.row].time)
        cell?.cell_LBL_name?.text = String(self.highScores[indexPath.row].name).lowercased()
        cell?.cell_LBL_date.text = "\(self.highScores[indexPath.row].date)"
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

