import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                Map(coordinateRegion: $region, showsUserLocation: true)
                    .cornerRadius(12)
                    .onChange(of: locationManager.currentLocation) { newLocation in
                        if let coordinate = newLocation?.coordinate {
                            region.center = coordinate
                        }
                    }

                if let location = locationManager.currentLocation {
                    VStack(spacing: 6) {
                        Text("Current Location")
                            .font(.headline)

                        Text("Lat: \(location.coordinate.latitude, specifier: "%.6f")")
                            .font(.body)
                            .monospacedDigit()

                        Text("Lon: \(location.coordinate.longitude, specifier: "%.6f")")
                            .font(.body)
                            .monospacedDigit()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                } else {
                    Text("Waiting for location...")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .navigationTitle("GPS Spoofer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
