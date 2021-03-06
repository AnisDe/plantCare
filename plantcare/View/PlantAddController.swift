//
//  addJoueurViewController.swift
//  YassYes
//
//  Created by Mac2021 on 15/11/2021.
//

import UIKit

class PlantAddController: UIViewController,UIGestureRecognizerDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var currentPhoto : UIImage?

    @IBOutlet weak var PlantPhoto: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!

    @IBOutlet weak var nomPlant: UITextField!
    @IBOutlet weak var descPlant: UITextField!
          override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func ajoutEquipeBtn(_ sender: Any) {
    
        let plantd = Plant(  name: nomPlant.text!,description: descPlant.text!)
        PlantViewModel.shareinstance.addPlant(plant: plantd, uiImage: currentPhoto!) { success in
            if success {
//                self.present(Alert.makeAlert(titre: "Success", message: "joueur ajouté"),animated: true)
                self.present(Alert.makeActionAlert(titre: "Success", message: "Plant Added", action: UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in self.navigationController?.popViewController(animated: true)})),animated: true)

            }else{
                self.present(Alert.makeAlert(titre: "failed", message: " Fail"),animated: true)

            }
        }
    
    }
    @IBAction func changePhoto(_ sender: Any) {
    showActionSheet()
}
    func camera()
    {
        let myPickerControllerCamera = UIImagePickerController()
        myPickerControllerCamera.delegate = self
        myPickerControllerCamera.sourceType = UIImagePickerController.SourceType.camera
        myPickerControllerCamera.allowsEditing = true
        self.present(myPickerControllerCamera, animated: true, completion: nil)

    }
  
  
  func gallery()
  {

      let myPickerControllerGallery = UIImagePickerController()
      myPickerControllerGallery.delegate = self
      myPickerControllerGallery.sourceType = UIImagePickerController.SourceType.photoLibrary
      myPickerControllerGallery.allowsEditing = true
      self.present(myPickerControllerGallery, animated: true, completion: nil)

  }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            
            return
        }
        
        currentPhoto = selectedImage
        PlantPhoto.image = selectedImage
        addImageButton.isHidden = true
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func showActionSheet(){

        let actionSheetController: UIAlertController = UIAlertController(title: NSLocalizedString("Upload Image", comment: ""), message: nil, preferredStyle: .actionSheet)
        actionSheetController.view.tintColor = UIColor.black
        let cancelActionButton: UIAlertAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { action -> Void in
            print("Cancel")
        }
        actionSheetController.addAction(cancelActionButton)

        let saveActionButton: UIAlertAction = UIAlertAction(title: NSLocalizedString("Take Photo", comment: ""), style: .default)
        { action -> Void in
            self.camera()
        }
        actionSheetController.addAction(saveActionButton)

        let deleteActionButton: UIAlertAction = UIAlertAction(title: NSLocalizedString("Choose From Gallery", comment: ""), style: .default)
        { action -> Void in
            self.gallery()
        }
        
        actionSheetController.addAction(deleteActionButton)
        self.present(actionSheetController, animated: true, completion: nil)
    }

}
