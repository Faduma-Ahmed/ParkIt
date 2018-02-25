//
//  CarRegistrationViewController.swift
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

class CarRegistrationViewController: UIViewController {
    
    var ref: DatabaseReference!
    
   // var window: UIWindow?
    
    @IBOutlet weak var carBrandTextField: UITextField!
    
    @IBOutlet weak var carModelTextField: UITextField!
    
    @IBOutlet weak var licenseTextField: UITextField!
    
    @IBAction func nextButton(_ sender: Any) {
        
        let userID = Auth.auth().currentUser?.uid
        self.ref = Database.database().reference()
        
        let carInfo = [
            "carBrand": carBrandTextField.text,
            "carModel": carModelTextField.text,
            "license": licenseTextField.text,
        ]
        
        self.ref.child("users").child(userID!).child("carInfo").updateChildValues(carInfo)
        
        print("car info successfully added")
        
        performSegue(withIdentifier: "carRegistrationToPaymentInfo", sender: self)
        
        // now show the payment info screen
//        let expiryDatePicker = MonthYearPickerView()
//        let window = UIWindow(frame: UIScreen.main.bounds)
//        w
//        expiryDatePicker.onDateSelected = { (month: Int, year: Int) in
//            let string = String(format: "%02d/%d", month, year)
//            NSLog(string) // should show something like 05/2015
//        }
        
        //                    let rootVC = BrowseProductsViewController()
        //                    let navigationController = UINavigationController(rootViewController: rootVC)
        //                    let window = UIWindow(frame: UIScreen.main.bounds)
        //                    window.rootViewController = navigationController;
        //                    window.makeKeyAndVisible()
        //                    self.window = window
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
