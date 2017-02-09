//
//  ViewController.swift
//  Geolocation Sample
//
//  Created by Vanessa Woo on 2/3/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var timer: Timer?
    
    struct MapConstants {
        static let latitude = 37.438696
        static let longitude = -122.152208
    }
    
    let geofence: Geofence = Geofence(latitudeDeadband: 0.5, longitudeDeadband: 0.5, targetLatitude: MapConstants.latitude, targetLongitude: MapConstants.longitude)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateLocationLabel), userInfo: nil, repeats: true)
    }
    
    func updateLocationLabel() {
        if (geofence.inCasti) {
            label.text = "You are on the Casti campus."
        } else {
            label.text = "You are not on the Casti campus."
        }
        print(geofence.inCasti)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        if let timer = self.timer {
            timer.invalidate()
        }
    }

}

