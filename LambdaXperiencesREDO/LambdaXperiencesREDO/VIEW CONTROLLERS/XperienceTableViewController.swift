//
//  XperienceTableViewController.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/8/21.
//

import UIKit

class XperienceTableViewController: UITableViewController {
    
    var xperiencePostController: XperiencePostController! = nil
    
    
    //MARK: - IBOUTLETS
    

    override func viewDidLoad() {
        super.viewDidLoad()
       xperiencePostController = XperiencePostController()
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return xperiencePostController.postsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = xperiencePostController.postsArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "xperienceCell", for: indexPath) as! XperiencePostTableViewCell
        
        cell.post = post
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPostDetailSegue" {
            guard let vc = segue.destination as? XperienceDetailViewController,
                  let indexpath = tableView.indexPathForSelectedRow else { return }
            let postIndex = indexpath.row
            let post = xperiencePostController.postsArray[postIndex]
            vc.post = post
            vc.postIndex = postIndex
            vc.postController = xperiencePostController
            
        }
    }
    

}

