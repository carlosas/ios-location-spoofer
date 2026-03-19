import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "location.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)

                Text("Location Spoofer")
                    .font(.title)
                    .fontWeight(.bold)

                if let location = locationManager.currentLocation {
                    VStack(spacing: 10) {
                        Text("Current Location:")
                            .font(.headline)

                        Text("Latitude: \(location.coordinate.latitude, specifier: "%.6f")")
                            .font(.body)

                        Text("Longitude: \(location.coordinate.longitude, specifier: "%.6f")")
                            .font(.body)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                } else {
                    Text("Waiting for location...")
                        .foregroundColor(.gray)
                }

                Spacer()

                VStack(spacing: 15) {
                    Text("To simulate locations:")
                        .font(.headline)

                    Text("1. Run the app from Xcode")
                    Text("2. Go to Debug > Simulate Location")
                    Text("3. Select a GPX file or location")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding()
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
