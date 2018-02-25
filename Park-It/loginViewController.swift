//
//  loginViewController.swift
//  Park-It
//
//  Created by Kinshuk Singh on 2018-02-23.
//  Copyright © 2018 Kinshuk. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class loginViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    func createAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        
        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            createAlert(title: "Error", message: "Please enter an email and password.")
            
        } else {
            
            Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    // we need to check if the user is a driver or owner
                    
                    let userID = Auth.auth().currentUser?.uid
                    self.ref = Database.database().reference()
                    self.ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                        // Get user value
                        let value = snapshot.value as? NSDictionary
                        let isDriver = value?["isDriver"] as! Bool
                        //let user = User(username: username)
                        
                        if isDriver {
                            // show the driver dashboard
                        } else {
                            // show the owner dashboard
                        }
                        
                    }) { (error) in
                        print(error.localizedDescription)
                    }
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    // take the user directly to the dashboard if he/she has already updated all the info
                    // otherwise direct he/she to update info screen
                    
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    
                    self.createAlert(title: "Error", message: (error?.localizedDescription)!)
                }
            }
            
        }
        
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "loginToSignup", sender: self)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
