//
//  PinCodeViewController.swift
//  iLike
//
//  Created by HongQuan on 2018/06/02.
//  Copyright © 2018年 Roan.Hong. All rights reserved.
//

import Foundation
class PinCodeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.green
        self.showInputPincodeView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.registerUserData()
    }
    
    func showInputPincodeView(){

        let resendhint = UILabel(frame:CGRect(x:0,y:0,width:300,height:30))
        resendhint.text = "resend a PinCode?"
        resendhint.font = UIFont.systemFont(ofSize: 16)
        //resendhint.backgroundColor = UIColor.darkGray
        resendhint.center = self.view.center
        resendhint.layer.masksToBounds = true
        //sendButton.layer.cornerRadius = 20.0
        resendhint.layer.position = CGPoint(x: self.view.bounds.width/2, y:50/*self.view.bounds.height - 500*/)
        //resendhint.addTarget(self, action: #selector(self.onClickSendRegisterInfoButton), for: .touchUpInside)
        self.view.addSubview(resendhint)
        
    }
}
