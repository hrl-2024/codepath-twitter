//
//  LoginViewController.swift
//  Twitter
//
//  Created by Henry Liu on 3/11/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            // don't ask for the login info again
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        let loginUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: loginUrl, success: {
            // the following code will be executed whenever the login successe
            
            // store the login info
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            // perform the segue
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("couldn't log in")
        })
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
