//
//  ViewController.swift
//  GoogleMapsRoute
//
//  Created by kkolontay on 5/29/18.
//  Copyright © 2018 com.kkolontay. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
  private var mapView: GMSMapView?
  private var pathCoordinates: [CLLocationCoordinate2D] = []
  private var placeMarker: PlaceMarker?
  
  override func loadView() {
    let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.2, zoom: 6.0)
    mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    mapView?.isMyLocationEnabled = false
    view = mapView
    displayPath(pathCoordinates)
    placeMarker = PlaceMarker(pathCoordinates)
    
    // put some marker coordinates
    placeMarker?.pointsMarkerPlace = []
    
    placeMarker?.displayMarkerPlaces({
      [weak self] marker in
      DispatchQueue.main.async {
        marker.map = self?.mapView
      }
    })
  }
  
  func displayPath(_ coordinates: [CLLocationCoordinate2D]) {
    let path = GMSMutablePath()
    for coordinate in coordinates {
      path.addLatitude(coordinate.latitude, longitude:coordinate.longitude)
    }
    let polyline = GMSPolyline(path: path)
    polyline.strokeColor = .blue
    polyline.strokeWidth = 3.0
    polyline.map = mapView
    
  }
}

