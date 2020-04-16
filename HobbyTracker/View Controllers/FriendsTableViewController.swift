//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Ben Gohlke on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController {
    
    var friends: [Friend] = [
        Friend(name: "Jimmy", hometown: "LA", hobbies: ["Basketball", "Frisbee", "Golf"])
    ]
    
    @IBOutlet weak var tableView: UITableView!
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "AddFriendModalSegue" {
            if let addVC = segue.destination as? AddFriendViewController {
                addVC.delegate = self
            }
        } else if segue.identifier == "ShowFriendDetailSegue" {
            if let detailVC = segue.destination as? FriendDetailViewController ,
                let indexPath = tableView.indexPathForSelectedRow {
                let friend = friends[indexPath.row]
            
            
        
                detailVC.friend = friend
            }
        
        }
        
        
    }
}


extension FriendsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        
        let friend = friends[indexPath.row]
        cell.friend = friend
        return cell
    }
}

// delegate
// step 4 adopt and conform to the delegate, lines 51 - 54
// step 5 set self as delegate when delegator is created, line 23

extension FriendsTableViewController: AddFriendDelegate {
    func newFriendAdded(friend: Friend) {
        friends.append(friend)
        tableView.reloadData()
   
    
    }
    
}

// add vc  as a a data source in main story   drag control from table to VC
