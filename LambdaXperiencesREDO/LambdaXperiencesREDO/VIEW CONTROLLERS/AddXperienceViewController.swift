//
//  AddXperienceViewController.swift
//  LambdaXperiencesREDO
//
//  Created by BrysonSaclausa on 2/8/21.
//

import UIKit
import CoreImage
import Photos


class AddXperienceViewController: UIViewController {
    let xperiencePostController = XperiencePostController()
    let locationManager = CLLocationManager()
    
    
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
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
    
    
    //MARK: - IBACTIONS
    @IBAction func savePostButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
            let image = imageView.image else { return }
        getCurrentLocation()
        guard let location = locationManager.location?.coordinate else { return }
        xperiencePostController.createXperiencePost(with: title, image: image, location: location)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func choosePhotoButtonTapped(_ sender: Any) {
        presentImagePickerController()
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
