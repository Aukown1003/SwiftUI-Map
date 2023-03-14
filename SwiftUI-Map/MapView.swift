//
//  MapView.swift
//  SwiftUI-Map
//
//  Created by 桑野友輔 on 2023/03/13.
//

import SwiftUI
import MapKit

enum MapType {
    case standard
    case statellite
    case hybird
}
struct MapView: UIViewRepresentable {
    let searchKey: String
    let mapType: MapType
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print("検索キーワード:\(searchKey)")
        
        switch mapType {
        case .standard:
            uiView.preferredConfiguration = MKStandardMapConfiguration(elevationStyle: .flat)
        case .statellite:
            uiView.preferredConfiguration = MKImageryMapConfiguration()
        case .hybird:
            uiView.preferredConfiguration = MKHybridMapConfiguration()
        }
        
        let geocoder = CLGeocoder()
        
        
        geocoder.geocodeAddressString(
            searchKey,
            //completionHandler以降がクロージャ、特定の条件が満たされたときに実行
            completionHandler: { (placemarks, error) in
                if let placemarks,
                   let firstPlacemark = placemarks.first,
                   let location = firstPlacemark.location {
                
                    let targetCoordinate = location.coordinate
                    
                    print("緯度経度：\(targetCoordinate)")
                    
                    //ピンの作成
                    let pin = MKPointAnnotation()
                    
                    pin.coordinate = targetCoordinate
                    
                    pin.title = searchKey
                    
                    uiView.addAnnotation(pin)
                    uiView.region = MKCoordinateRegion(
                        center: targetCoordinate,
                        latitudinalMeters: 500.0,
                        longitudinalMeters: 500.0
                    )
                }
            })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "羽田空港", mapType:.standard)
    }
}
