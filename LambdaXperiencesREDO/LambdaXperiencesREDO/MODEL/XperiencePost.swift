//
//  XperiencePost.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/10/21.
//

import UIKit
import MapKit

class XperiencePost: NSObject {
    let postTitle: String
    let image: UIImage
    let latitude: Double
    let longitude: Double

    init(title: String, image: UIImage, latitude: Double, longitude: Double) {
        self.postTitle = title
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
    }

}

extension XperiencePost: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var title: String? { postTitle }
    
}
/*
 Tab bar controller
 [
 tab1 -> [MapView, view2, view3],
 tab2 -> [TableView, DetailView],
 ]
 
 */
