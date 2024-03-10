//
//  DeployTokenView.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 10/03/2024.
//

import SwiftUI
import MapKit
import LocalAuthentication

struct DeployTokenView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var viewModel = ContentViewModel()
    
    @State private var toggleLocation: Bool = false
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @State private var tokenName: String = ""
    @State private var tokenDescription: String = ""
    @State private var tokenPrice: NSNumber? = nil
    @State private var faceIdApproved: Bool = false

    var capturedImage: UIImage?

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 12) {
                    Text("Image")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .hLeading()
                    
                    if let capturedImage = capturedImage {
                        Image(uiImage: capturedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.screenWidth - 96)
                            .cornerRadius(16)
                    } else {
                        Image("icon3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.screenWidth - 96)
                            .cornerRadius(16)
                    }
                    
                    HStack {
                        Text("Location")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .hLeading()
                        
                        Toggle("", isOn: $toggleLocation)
                    
                    }
                    .padding(.top, 12)
                    
                    if toggleLocation {
                        HStack {
                            Text("Coordinates")
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                            
                            Text(viewModel.userCoordinates)
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                            
                            Spacer()
                        }
                        
                        Map(coordinateRegion: $mapRegion, showsUserLocation: true, userTrackingMode: .constant(.follow))
                            .frame(width: UIScreen.screenWidth - 32, height: 240)
                            .cornerRadius(16)
                            .transition(.opacity)
                            .onAppear(perform: {
                                viewModel.checkIfLocationIsEnabled()
                            })
                    }
                    
                    
                    Text("Metadata")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .hLeading()
                    
                    HStack {
                        Text("Name")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        
                        Spacer()
                    }
                    
                    TextField("Enter name of token", text: $tokenName)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.08))
                        }
                    
                    HStack {
                        Text("Description")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        
                        Spacer()
                    }
                    
                    TextField("Enter description of token", text: $tokenDescription)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.08))
                        }
                    
                    HStack {
                        Text("Price")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        
                        Spacer()
                    }
                    
                    TextField("Enter price in XTZ", value: $tokenPrice, formatter: viewModel.priceFormatter)
                        .keyboardType(.decimalPad)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.08))
                        }
                    
                    Button {
                        authenticate()
                    } label: {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 54)
                            .overlay(
                                Text("🚀 Tokenise 3D Model")
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))

                                    .foregroundStyle(.white)
                            )
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                .navigationTitle("Deploy Token")
                .animation(.easeInOut, value: toggleLocation)
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.presentationMode.wrappedValue.dismiss()
                    }                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

#Preview {
    DeployTokenView()
        .preferredColorScheme(.dark)
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    @Published var userCoordinates: String = "--º N, --º W"
    @Published var mapRegion = MKCoordinateRegion()

    override init() {
        super.init()
        checkIfLocationIsEnabled()
    }

    func checkIfLocationIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.delegate = self
            locationManager?.requestWhenInUseAuthorization() // Request authorization
            locationManager?.startUpdatingLocation() // Start updating location
        } else {
            print("Show an alert letting them know this is off")
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }

    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }

        switch locationManager.authorizationStatus {
        case .notDetermined, .restricted, .denied:
            print("Location access not authorized.")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            userCoordinates = String(format: "%.4fº N, %.4fº W", latitude, longitude)
            mapRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        }
    }

    
    let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimum = 0
        return formatter
    }()
}
