//
//  MKCoordinateRegion+Extensions.swift
//  Sicredi
//
//  Created by Renato Ferraz on 16/03/21.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    static var defaultRegion: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 29.726819, longitude: -95.393692), span: MKCoordinateSpan(
            latitudeDelta: 0.0075,
            longitudeDelta: 0.0075
        ))
    }
    
}
