//
//  SettingsViewController.swift
//  InstaCloneFarebase
//
//  Created by Mehmet Can Şimşek on 1.03.2022.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        //firebasedende çıkış işlemi
        do {
          try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        } catch {
            print("error")
        }
    }
    
}
