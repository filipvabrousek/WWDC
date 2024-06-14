
import MapKit
import SwiftUI

struct MapGenericView: View {
   
    
    let deviceLocations = [
        CLLocationCoordinate2D(latitude: 54.1234, longitude: -83.1234),
        CLLocationCoordinate2D(latitude: 54.2235, longitude: -83.2235),
        CLLocationCoordinate2D(latitude: 54.3234, longitude: -83.3234),
        CLLocationCoordinate2D(latitude: 54.4235, longitude: -83.4235),
        CLLocationCoordinate2D(latitude: 54.5234, longitude: -83.5234),
        CLLocationCoordinate2D(latitude: 54.6235, longitude: -83.6235),
        CLLocationCoordinate2D(latitude: 51.6235, longitude: -83.6235)
       
    ]
    
    var body: some View {
       
        VStack {
            
            
            Map {
                
                  MapPolyline(coordinates: deviceLocations)
                    .stroke(.orange, lineWidth: 3.0)
                
                Marker(item: .init(placemark: .init(coordinate: .init(latitude: 54.4235, longitude: -83.4235))))
                    .mapItemDetailSelectionAccessory()
                
                
                MapPolygon(.init(points: deviceLocations.map {MKMapPoint($0)}, count: deviceLocations.count))
                    .foregroundStyle(.green.opacity(0.3))
                    
                
                
            }.mapControls {
                MapCompass()
            }
            
           // MapZoomStepper()
        } 
    } 
}
        
