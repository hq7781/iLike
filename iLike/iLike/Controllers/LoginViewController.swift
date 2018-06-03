//
//  LoginViewController.swift
//  iLike
//
//  Created by HongQuan on 2018/06/02.
//  Copyright © 2018年 Roan.Hong. All rights reserved.
//

import Foundation

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.yellow
        self.showLoginView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.LoginUserData()
    }
    
    /*******************************
     * show view
     *******************************/
    func showLoginView() {
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
            self.showMailLoginButton()
            self.showFBLoginButton()
            self.showTWLoginButton()
            
            self.showRegisterViewButton()

        }
    }
    
    func showMailLoginButton() {
        let maloginButton = UIButton(frame:CGRect(x:0,y:0,width:200,height:30))
        maloginButton.setTitle("Log in with E-mail", for: UIControlState())
        maloginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        maloginButton.setTitleColor(UIColor.white, for: UIControlState())
        maloginButton.backgroundColor = UIColor.darkGray
        maloginButton.center = self.view.center
        maloginButton.layer.masksToBounds = true
        //maloginButton.layer.cornerRadius = 20.0
        maloginButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height - 500)
        maloginButton.addTarget(self, action: #selector(self.onClickLoginButton), for: .touchUpInside)
        self.view.addSubview(maloginButton)
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
    
    func showRegisterViewButton() {
        let regiButton = UIButton(frame:CGRect(x:0,y:0,width:200,height:30))
        regiButton.setTitle("Switch to Register View", for: UIControlState())
        regiButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        regiButton.setTitleColor(UIColor.white, for: UIControlState())
        regiButton.backgroundColor = UIColor.darkGray
        regiButton.center = self.view.center
        regiButton.layer.masksToBounds = true
        //regiButton.layer.cornerRadius = 20.0
        regiButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height - 50)
        regiButton.addTarget(self, action: #selector(self.onClickSwichToRegViewButton), for: .touchUpInside)
        self.view.addSubview(regiButton)
    }
    
    func LoginUserData () {
        
    }
    /*******************************
     * opreate
     *******************************/
    
    @objc func onClickLoginButton() {
        self.present(InputMailViewController(), animated: true, completion: nil)
    }
    
    @objc func onClickSwichToRegViewButton() {
        self.present(RegisterViewController(), animated: true, completion: nil)
    }
    
    // Facebook delegete
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
       //  <#code#>
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        // <#code#>
    }
    
}
