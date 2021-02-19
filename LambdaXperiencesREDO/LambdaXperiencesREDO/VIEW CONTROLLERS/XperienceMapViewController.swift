//
//  XperienceMapViewController.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/13/21.
//

import UIKit
import MapKit

class XperienceMapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    
    private var userTrackingButton: MKUserTrackingButton!
    private let locationManager = CLLocationManager()
    var xperiencePostController = XperiencePostController.shared
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("test")
        addAndReloadPins()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestWhenInUseAuthorization()
        userTrackingButton = MKUserTrackingButton(mapView: mapView)
        userTrackingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userTrackingButton)
        NSLayoutConstraint.activate([
            userTrackingButton.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20),
            mapView.bottomAnchor.constraint(equalTo: userTrackingButton.bottomAnchor, constant: 20)
        ])
    }
    
    func addAndReloadPins() {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(xperiencePostController.postsArray)
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


    
    
    


