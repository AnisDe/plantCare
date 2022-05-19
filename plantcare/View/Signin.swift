//
//  Signin.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 12/4/2022.
//

import UIKit
import MessageKit


class Signin: UIViewController {

    //807930804913-jcim7au26p50ptuhdditgvju3eqk8e1j.apps.googleusercontent.com
  

    let userViewModel = UserViewModel()
    let spinner = SpinnerViewController()
    
    var email: String?
    var user: User?
    
  
   
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var motDePasseTextField: UITextField!
    @IBOutlet weak var background: UIView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        motDePasseTextField.text = "12345"
        
        emailTextField.text = "ghaith.ayari@esprit.tn"

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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    func startSpinner() {
        addChild(spinner)
        spinner.view.frame = view.frame
        view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
    }
    
    func stopSpinner() {
        spinner.willMove(toParent: nil)
        spinner.view.removeFromSuperview()
        spinner.removeFromParent()
    }
    func reEnvoyerEmail(email: String?) {
        userViewModel.reEnvoyerConfirmationEmail(email: email!, completed: { (success) in
            if success {
                self.present(Alert.makeAlert(titre: "Success", message: "Confirmation email has been sent to " + email!), animated: true)
            } else {
                self.present(Alert.makeAlert(titre: "Error", message: "Could not send the confirmation email"), animated: true)
            }
        })
    }
    
    
  
    
    @IBAction func Mbpbutton(_ sender: Any) {
        
        performSegue(withIdentifier: "Forget", sender: sender)
    }
    
    @IBAction func SignUpBtn(_ sender: Any) {
        performSegue(withIdentifier: "SignUp", sender: sender)
    }
    
    @IBAction func loginaction(_ sender: Any) {
        
        if(emailTextField.text!.isEmpty || motDePasseTextField.text!.isEmpty){
            self.present(Alert.makeAlert(titre: "Warning", message: "Please type your credentials"), animated: true)
            return
        }
        
        
        
        startSpinner()
        
        userViewModel.connexion(email: emailTextField.text!, password: motDePasseTextField.text!,completed: { (success, reponse) in
            
            self.stopSpinner()
            
            if success {
                let utilisateur = reponse as! User
                
                if utilisateur.isVerified! {
                    self.performSegue(withIdentifier: "segue2", sender: nil)
                } else {
                    let action = UIAlertAction(title: "Renvoyer", style: .default) { UIAlertAction in
                        self.reEnvoyerEmail(email: utilisateur.email)
                    }
                    self.present(Alert.makeActionAlert(titre: "Notice", message: "This email is not confirmed, would you like to resend the confirmation email to " + utilisateur.email! + " ?", action: action),animated: true)
                    self.reEnvoyerEmail(email: utilisateur.email)
                }
            } else {
                self.present(Alert.makeAlert(titre: "Warning", message: "Email or password incorrect"), animated: true)
            }
        })
    }
}

