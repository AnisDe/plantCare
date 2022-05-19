//
//  addsuiviViewController.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 18/05/2022.
//

import UIKit

class addsuiviViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        
    var currentPhoto : UIImage?
    var currentPhoto2 : UIImage?
    var currentPhoto3 : UIImage?
    var currentPhoto4 : UIImage?
    var currentPhoto5 : UIImage?

   
    
    @IBOutlet weak var siviphoto1: UIImageView!
    @IBOutlet weak var siviphoto2: UIImageView!
    @IBOutlet weak var siviphoto3: UIImageView!
    @IBOutlet weak var siviphoto4: UIImageView!
    @IBOutlet weak var siviphoto5: UIImageView!
    @IBOutlet weak var addimgsuivibtn1: UIButton!
    @IBOutlet weak var addimgsuivibtn2: UIButton!
    @IBOutlet weak var addimgsuivibtn3: UIButton!
    @IBOutlet weak var addimgsuivibtn4: UIButton!
    @IBOutlet weak var addimgsuivibtn5: UIButton!
    
    @IBOutlet weak var namesuivi: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func addsuivibtn(_ sender: Any) {
        let suivii = Suivi(name: namesuivi.text!)
        SuiviViewModel.sharedInstance.addsuivi(suivi:suivii, uiImage: currentPhoto!) { success in
            if success {
    //                self.present(Alert.makeAlert(titre: "Success", message: "joueur ajouté"),animated: true)
                self.present(Alert.makeActionAlert(titre: "Success", message: "Plant Added", action: UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in self.navigationController?.popViewController(animated: true)})),animated: true)

            }else{
                self.present(Alert.makeAlert(titre: "failed", message: " Fail"),animated: true)

            }
        }

    }
        
    
    
        
        
   

    @IBAction func changePhoto1(_ sender: Any) {
    showActionSheet()
}
    
    @IBAction func changePhoto2(_ sender: Any) {

    showActionSheet2()
}
    @IBAction func changePhoto3(_ sender: Any) {

    showActionSheet3()
}
    @IBAction func changePhoto4(_ sender: Any) {
        

    showActionSheet4()
}
    @IBAction func changePhoto5(_ sender: Any) {

    showActionSheet5()
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
        
        guard let selectedImage1 = info[.originalImage] as? UIImage else {
            
            return
        }
        guard let selectedImage2 = info[.originalImage] as? UIImage else {
            
            return
        }
        guard let selectedImage3 = info[.originalImage] as? UIImage else {
            
            return
        }
        guard let selectedImage4 = info[.originalImage] as? UIImage else {
            
            return
        }
        guard let selectedImage5 = info[.originalImage] as? UIImage else {
            
            return
        }
        
        currentPhoto = selectedImage1
        siviphoto1.image = selectedImage1
        siviphoto2.image = selectedImage2
        siviphoto3.image = selectedImage3
        siviphoto4.image = selectedImage4
        siviphoto5.image = selectedImage5
        addimgsuivibtn1.isHidden = true
        addimgsuivibtn2.isHidden = true
        addimgsuivibtn3.isHidden = true
        addimgsuivibtn4.isHidden = true
        addimgsuivibtn5.isHidden = true
        
        
        
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
    func showActionSheet2(){

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
    func showActionSheet3(){

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
    func showActionSheet4(){

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
    func showActionSheet5(){

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


