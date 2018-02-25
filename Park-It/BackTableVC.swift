//
//  BackTableVC.swift
//  Park-It
//
//  Created by Kinshuk Singh on 2018-02-24.
//  Copyright © 2018 Kinshuk. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController {
    
    var tableArray = [String]()
    
    override func viewDidLoad() {
        tableArray = ["Location Settings", "About ParkIT", "Personal Info", "History", "Payment", "FAQ", "Settings", "Contact Us"]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var destVC = segue.destination as? ViewController
//        var indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow()!
//    }
    
    
}
