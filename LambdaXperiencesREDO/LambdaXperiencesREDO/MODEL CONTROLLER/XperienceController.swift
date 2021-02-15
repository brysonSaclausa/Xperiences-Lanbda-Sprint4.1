//
//  XperienceController.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/8/21.
//

import UIKit
import MapKit

class XperiencePostController {
    
    var postsArray = [XperiencePost]()
    
    
    func createXperiencePost(with title: String, image: UIImage, location: CLLocationCoordinate2D) {
            let post = XperiencePost(title: title, image: image, location: location)
        postsArray.append(post)
        }
    
    //MARK: - Mock Posts
    let slbLocation = CLLocationCoordinate2D(latitude: 21.344843, longitude: -157.910602)
    init() {
        let post1 = XperiencePost(title: "Hello World", image: UIImage(named: "SLB")!, location: slbLocation)
        [post1].forEach {
            postsArray.append($0)
        }
    }
    
    
    
}
