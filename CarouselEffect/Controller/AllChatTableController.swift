//
//  AllChatTableController.swift
//  CarouselEffect
//
//  Created by Mirzayantie on 23/09/2019.
//  Copyright © 2019 Mirzayantie. All rights reserved.
//

import UIKit
import Firebase

class AllChatTableController: UITableViewController {
    
    @IBOutlet var messageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.register(UINib(nibName: "CustomAllChatCell", bundle: nil) , forCellReuseIdentifier: "AllChatCell")
        
        checkIfUserIsLoggedIn()
        
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser != nil {
            // User is signed in.
            let uid = Auth.auth().currentUser?.uid
            
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String : AnyObject] {
                    // ???????????????????not functioning yet
                    self.navigationItem.title = dictionary ["name"] as? String
                }
                }, withCancel: nil)
            
            } else {
                // No user is signed in.
                // ...
            }
        }
        // MARK: - Table view data source
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return 3
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllChatCell", for: indexPath) as! CustomAllChatCell
            cell.senderName.text = "Lala"
            // Configure the cell...
            
            return cell
        }
        
        
        
}
