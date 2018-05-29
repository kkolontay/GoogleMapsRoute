//
//  PlaceMarker.swift
//  GoogleMapsRoute
//
//  Created by kkolontay on 5/29/18.
//  Copyright © 2018 com.kkolontay. All rights reserved.
//

import UIKit
import GoogleMaps

class PlaceMarker {
  private var markerPlaces: [CLLocationCoordinate2D] = []
  typealias PlaceMarketSettings = (GMSMarker) -> Void
  private var pathPlaces: [CLLocationCoordinate2D]?
  
  var pointsMarkerPlace: [CLLocationCoordinate2D] {
    set {
      markerPlaces = newValue
    }
    get {
      return markerPlaces
    }
  }
  
  init(_ pathPlaces: [CLLocationCoordinate2D]) {
    self.pathPlaces = pathPlaces
  }
  
  func displayMarkerPlaces(_ handler: PlaceMarketSettings) {
    guard let pathPlaces = pathPlaces else {
      return
    }
    var dinamicMarkerPlaces: [CLLocationCoordinate2D] = []
    for pathCoordinate in pathPlaces {
      dinamicMarkerPlaces = markerPlaces
      for index in 0 ..< dinamicMarkerPlaces.count {
        let path = convertorCoordinate(pathCoordinate)
        let mark = convertorCoordinate(dinamicMarkerPlaces[index])
        if path.distance(from: mark) < 5000 {
          handler(markerCreator(dinamicMarkerPlaces[index]))
          markerPlaces.remove(at: index)
        }
      }
    }
  }
  
 private func convertorCoordinate(_ coordinate: CLLocationCoordinate2D) -> CLLocation {
    return CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
  }
  
 private func markerCreator(_ coordinate: CLLocationCoordinate2D) -> GMSMarker {
    let marker = GMSMarker()
    marker.position = coordinate
    marker.title = "Gas Station"
    return marker
  }
}
