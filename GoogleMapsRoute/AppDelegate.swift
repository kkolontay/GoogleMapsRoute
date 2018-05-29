//
//  AppDelegate.swift
//  GoogleMapsRoute
//
//  Created by kkolontay on 5/29/18.
//  Copyright © 2018 com.kkolontay. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    GMSServices.provideAPIKey("AIzaSyCa2pTrEOLmiPADR88Wx25jHgUyZ1KMFVU")
    GMSPlacesClient.provideAPIKey("AIzaSyCa2pTrEOLmiPADR88Wx25jHgUyZ1KMFVU")
    return true
  }

}

