//
//  ScoresController.swift
//  TroubleJungle
//
//  Created by user167401 on 5/21/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit
import MapKit

class ScoresController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var scores_LST_scores: UITableView!
    @IBOutlet weak var scores_BTN_back: UIButton!
    
    @IBOutlet weak var scores_MAPVIEW_map: MKMapView!
    
    var animalsImages = [#imageLiteral(resourceName: "crocodile"),#imageLiteral(resourceName: "zebra"),#imageLiteral(resourceName: "sloth"),#imageLiteral(resourceName: "tiger"),#imageLiteral(resourceName: "gorilla"),#imageLiteral(resourceName: "monkey"),#imageLiteral(resourceName: "frog"),#imageLiteral(resourceName: "beatle")]
    var highScores : [HighScore]!
    let cellReuseIdentifier = "score_cell"
    var newCamera: MKMapCamera!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //Read from local storage the highscores
        scores_MAPVIEW_map.showsUserLocation = true
        //Set the corner of the map to be rounded.
        scores_MAPVIEW_map.layer.cornerRadius = 25.0
        highScores = MyLocalStorage.getDataFromLocalStorage()
        addAnnotationPoints()
        setupList()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    func addAnnotationPoints(){
        
            
        for highScore in highScores{
            
            
            let point = MKPointAnnotation()
            
            let pointlatitude = Double(highScore.location.lat!)
            let pointlongitude = Double(highScore.location.lng!)
            point.title = highScore.name
            
            point.coordinate = CLLocationCoordinate2DMake(pointlatitude ,pointlongitude)
            scores_MAPVIEW_map.addAnnotation(point)
            
            
        }
        
    }
    
    func showAnotation(index : Int){
        
       
        newCamera = MKMapCamera(lookingAtCenter: CLLocationCoordinate2D(latitude: highScores[index].location.lat!, longitude: highScores[index].location.lng!), fromDistance: 500.0, pitch: 90.0, heading: 180.0)
        self.scores_MAPVIEW_map.setCamera(newCamera, animated: true)
        

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
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("here bitchhhhh")
        showAnotation(index: indexPath.row)
    }
    
    

    
}

