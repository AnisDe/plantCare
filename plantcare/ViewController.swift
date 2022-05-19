//
//  ViewController.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 12/4/2022.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    let signInConfig = GIDConfiguration.init(clientID: "807930804913-jcim7au26p50ptuhdditgvju3eqk8e1j.apps.googleusercontent.com")
    
    @IBOutlet weak var backgroundGradientView: UIView!
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let token = UserDefaults.standard.string(forKey: "tokenConnexion")
        print("----------------------")
        print(token)
       if (token != nil) {
           UserViewModel().recupererUtilisateurParToken(tokenConnexion: token!) {
            success, user in
            if success {
                self.performSegue(withIdentifier: "connected", sender: user)
            }
        }}
    }

    @IBAction func SignUp(_ sender: Any) {
        performSegue(withIdentifier: "signUpSegue", sender: sender)
    }
    
    @IBAction func SignIn(_ sender: Any) {
        performSegue(withIdentifier: "signInSegue", sender: sender)
    }
    
    @IBAction func signInGoogle(sender: Any) {
      GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
        guard error == nil else { return }
          guard  let user = user else {return}
          let emailAddress = user.profile?.email
          self.performSegue(withIdentifier: "google", sender: emailAddress)
          
       
          print(user.userID)
         print(user.profile?.email)
print(user.profile?.name)
              print(user.profile?.givenName)
              
        
        // If sign in succeeded, display the app's main content View.
         

      }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier=="google"{
            let emailAddress = sender  as! String
            let destination = segue.destination as! HomeViewController
                destination.emailAddress = emailAddress
                
            }
    }
}

