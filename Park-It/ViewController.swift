//
//  ViewController.swift
//  Park-It
//
//  Created by Kinshuk Singh on 2018-02-23.
//  Copyright © 2018 Kinshuk. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    
    var window: UIWindow?
    
    var ref: DatabaseReference!
    
    func createAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var ownerDriverSwitch: UISwitch!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBAction func signupButton(_ sender: Any) {
        
        if nameTextField.text=="" || emailTextField.text=="" || phoneTextField.text=="" ||
            passwordTextField.text=="" || confirmPasswordTextField.text=="" {
            
            createAlert(title: "Error", message: "Some detailes are missing")
            
        } else if passwordTextField.text != confirmPasswordTextField.text {
            
            createAlert(title: "Error", message: "Passwords don't match")
            
        } else {
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    //Successfully authenticated user
                    
                    self.ref = Database.database().reference()
                    
                    let userData = ["name": self.nameTextField.text, "email": self.emailTextField.text, "phone": self.phoneTextField.text, "isDriver": self.ownerDriverSwitch.isOn, "uID": user?.uid] as [String : Any]
                    
                    self.ref.child("users").child(user!.uid).setValue(userData)
                    
                    print("You have successfully signed up")
                    
                    self.performSegue(withIdentifier: "signupToCarRegistration", sender: self)
                    
                    
//                    let rootVC = BrowseProductsViewController()
//                    let navigationController = UINavigationController(rootViewController: rootVC)
//                    let window = UIWindow(frame: UIScreen.main.bounds)
//                    window.rootViewController = navigationController;
//                    window.makeKeyAndVisible()
//                    self.window = window
                    
                    // show update screen now for owner if they are owner
                    // otherwise show the update screen for driver
                    
                    // self.performSegue(withIdentifier: "signupToMain", sender: self)
                    
                    
                } else {
                    
                    self.createAlert(title: "Error", message: (error?.localizedDescription)!)
                    
                }
            }
            
        }
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "signupToLogin", sender: self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser != nil {
            
            
            // if the user has already updated every information, then just direct him to the dashboard
            // otherwise show him update info screen
            
           // performSegue(withIdentifier: "signupToMain", sender: self)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        if Auth.auth().currentUser != nil {
//
//            // User is signed in.
//            // move the user to home screen
//
//            // if the user has already updated every information, then just direct him to the dashboard
//            // otherwise show him update info screen
//
//           // performSegue(withIdentifier: "signupToMain", sender: self)
//
//        }
//        if Auth.auth().currentUser != nil {
//            performSegue(withIdentifier: "signupToReveal", sender: self)
//        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        if Auth.auth().currentUser != nil {
//            performSegue(withIdentifier: "signupToReveal", sender: self)
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

