//
//  SignUpViewController.swift
//  MyPiggy
//
//  Created by Noel Rosario on 11/29/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var successfulSignIn = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadingIndicator.isHidden = true
    }
    
    private func isValidData() -> Bool {
        let name = userNameTF.text ?? ""
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        let confirmPassword = confirmPasswordTF.text ?? ""
        //Validation for sign up proccess
        if name.isEmpty {
            showAlert(withTitle: "Error", Message: "Please enter username", controller: self)
            return false
        } else if email.isEmpty {
            showAlert(withTitle: "Error", Message: "Please enter email", controller: self)
            return false
            
        } else if password.isEmpty {
            showAlert(withTitle: "Error", Message: "Please enter password", controller: self)
            return false
        } else if confirmPassword.isEmpty {
            showAlert(withTitle: "Error", Message: "Please enter confirm password", controller: self)
            return false
            
        } else if password.count < 6 {
            showAlert(withTitle: "Error", Message: "Please should be greater than 6 characters", controller: self)
            return false
            
        } else if confirmPassword != password {
            showAlert(withTitle: "Error", Message: "Passwords does not match", controller: self)
            return false
        }
        
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func createAccountButton(_ sender: Any)
    {
        if isValidData()
        {
            //Do the firebase Authentication
            
            let email = emailTF.text ?? ""
            let password = passwordTF.text ?? ""
            let name = userNameTF.text ?? ""
            
            loadingIndicator.startAnimating()
            loadingIndicator.isHidden = false
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let user = result?.user {
                    //Account Created
                    let db = Firestore.firestore()
                    db.collection("Users").document("\(user.uid)").setData([
                        "username": name,
                        "email": email
                    ]) { err in
                        
                        self.loadingIndicator.stopAnimating()
                        self.loadingIndicator.isHidden = true
                        
                        if let error = err {
                            showAlert(withTitle: "", Message: error.localizedDescription, controller: self)
                        }
                        else
                        {
//                            showAlert(withTitle: "", Message: "Account created successfully", controller: self)
//                            self.successfulSignIn = true
                            
                            
                            let userCreatedAlert = UIAlertController(title: "", message: "Account created successfully", preferredStyle: .alert)  //<-- KEEP TRYING!!!!!!

                            let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
                                let SB = UIStoryboard(name: "Main", bundle: nil)
                                let vc = SB.instantiateViewController(withIdentifier: "LandingHomeViewController")
                                vc.modalPresentationStyle = .overFullScreen
                                self.present(vc, animated: true)

                           })
                            
                            userCreatedAlert.addAction(ok)

                            self.present(userCreatedAlert, animated: true)
                            
                           
                        }
                    }
                    
                }
                else
                {
                    showAlert(withTitle: "", Message: error?.localizedDescription ?? "Server Error", controller: self)
                }
                
            }
            
        }
    }
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
//    {
//        if successfulSignIn == true
//        {
//            return true
//        }
//        return false
//    }
    
}
