//
//  AddXperienceViewController.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/8/21.
//

import UIKit
import CoreImage
import Photos

protocol PostSaverDelegate {
    func reloadData()
}

class AddXperienceViewController: UIViewController {
    var xperiencePostController: XperiencePostController?
    
    let locationManager = CLLocationManager()
    var savePostDelegate: PostSaverDelegate?
    var xperiencePost: XperiencePost?
    
    
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeElapsedLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var audioVisualizer: AudioVisualizer!
    
    var originalImage: UIImage? {
        didSet {
            updateImage()
        }
    }
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrentLocation()
    }
    
    //MARK: - METHODS
    private func updateImage() {
        if let originalImage = originalImage {
            imageView.image = originalImage
        } else {
            imageView.image = nil
        }
    }
    
    private func presentImagePickerController() {
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                print("The photo library is not available.")
                return
            }
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true)
        }
    
    private func getCurrentLocation(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    //MARK: - Audio Recording
    
    
    
    //MARK: - IBACTIONS
    @IBAction func savePostButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
            let image = imageView.image else { return }
        getCurrentLocation()
        guard let location = locationManager.location?.coordinate else { return }
        xperiencePostController?.createXperiencePost(with: title, image: image, latitude: location.latitude, longitude: location.longitude)
            print("Xperience Created")
        
            DispatchQueue.main.async {
                self.savePostDelegate?.reloadData()
                self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func choosePhotoButtonTapped(_ sender: Any) {
        presentImagePickerController()
    }
    
    @IBAction func togglePlayback(_ sender: Any) {
    }
    
    @IBAction func updateCurrentTime(_ sender: UISlider) {
    }
    
    @IBAction func toggleRecording(_ sender: Any) {
    }
    
}

extension AddXperienceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            originalImage = image
        } else if let image = info[.originalImage] as? UIImage {
            originalImage = image
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
