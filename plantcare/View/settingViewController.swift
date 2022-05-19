//
//  settingViewController.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 15/4/2022.
//

import UIKit

class settingViewController: UIViewController {
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var newpassword: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func updatebtn(_ sender: Any) {
        UserDefaults.standard.set("", forKey: "token")
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    @IBAction func darkbtn(_ sender: UISwitch) {
        
        if #available(iOS 13.0, *) {
             let appDelegate = UIApplication.shared.windows.first
                 if sender.isOn {
                    appDelegate?.overrideUserInterfaceStyle = .dark
                      return
                 }
             appDelegate?.overrideUserInterfaceStyle = .light
             return
        }
        
    }
}
