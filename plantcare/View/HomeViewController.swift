//
//  HomeViewController.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 15/4/2022.
//

import UIKit
import Alamofire
//import AlamofireImage
import SwiftyJSON

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var emailAddress:String?
    var plants = [Home]()
    var plantname = [String]()
    var plantdescription = [String]()
    var plantimg = [String]()
    
    
    @IBOutlet weak var Planttv: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell")
        let cv = cell?.contentView

        let plantImg = cv?.viewWithTag(1) as! UIImageView
        let plantName = cv?.viewWithTag(2) as! UILabel
        let url : URL = URL(string: HOST_POST_URL+"/uploads/"+plants[indexPath.row].photo!)!
        plantImg.loadImge(withUrl: url )
        plantName.text = plants[indexPath.row].name
        
        return cell!

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailsSegue", sender: indexPath)    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {   
        let index = sender as! IndexPath
            let destination = segue.destination as! DetailsPlantViewController
        destination.plant = plants[index.row]
        }
            
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        recupererplant()
    }


    @IBAction func settingsbtn(_ sender: Any) {
        performSegue(withIdentifier: "settingsSegue", sender: sender)
    }
    
    func recupererplant() {
        
        HomeViewModel().recupererToutPlant() { (success, planti) in
            if success {
                self.plants = planti!
                self.Planttv.reloadData()
            }else {
                self.present(Alert.makeAlert(titre: "Error", message: "Internal server error"), animated: true)
            }
        }
    }
    
    

    @IBAction func addplant(_ sender: Any) {
        performSegue(withIdentifier: "addplantsegue", sender: sender)
    }
    

    
}
extension UIImageView {
    func loadImge(withUrl url: URL) {
           DispatchQueue.global().async { [weak self] in
               if let imageData = try? Data(contentsOf: url) {
                   if let image = UIImage(data: imageData) {
                       DispatchQueue.main.async {
                           self?.image = image
                       }
                   }
               }
           }
       }
}

