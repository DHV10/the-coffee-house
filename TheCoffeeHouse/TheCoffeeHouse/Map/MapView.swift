//
//  MapView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 21/10/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.dismiss) var dismiss
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State var searchText = ""
    
    let locations = [
        Location(name: "FPT Software, Tan Xa, Thach That, Ha Noi", latitude: 21.0095717, longitude: 105.5313047)
    ]
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: locations) { location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                    VStack {
                        Image("carbon_location-filled")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        Text(location.name)
                            .font(.caption)
                            .padding(5)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                }
            }
            .ignoresSafeArea()
            .onAppear {
                // Auto-center to the first location on load
                if let firstLocation = locations.first {
                    centerMapOnLocation(firstLocation)
                }
            }
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("back_white")
                    })
                    SearchView(searchText: $searchText)
                }
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
    
    private func centerMapOnLocation(_ location: Location) {
        region.center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        region.span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // Adjust zoom if necessary
    }
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
