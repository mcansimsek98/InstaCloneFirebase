//
//  ViewController.swift
//  InstaCloneFarebase
//
//  Created by Mehmet Can Şimşek on 1.03.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    @IBAction func singInClicked(_ sender: Any) {
        //kullanıcı giriş
        if emailTextField.text != "" && paswordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: paswordTextField.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else {
            
        }
            
    }
    
    @IBAction func singUpClicked(_ sender: Any) {
       //kullanıcı oluşturma
        if emailTextField.text != "" && paswordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: paswordTextField.text!) { autdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            
            makeAlert(titleInput: "Error", messageInput: "Username / Password?")
        }
        
    }
    func makeAlert(titleInput:String,messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

