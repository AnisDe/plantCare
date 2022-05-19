//
//  changePasswordViewController.swift
//  plantcare
//
//  Created by Apple Esprit on 4/5/2022.
//

import UIKit

class changePasswordViewController: UIViewController {

    //VAR
    var email: String?
    let spinner = SpinnerViewController()
    
    // WIDGET
    @IBOutlet weak var motDePasseTextField: UITextField!
    @IBOutlet weak var backgroundGradientView: UIView!
    
    @IBOutlet weak var confirmationMotDePasseTextField: UITextField!
    
    //LIFECYCLE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! Signin
        destination.email = self.email

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
                backgroundGradientView.layer.addSublayer(gradientLayer)
        

        // Do any additional setup after loading the view.
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
    
    //ACTIONS
    
    @IBAction func Terminer(_ sender: Any) {
        
        if (motDePasseTextField.text!.isEmpty) {
            self.present(Alert.makeAlert(titre: "Warning", message: "Please type your new password"), animated: true)
            return
        }
        
        if (confirmationMotDePasseTextField.text!.isEmpty) {
            self.present(Alert.makeAlert(titre: "Warning", message: "Please type the confirmation of your new password"), animated: true)
            return
        }
        
        if (motDePasseTextField.text != confirmationMotDePasseTextField.text) {
            self.present(Alert.makeAlert(titre: "Warning", message: "Passwords should match"), animated: true)
            return
        }
        
        startSpinner()
    
        UserViewModel().changerMotDePasse(email: email!, nouveauMotDePasse: confirmationMotDePasseTextField.text!, completed: { success in
            self.stopSpinner()
            if success {
                let action = UIAlertAction(title: "Retour", style: .default) { UIAlertAction in
                    self.performSegue(withIdentifier: "revenirConnexionSegue", sender: nil)
                }
                self.present(Alert.makeSingleActionAlert(titre: "Success", message: "Your password has been changed", action: action), animated: true)
            }else{
                self.present(Alert.makeAlert(titre: "Error", message: "Could not change your password"), animated: true)
            }
        })


    }
    
}

