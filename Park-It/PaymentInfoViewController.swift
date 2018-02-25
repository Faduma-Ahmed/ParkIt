//
//  PaymentInfoViewController.swift
//  Park-It
//
//  Created by Kinshuk Singh on 2018-02-24.
//  Copyright © 2018 Kinshuk. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase

class PaymentInfoViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var cvvTextField: UITextField!
    
    @IBOutlet weak var postalCodeTextField: UITextField!
    
    
    @IBAction func doneButton(_ sender: Any) {
        
        let userID = Auth.auth().currentUser?.uid
        self.ref = Database.database().reference()
        
        let paymentInfo = [
            "cardHolderName": nameTextField.text,
            "cardNo" : numberTextField.text,
            "expDate" : dateTextField.text,
            "cvv" : cvvTextField.text,
            "postalCode" : postalCodeTextField.text
        ]
        
       self.ref.child("users").child(userID!).child("paymentInfo").updateChildValues(paymentInfo)
        
        print("payment info successfully added")
        
        performSegue(withIdentifier: "paymentInfoToUserDashboard", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
