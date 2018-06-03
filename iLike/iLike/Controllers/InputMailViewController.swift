//
//  InputMailViewController.swift
//  iLike
//
//  Created by HongQuan on 2018/06/02.
//  Copyright © 2018年 Roan.Hong. All rights reserved.
//

import Foundation
class InputMailViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate{
    private var mailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.green
        self.showInputMailView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.registerUserData()
    }
    
    func showInputMailView(){
        let mailhint = UILabel(frame:CGRect(x:0,y:0,width:300,height:30))
        mailhint.text = "Input a Mail address"
        mailhint.font = UIFont.systemFont(ofSize: 16)
        //mailhint.backgroundColor = UIColor.darkGray
        mailhint.center = self.view.center
        mailhint.layer.masksToBounds = true
        mailhint.layer.cornerRadius = 3.0
        mailhint.layer.position = CGPoint(x: self.view.bounds.width/2, y:50/*self.view.bounds.height - 500*/)
        //mailhint.addTarget(self, action: #selector(self.onClickSendRegisterInfoButton), for: .touchUpInside)
        self.view.addSubview(mailhint)
        
        mailField = UITextField(frame: CGRect(x:0,y:0,width:300,height:30))
        mailField.delegate = self as UITextFieldDelegate
        mailField.keyboardType = UIKeyboardType.emailAddress
        mailField.returnKeyType = .done
        mailField.clearButtonMode = UITextFieldViewMode.whileEditing
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        tapGestureRecognizer.delegate = self as UIGestureRecognizerDelegate
        self.view.addGestureRecognizer(tapGestureRecognizer)
        self.view.addSubview(mailField)
        
        let sendButton = UIButton(frame:CGRect(x:0,y:0,width:80,height:30))
        sendButton.setTitle("Send", for: UIControlState())
        sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        sendButton.setTitleColor(UIColor.white, for: UIControlState())
        sendButton.backgroundColor = UIColor.darkGray
        sendButton.center = self.view.center
        sendButton.layer.masksToBounds = true
        //sendButton.layer.cornerRadius = 20.0
        sendButton.layer.position = CGPoint(x: self.view.bounds.width/4, y:self.view.bounds.height - 50)
        sendButton.addTarget(self, action: #selector(self.onClickSendRegisterInfoButton), for: .touchUpInside)
        self.view.addSubview(sendButton)
        
        let backButton = UIButton(frame:CGRect(x:0,y:0,width:80,height:30))
        backButton.setTitle("Back", for: UIControlState())
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        backButton.setTitleColor(UIColor.white, for: UIControlState())
        backButton.backgroundColor = UIColor.darkGray
        backButton.center = self.view.center
        backButton.layer.masksToBounds = true
        //backButton.layer.cornerRadius = 20.0
        backButton.layer.position = CGPoint(x: (self.view.bounds.width/4 * 3), y:self.view.bounds.height - 50)
        backButton.addTarget(self, action: #selector(self.onClickBackToLoginViewButton), for: .touchUpInside)
        self.view.addSubview(backButton)
        
    }
    @objc func onClickSendRegisterInfoButton() {
        let alert: UIAlertController = UIAlertController(title: "", message: "このメールで登録しますか？", preferredStyle:  UIAlertControllerStyle.alert)

        // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("OK")
            UIUtil.toast("登録情報を送信します。")
            self.present(PinCodeViewController(), animated: true, completion: nil)
        })
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            print("Cancel")
        })
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func onClickBackToLoginViewButton() {
        self.present(LoginViewController(), animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard(_ gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
