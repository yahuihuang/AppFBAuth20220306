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
        
        signIn()
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                // Login Success
                self.whenSignIn()
            } else {
                // Login Fail
                self.whenSignOut()
            }
        }
    }
    
    func signIn() {
        Auth.auth().signInAnonymously { (user, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else  {
                print(user.debugDescription)
            }
        }
        
    }

    func signOut() {
        do{
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func whenSignIn() {
        print(Auth.auth().currentUser?.uid ?? "")
    }
    
    func whenSignOut() {
        print("SignOut")
    }

    @IBAction func inAction(_ sender: Any) {
        signIn()
    }
    
    @IBAction func outAction(_ sender: Any) {
        signOut()
    }
}

