//
//  ViewController.swift
//  AppFBAuth20220306
//
//  Created by grace on 2022/3/6.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().signInAnonymously { (user, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else  {
                print(user.debugDescription)
            }
        }
    }


}

