//
//  XperienceController.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/8/21.
//

import UIKit

class XperiencePostController {
    
    var postsArray = [XperiencePost]()
    
    func createXperiencePost(with title: String, image: UIImage) {
            
        }
    
    //MARK: - Mock Posts
    
    init() {
        let post1 = XperiencePost(title: "Hello World, Goodbye World", image: UIImage(named: "SLB")!)
        [post1].forEach {
            postsArray.append($0)
        }
    }
    
    //lat: 21.344843, lon: -157.910602
    
    
    
}
