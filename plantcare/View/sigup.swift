//
//  sigup.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 12/4/2022.
//

import UIKit

class sigup: UIViewController {
    
    var name: String?
    var email: String?
    var phone: String?
    var password: String?
    var currentUser: Bool?
    var userViewModel = UserViewModel()
    var user = User()

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var pseudoTextField: UITextField!
    @IBOutlet weak var background: UIView!
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    func goToLogin(email: String?) {
        self.performSegue(withIdentifier: "login", sender: email)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            let destination = segue.destination as! Signin
            destination.user = user
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
                // Set the size of the layer to be equal to size of the display.
                gradientLayer.frame = view.bounds
                // Set an array of Core Graphics colors (.cgColor) to create the gradient.
                // This example uses a Color Literal and a UIColor from RGB values.
                gradientLayer.colors = [#colorLiteral(red: 0, green: 0.6740835309, blue: 0, alpha: 1).cgColor, #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1).cgColor]
                // Rasterize this static layer to improve app performance.
                gradientLayer.shouldRasterize = true
                // Apply the gradient to the backgroundGradientView.
                background.layer.addSublayer(gradientLayer)        // Do any additional setup after loading the view.
    }
    
    func makeAlert(titre: String?, message: String?) {
        let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    

    @IBAction func inscription(_ sender: Any) {
        
        if (pseudoTextField.text == "") {
            makeAlert(titre: "Warning", message: "Please type your username")
            return
        }
        
        if (emailTextField.text == "") {
            makeAlert(titre: "Warning", message: "Please type your email")
            return
        }else if (emailTextField.text?.contains("@") == false){
            makeAlert(titre: "Warning", message: "Please type your email correctly")
            return
        }
        
        if (phoneTextField.text == "") {
            makeAlert(titre: "Warning", message: "Please type your phone")
            return
        }
        if (passwordTextField.text == "") {
            makeAlert(titre: "Warning", message: "Please type your password")
            return
        }
        
        
        user.name = pseudoTextField.text
        user.email = emailTextField.text
        user.password = passwordTextField.text
        user.phone = phoneTextField.text
        
        let child = SpinnerViewController()
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        userViewModel.inscription(user: user, completed: { (success) in
            // STOP Spinner
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
            
            if success {
                
                let alert = UIAlertController(title: "Success", message: "Your account has been created.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                    self.goToLogin(email: self.user.email)
                }
                alert.addAction(action)
                self.present(alert, animated: true)
            } else {
                self.present(Alert.makeAlert(titre: "Error", message: "Account may already exist."), animated: true)
            }
            
            // STOP Spinner
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        })
        
    }
    

}
