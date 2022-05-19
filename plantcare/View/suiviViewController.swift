//
//  suiviViewController.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 18/05/2022.
//

import UIKit

class suiviViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    var suivi = [Suivi]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suivi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell")
        let cv = cell?.contentView

        let plantName = cv?.viewWithTag(2) as! UILabel
        plantName.text = suivi[indexPath.row].name
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "seguesuivi", sender: indexPath)    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        recuperersuivi()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func recuperersuivi() {
        
        SuiviViewModel().recupererToutSuivi() { (success, planti) in
            if success {
                self.suivi = planti!
                self.suivitab.reloadData()
            }else {
                self.present(Alert.makeAlert(titre: "Error", message: "Internal server error"), animated: true)
            }
        }
    }


    @IBAction func addsuivibtn(_ sender: Any) {
        performSegue(withIdentifier: "suivisegue", sender: sender)
    }
    
    @IBOutlet weak var suivitab: UITableView!
}
