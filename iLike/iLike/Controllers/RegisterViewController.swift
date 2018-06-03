//
//  RegisterViewController.swift
//  iLike
//
//  Created by HongQuan on 2018/06/02.
//  Copyright © 2018年 Roan.Hong. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.yellow
        self.showRegisterView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.registerUserData()
    }

    func registerUserData () {
        
    }
    func showRegisterView() {
        if (FBSDKAccessToken.current() != nil) {
            // User is already logged in, do work such as go to next view controller.
            //self.logUserData()
            performSegue(withIdentifier: "FirstViewController", sender: self)
        } else if (FBSDKAccessToken.current() != nil) {
            // User is already logged in, do work such as go to next view controller.
            //self.logUserData()
            performSegue(withIdentifier: "FirstViewController", sender: self)
        } else if (FBSDKAccessToken.current() != nil) {
            // User is already logged in, do work such as go to next view controller.
            //self.logUserData()
            performSegue(withIdentifier: "FirstViewController", sender: self)
        } else {
            //////////////////////////////////
            self.showMailRegButton()
            self.showFBLoginButton()
            self.showTWLoginButton()
            
            self.showLoginViewButton()
            
        }
    }
    
    func showMailRegButton() {
        let maregisterButton = UIButton(frame:CGRect(x:0,y:0,width:200,height:30))
        maregisterButton.setTitle("Register with E-mail", for: UIControlState())
        maregisterButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        maregisterButton.setTitleColor(UIColor.white, for: UIControlState())
        maregisterButton.backgroundColor = UIColor.darkGray
        maregisterButton.center = self.view.center
        maregisterButton.layer.masksToBounds = true
        //maregisterButton.layer.cornerRadius = 20.0
        maregisterButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height - 500)
        maregisterButton.addTarget(self, action: #selector(self.onClickRegisterButton), for: .touchUpInside)
        self.view.addSubview(maregisterButton)
    }
    func showFBLoginButton() {
        let fbloginButton : FBSDKLoginButton = FBSDKLoginButton()
        var newFrame : CGRect = fbloginButton.frame
        newFrame.size = CGSize.init(width: 200, height: 30)
        fbloginButton.frame = newFrame;
        fbloginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        //fbloginButton.frame(forAlignmentRect: CGRect(x:0,y:0,width:200,height:30))
        fbloginButton.center = self.view.center
        fbloginButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height - 450)
        fbloginButton.readPermissions = ["public_profile", "email", "user_friends"]
        fbloginButton.delegate = self
        self.view.addSubview(fbloginButton)
    }
    func showTWLoginButton() {
        let twlogInButton : TWTRLogInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(session?.userName)");
            } else {
                print("error: \(error?.localizedDescription)");
            }
        })
        var newFrame : CGRect = twlogInButton.frame
        newFrame.size = CGSize.init(width: 200, height: 30)
        twlogInButton.frame = newFrame;
        twlogInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        //twlogInButton.frame(forAlignmentRect: CGRect(x:0,y:0,width:200,height:30))
        //twlogInButton
        twlogInButton.center = self.view.center
        twlogInButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height - 400)
        self.view.addSubview(twlogInButton)
    }
    
    func showLoginViewButton() {
        let regiButton = UIButton(frame:CGRect(x:0,y:0,width:200,height:30))
        regiButton.setTitle("Switch to Log in View", for: UIControlState())
        regiButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        regiButton.setTitleColor(UIColor.white, for: UIControlState())
        regiButton.backgroundColor = UIColor.darkGray
        regiButton.center = self.view.center
        regiButton.layer.masksToBounds = true
        //regiButton.layer.cornerRadius = 20.0
        regiButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height - 50)
        regiButton.addTarget(self, action: #selector(self.onClickSwichToLoginViewButton), for: .touchUpInside)
        self.view.addSubview(regiButton)
    }
    
    @objc func onClickRegisterButton() {
        self.present(InputMailViewController(), animated: true, completion: nil)
    }
    
    @objc func onClickSwichToLoginViewButton() {
        self.present(LoginViewController(), animated: true, completion: nil)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        // <#code#>
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
       // <#code#>
    }
}
