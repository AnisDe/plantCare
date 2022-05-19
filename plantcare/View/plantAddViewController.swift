//
//  plantAddViewController.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 15/4/2022.
//

import UIKit

class plantAddViewController: UIViewController,UIImagePickerControllerDelegate,
                              UINavigationControllerDelegate{

    @IBOutlet weak var plantDescription: UITextField!
    @IBOutlet weak var plantname: UITextField!
    @IBOutlet weak var plantImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


     @IBAction func addbtn(_ sender: Any) {
     }
     

    
    func gallery()

           {

               let myPickerControllerGallery = UIImagePickerController()

               myPickerControllerGallery.delegate = self

               myPickerControllerGallery.sourceType =
    UIImagePickerController.SourceType.photoLibrary

               myPickerControllerGallery.allowsEditing = true

               self.present(myPickerControllerGallery, animated: true,
    completion: nil)

               
           }
    
}
