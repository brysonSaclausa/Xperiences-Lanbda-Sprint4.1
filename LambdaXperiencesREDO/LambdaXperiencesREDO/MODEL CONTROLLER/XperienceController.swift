//
//  XperienceController.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/8/21.
//

import UIKit

class XperiencePostController {
   
   var posts: [XperiencePost] = []
    
    func createXperiencePost(with title: String, image: UIImage) {
        let xperiencePost = XperiencePost(title: title, image: image)
        posts.append(xperiencePost)
    }
   
    
    
    
    
}
