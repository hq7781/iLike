//
//  FirstViewController.swift
//  iLike
//
//  Created by HongQuan on 2018/05/23.
//  Copyright © 2018年 Roan.Hong. All rights reserved.
//

import UIKit
import CoreLocation
import GooglePlaces
import GooglePlacePicker
//import TwitterCore
//import TwitterKit

class FirstViewController: UIViewController, CLLocationManagerDelegate, FBSDKLoginButtonDelegate {
    
    var placesClient: GMSPlacesClient!
    
    let locationManager = CLLocationManager()
    
    var nameLabel: UILabel = UILabel()
    var addressLabel: UILabel = UILabel()
    var shareButton: UIButton = UIButton()
    var getPlaceButton: UIButton = UIButton()
    var getPickerButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.showOpreationView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.logUserData()
    }

    func showOpreationView() {
        /////////////////////////////////////
        shareButton = UIButton(frame:CGRect(x:0,y:0,width:100,height:60))
        shareButton.setTitle("Share", for: UIControlState())
        shareButton.setTitleColor(UIColor.white, for: UIControlState())
        shareButton.backgroundColor = UIColor.blue
        shareButton.center = self.view.center
        shareButton.layer.masksToBounds = true
        shareButton.layer.cornerRadius = 20.0
        shareButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height - 100)
        shareButton.addTarget(self, action: #selector(self.onClickShareButton), for: .touchUpInside)
        self.view.addSubview(shareButton)
        
        /////////////////////////////////////
        getPlaceButton = UIButton(frame:CGRect(x:0,y:0,width:100,height:60))
        getPlaceButton.setTitle("GetCurPlace", for: UIControlState())
        getPlaceButton.setTitleColor(UIColor.white, for: UIControlState())
        getPlaceButton.backgroundColor = UIColor.blue
        getPlaceButton.center = self.view.center
        getPlaceButton.layer.masksToBounds = true
        getPlaceButton.layer.cornerRadius = 20.0
        getPlaceButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height - 200)
        getPlaceButton.addTarget(self, action: #selector(self.onClickGetPlaceButton), for: .touchUpInside)
        self.view.addSubview(getPlaceButton)
        
        /////////////////////////////////////
        getPickerButton = UIButton(frame:CGRect(x:0,y:0,width:100,height:60))
        getPickerButton.setTitle("GetCurPicker", for: UIControlState())
        getPickerButton.setTitleColor(UIColor.white, for: UIControlState())
        getPickerButton.backgroundColor = UIColor.blue
        getPickerButton.center = self.view.center
        getPickerButton.layer.masksToBounds = true
        getPickerButton.layer.cornerRadius = 20.0
        getPickerButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height - 300)
        getPickerButton.addTarget(self, action: #selector(self.onClickGetPickPlaceButton), for: .touchUpInside)
        self.view.addSubview(getPickerButton)
        
    }
    
    /*******************************
     * opreate
     *******************************/
    
    @objc func onClickShareButton() {
        
    }
    /*
     現在の場所を取得する
     */
    @objc func onClickGetPlaceButton() {
        placesClient.currentPlace(callback: {
            (placeLikelihoodList,error) -> Void in
            if error != nil {
                print("Pick Place error: \(String(describing: error?.localizedDescription))")
                return
            }
            self.nameLabel.text = "No current place"
            self.addressLabel.text = ""
            
            if placeLikelihoodList != nil {
                let place = placeLikelihoodList?.likelihoods.first?.place
                if place != nil {
                    self.nameLabel.text = place?.name
                    self.addressLabel.text = place?.formattedAddress?.components(separatedBy: ", ").joined(separator: " ")
                    print("Place name: \(self.nameLabel.text ?? "unkown") Addr: \(String(describing: self.addressLabel.text))")
                }
            }
        })
    }
    /*
     現在のPlace場所を取得する
     */
    @objc func onClickGetPickPlaceButton() {
        let center = CLLocationCoordinate2D(latitude: 37.788204, longitude: -122.411937)
        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001,
                                               longitude: center.longitude + 0.001)
        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001,
                                               longitude: center.longitude - 0.001)
        
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePicker(config: config)
        
        placePicker.pickPlace(callback: {(place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                self.nameLabel.text = place.name
                self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                    .joined(separator: "\n")
            } else {
                self.nameLabel.text = "No place selected"
                self.addressLabel.text = ""
            }
        })
        
    }
    
    func logUserData() {
        let graphRequest = FBSDKGraphRequest(graphPath: "Me", parameters: nil)
        graphRequest?.start(completionHandler: {
            (connection, result, error) -> Void in
            if error != nil {
                print(error)
            } else {
                print(result)
            }
        })
    }
    /*
    // firebace SDK
    func createUser(withEmail email:String, password:String, completion:Any?) ->Void {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            // ...
        }
    }
    // firebace SDK
    func signIn(withEmail email:String, password:String, completion:Any?) ->Void {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            // ...
        }
    }
        // firebace SDK
    func signOut() ->Bool {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            return false
        }
        return true
    }
     */
    
    /*******************************
     * delegate
     *******************************/
    // MARK: - <FBSDKLoginButtonDelegate> Methods
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("User Logged In")
        
        if ((error) != nil) {
            // Process error
        } else if result.isCancelled {
            // Handle cancellations
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email") {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    
    // MARK: - <CLLocationManagerDelegate> Methods
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        print("\(#function)");
    }
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        print("\(#function)");
    }
    
    // ユーザが位置情報の使用を許可変更時
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined: // ユーザが位置情報の使用を許可していない
            if (self.locationManager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization))) {
                self.locationManager.requestWhenInUseAuthorization()
            }
        case .denied:break
        case .authorizedAlways:
            break
            // ユーザが位置情報の使用を常に許可している場合
//            for beaconRegion in self.beaconRegionArray {
//                self.locationManager.startMonitoring(for: beaconRegion)
//                self.locationManager.startRangingBeacons(in: beaconRegion)
//            }
        case .authorizedWhenInUse:
            break
            // ユーザが位置情報の使用を使用中のみ許可している場合
//            for beaconRegion in self.beaconRegionArray {
//                self.locationManager.startMonitoring(for: beaconRegion)
//                self.locationManager.startRangingBeacons(in: beaconRegion)
//            }
        default: break
        }
        print("\(#function), status: \(status)");
    }
    
}

