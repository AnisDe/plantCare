//
//  forgetPasswordViewController.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 05/05/2022.
//

import UIKit

class forgetPasswordViewController: UIViewController {
    //VAR
    struct MotDePasseOublieData {
        var email: String?
        var code: String?
    }
    var data : MotDePasseOublieData?
    let spinner = SpinnerViewController()
    
    // WIDGET
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var backgroundGradientView: UIView!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! codeViewController
        destination.data = data
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
    
    //Action
    
    
    @IBAction func nextBtn(_ sender: Any) {
        if (emailTextField.text!.isEmpty){
            self.present(Alert.makeAlert(titre: "Warning", message: "Please type your email"), animated: true)
            return


    }
        startSpinner()
        
        data = MotDePasseOublieData(email: emailTextField.text, code: String(Int.random(in: 1000..<9999)))
        
        UserViewModel().motDePasseOublie(email: (data?.email)!, codeDeReinit: (data?.code)! ) { success in
            self.stopSpinner()
            if success {
                self.performSegue(withIdentifier: "Confirm", sender: self.data)
            } else {
                self.present(Alert.makeAlert(titre: "Error", message: "Email does not exist"), animated: true)
            }
        }
    


}
}



