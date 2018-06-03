//
//  UIUtil.swift
//  iLike
//
//  Created by HongQuan on 2018/06/02.
//  Copyright © 2018年 Roan.Hong. All rights reserved.
//

import Foundation
class UIUtil {
    
    class func toast (_ message : String) {
        let alert = UIAlertView(title: "", message: message, delegate: nil, cancelButtonTitle: nil)
        alert.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            alert.dismiss(withClickedButtonIndex: 0, animated: true)
        }
        
    }
    
    ///ビルドモードを取得
    class var buildMode: String {
        get {
            if (UIUtil.isDebug){return "Debug"}
            if (UIUtil.isTest){return "Test"}
            
            return "Release"
        }
    }
    /** デバッグモードかを取得 */
    class var isDebug: Bool {
        get {
            #if DEBUG
            return true
            #else
            return false
            #endif
        }
    }
    
    /** testモードかを取得 */
    class var isTest: Bool {
        get {
            #if TEST
            return true
            #else
            return false
            #endif
        }
    }
}
