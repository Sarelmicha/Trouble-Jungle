//
//  MenuController.swift
//  TroubleJungle

//  Created by user167401 on 5/19/20.
//  Copyright © 2020 Sarel Micha. All rights reserved.
//

import UIKit
import CoreLocation


class MenuController: UIViewController {
    
    
    @IBOutlet weak var menu_BTN_easy: UIButton!
    @IBOutlet weak var menu_BTN_hard: UIButton!
    @IBOutlet weak var menu_BTN_scores: UIButton!
    
    let EASY_MODE = "Easy"
    let HARD_MODE = "Hard"
    var difficult : String?;
    var locationManager: CLLocationManager!
    var myLocation : MyLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
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
            namePage.myLocation = myLocation
            
            
        } else if(segue.identifier == "goToScoresPage"){
            _ = segue.destination as! ScoresController
            
        }
    }
}

extension MenuController: CLLocationManagerDelegate {
    
    //Do somthing when fetch location sucusses
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")

        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            self.myLocation = MyLocation(lat:location.coordinate.latitude, lng: location.coordinate.latitude)
            print("got Location: \(myLocation.lat) \(myLocation.lng)")
        }
    }
    
    //Do somthing when an error occured when trying fetch location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error=\(error)")
    }
}
