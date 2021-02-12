//
//  XperienceController.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/8/21.
//

import UIKit

class XperiencePostController {
   
   var posts: [XperiencePost] = []
    
    func createXperiencePost(with title: String) {
        let xperiencePost = XperiencePost(title: title)
        posts.append(xperiencePost)
    }
   
    
    
    
    
}
