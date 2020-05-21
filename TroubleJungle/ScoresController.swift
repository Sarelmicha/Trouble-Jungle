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
    
    var scores = [5, 5,10,10,20,30,50,60,70,100,100,200,300,350,300,400,500]
    var animalsImages = [#imageLiteral(resourceName: "frog"),#imageLiteral(resourceName: "crocodile"),#imageLiteral(resourceName: "sloth"),#imageLiteral(resourceName: "tiger"),#imageLiteral(resourceName: "gorilla"),#imageLiteral(resourceName: "monkey"),#imageLiteral(resourceName: "zebra"),#imageLiteral(resourceName: "beatle")]
    var names = ["Sarel","Hod","Mor","Eli","Sian","Sarel","Hod","Mor","Eli","Sian","Sarel","Hod","Mor","Sarel","Hod","Mor","Eli"]
    
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
        return self.scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : MyCustomCell? = self.scores_LST_scores.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? MyCustomCell
        
        cell?.cell_LBL_score?.text = String(self.scores[indexPath.row])
        cell?.cell_LBL_name?.text = self.names[indexPath.row]
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

