//
//  DetailsPlantViewController.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 15/4/2022.
//

import UIKit
import MessageKit

class DetailsPlantViewController: UIViewController {

    var plant:Home?
   
    

    
    
    @IBOutlet weak var plantImg: UIImageView!
    @IBOutlet weak var plantDescription: UITextView!
    @IBOutlet weak var plantName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url : URL = URL(string: HOST_POST_URL+"/uploads/"+self.plant!.photo!)!
        plantImg.loadImge(withUrl: url )
        
        plantName.text = plant!.name
        plantDescription.text = plant!.description
    
    }
    
    @IBAction func backbtn(_ sender: Any) {
        performSegue(withIdentifier: "backsegue", sender: sender)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func commentaireBtn(_ sender: Any) {
        performSegue(withIdentifier: "commentairesSegue", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            let destination = segue.destination as! CommentairesView
        
        destination.plant = self.plant!
    }
    
}
