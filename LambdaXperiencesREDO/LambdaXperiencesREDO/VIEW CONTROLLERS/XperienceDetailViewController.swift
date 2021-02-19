//
//  XperienceDetailViewController.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/12/21.
//

import UIKit
import AVFoundation

class XperienceDetailViewController: UIViewController {
    
    var post: XperiencePost?
    var postIndex: Int?
    var postController: XperiencePostController?
    var audioPlayer: AVAudioPlayer?
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
    }
    
    func setUpViews() {
        guard let post = post else { return }
        titleLabel?.text = post.title
        imageView?.image = post.image
        latitudeLabel?.text = "Latitude \(String(post.latitude))"
        longitudeLabel?.text = "Longitude \(String(post.longitude))"
        
    }
    
    func loadAudio() {
        let audioURL = Bundle.main.url(forResource: "piano", withExtension: "mp3")!
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
        } catch {
            preconditionFailure("Failure to load audio file \(error) ")
        }
        
    }
    
    //MARK: - IBACTIONS
    @IBAction func togglePlayback(_ sender: Any) {
        audioPlayer?.play()
        
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
