//
//  AddFriendViewController.swift
//  HobbyTracker
//
//  Created by Ben Gohlke on 7/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

// delegator critical steps
// step 1, create  delegate protocol
// step 2 create delegate proprty on delegator file of type delegate
// step 3 call methods on delegate when needed


// delegate
protocol AddFriendDelegate {
    func newFriendAdded(friend: Friend)
}


class AddFriendViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    
    var delegate: AddFriendDelegate?
    
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        guard let name = nameTextField.text,
        let hometown = hometownTextField.text,
            !name.isEmpty,
            !hometown.isEmpty else { return}
        
        var friend = Friend(name: name, hometown: hometown, hobbies: [])
        
        
        
        if let hobby1 = hobby1TextField.text,
            !hobby1.isEmpty  {
            friend.hobbies.append(hobby1)
        }
        
        if let hobby2 = hobby2TextField.text,
                  !hobby2.isEmpty  {
                  friend.hobbies.append(hobby2)
        
        }
        
        if let hobby3 = hobby3TextField.text,
                  !hobby3.isEmpty  {
                  friend.hobbies.append(hobby3)
       }
        
        delegate?.newFriendAdded(friend: friend)
        dismiss(animated: true, completion: nil)
        
        
    }
        
}

extension AddFriendViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
