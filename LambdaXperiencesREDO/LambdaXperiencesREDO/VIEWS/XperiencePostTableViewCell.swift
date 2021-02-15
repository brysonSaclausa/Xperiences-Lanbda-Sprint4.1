//
//  XperiencePostTableViewCell.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/11/21.
//

import UIKit

class XperiencePostTableViewCell: UITableViewCell {
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var cellimageView: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    
    var post: XperiencePost? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        guard let post = post else { return }
        cellimageView.image = post.image
        cellTitle.text = post.title
    }
    
    



}
