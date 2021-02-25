//
//  XperienceController.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/8/21.
//

import UIKit
import MapKit

class XperiencePostController {
    static let shared = XperiencePostController()
    
    var postsArray: [XperiencePost] = []
    
    func createXperiencePost(with title: String, image: UIImage, latitude: Double, longitude: Double) {
        let newPost = XperiencePost(title: title, image: image, latitude: latitude, longitude: longitude)

        postsArray.append(newPost)
    }
    
    
    
    
    //MARK: - Mock Posts
//    let slbLocation = CLLocationCoordinate2D(latitude: 21.344843, longitude: -157.910602)
//    let ahLocation = CLLocationCoordinate2D(latitude: 21.299927, longitude: -157.755751)
    
//    init() {
//        let post1 = XperiencePost(title: "This is a mock post!", image: UIImage(named: "SLB")!, latitude: slbLocation.latitude, longitude: slbLocation.longitude)
//        
//        [post1].forEach {
//            postsArray.append($0)
//        }
//    }

}
