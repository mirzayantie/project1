//
//  LoginViewController.swift
//  CarouselEffect
//
//  Created by Mirzayantie on 18/09/2019.
//  Copyright © 2019 Mirzayantie. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {

     //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func logInPressed(_ sender: AnyObject) {
        
        guard let email = emailTextfield.text, let password = passwordTextfield.text else {
            print ("Form is not valid")
            return
        }
        //Log in the user
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                print ("Login is successful!")
                self.performSegue(withIdentifier: "goToCatProfile", sender: self)
            }
        }
    }

}



