//
//  codeViewController.swift
//  plantcare
//
//  Created by Apple Esprit on 4/5/2022.
//

import UIKit

class codeViewController: UIViewController {

    
    var data : forgetPasswordViewController.MotDePasseOublieData?
    var compteur: Int?
    var compteurTimer : Timer?
    
    // WIDGET

    @IBOutlet weak var codeTextField: UITextField!
    
    
   
    @IBOutlet weak var nextBtn: UIButton!
    

    @IBOutlet weak var backgroundGradientView: UIView!
    
    
    @IBOutlet weak var compteurExpirationLabel: UILabel!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! changePasswordViewController
        destination.email = data?.email
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
        


        compteurExpirationLabel.text = "90"
        compteur = 90
        startTimer()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        stopTimer()
    }
    
    //METHODE
    func startTimer () {
        guard compteurTimer == nil else { return }
        
        compteurTimer =  Timer.scheduledTimer(
            timeInterval: 1,
            target      : self,
            selector    : #selector(update),
            userInfo    : nil,
            repeats     : true)
    }
    
    func stopTimer() {
        compteurTimer?.invalidate()
        compteurTimer = nil
    }
    @objc
    func update()  {
        if (compteur! > 0){
            compteur! -= 1
            compteurExpirationLabel.text = String(compteur!)
        } else {
            stopTimer()
            nextBtn.isEnabled = false
            codeTextField.isUserInteractionEnabled = false
            compteurExpirationLabel.textColor = .darkGray
            self.present(Alert.makeAlert(titre: "Warning", message: "The code exprired please restart"), animated: true)
        }
    }
    
    //ACTIONS
    
    
    @IBAction func nextbtn(_ sender: Any) {
        
        if (codeTextField.text!.isEmpty){
            self.present(Alert.makeAlert(titre: "Warning", message: "Please type the code"), animated: true)
            return
    }
        if (codeTextField.text == data?.code ) {
            self.performSegue(withIdentifier: "change", sender: data?.email)
        } else {
            self.present(Alert.makeAlert(titre: "Error", message: "Code incorrect"), animated: true)
        }

  

}
}


    

