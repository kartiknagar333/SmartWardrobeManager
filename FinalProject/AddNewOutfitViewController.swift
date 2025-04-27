//
//  AddNewOutfitViewController.swift
//  FinalProject
//
//  Created by CDMStudent on 3/17/25.
//

import UIKit

class AddNewOutfitViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var detailsTF: UITextField!
    
    @IBOutlet weak var addphotobtn: UIButton!
    
    var isPhotoexisted  = false
    
    var str = "added"
    
    @IBOutlet weak var outfitphoto: UIImageView!
    
    @IBOutlet weak var toplabel: UILabel!
    @IBOutlet weak var addoutfitbtn: UIButton!
    let imagePicker = UIImagePickerController()
    var outfitToEdit: Outfit?
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        if let outfit = outfitToEdit {
              str = "saved"
            toplabel.text = "Edit Outfit"
              detailsTF.text = outfit.outfitName
              addphotobtn.setTitle("Edit Photo", for: .normal)
              addoutfitbtn.setTitle("Save", for: .normal)
              outfitphoto.image = UIImage(named: outfit.imagePath)
          }
    }
    
    @IBAction func TapADDbtn(_ sender: Any) {
        var msg: String?
        var done = false
        if let text = detailsTF.text, !text.trimmingCharacters(in: .whitespaces).isEmpty {
            if(isPhotoexisted) {
                done = true
                msg = "The Outfit \(text) was \(str)."
            }else{
                msg = "The Outfit Photo is required."
            }
        }else {
            if(isPhotoexisted) {
                msg = "The Outfit Details is required."
            }else{
                msg = "The Outfit Details & Photo are required."
            }
        }
        
        let alert = UIAlertController(title: "Outfit Alert", message: msg, preferredStyle: .actionSheet)
        
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            if(done){
                self.dismiss(animated: true, completion: nil)
            }
        }
                
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func TapAddphotobtn(_ sender: Any) {
        showImagePickerOptions()
    }
    
    func showImagePickerOptions() {
           let alert = UIAlertController(title: "Choose Image", message: "Select a photo from the gallery or take a new one.", preferredStyle: .actionSheet)
           
           let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
               self.openCamera()
           }
           
           let galleryAction = UIAlertAction(title: "Photo Gallery", style: .default) { _ in
               self.openGallery()
           }
           
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           
           alert.addAction(cameraAction)
           alert.addAction(galleryAction)
           alert.addAction(cancelAction)
           
           present(alert, animated: true, completion: nil)
       }
       
       
       func openCamera() {
           if UIImagePickerController.isSourceTypeAvailable(.camera) {
               imagePicker.sourceType = .camera
               present(imagePicker, animated: true, completion: nil)
           } else {
               showErrorAlert(message: "Camera not available on this device.")
           }
       }
       
       func openGallery() {
           if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
               imagePicker.sourceType = .photoLibrary
               present(imagePicker, animated: true, completion: nil)
           } else {
               showErrorAlert(message: "Gallery access not available.")
           }
       }
       
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let selectedImage = info[.originalImage] as? UIImage {
               outfitphoto.image = selectedImage
               addphotobtn.setTitle("Edit Photo", for: .normal)
               isPhotoexisted = true
           }
           dismiss(animated: true, completion: nil)
       }
    
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           dismiss(animated: true, completion: nil)
       }
       
       func showErrorAlert(message: String) {
           let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
    
}
