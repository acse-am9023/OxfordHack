//
//  LoginView.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 09/03/2024.
//

import SwiftUI
import metamask_ios_sdk

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showWalletView: Bool = false
    
    @ObservedObject var metaMaskSDK = MetaMaskSDK.shared(appMetadata)
    private static let appMetadata = AppMetadata(name: "ETH Oxford App", url: "https://ethoxfordapp.com")

    @State private var errorMessage = ""
    @State private var showError = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.blue.opacity(0.3), Color.clear]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 4) {
                    Text("Modelo")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .padding(.top, 80)
                        .hLeading()
                    
                    Text("Sign in using the methods below")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.white.opacity(0.7))
                        .hLeading()
                    
                    TextField("E-mail address", text: $email)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.08))
                        }
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .padding(.top, 60)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    Color.white.opacity(0.08)
                                )
                        }
                        .textInputAutocapitalization(.never)
                        .padding(.top, 4)
                        .padding(.bottom, 20)
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 150, height: 2)
                            .foregroundColor(.white.opacity(0.3))
                        
                        Text("OR")
                            .foregroundColor(.white.opacity(0.3))
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 150, height: 2)
                            .foregroundColor(.white.opacity(0.3))
                    }
                    .padding(.bottom, 40)
                    Button {
                        Task {
                            await connectSDK()
                        }
                    } label: {
                        HStack(spacing: 12) {
                            Image("metamask")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            
                            Text("Sign in with MetaMask")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                        .hLeading()
                        .padding(.leading, 56)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.08))
                                .frame(height: 50)
                        )
                        .padding(.bottom, 28)
                    }
                    
                    HStack(spacing: 12) {
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        
                        Text("Sign in with Google")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    .hLeading()
                    .padding(.leading, 70)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white.opacity(0.08))
                            .frame(height: 50)
                    )
                    
                    Text("By continuing, you agree to our [User Agreement](https://www.apple.com/uk/) and [Privacy Policy](https://www.apple.com/uk/)")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.60))
                        .hCenter()
                        .padding(.top, 60)
                        .padding(.horizontal, 12)
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 16)
            }
        }
    }
    
    func connectSDK() async {
        let result = await metaMaskSDK.connect()
        UserDefaults.standard.set(true, forKey: "signin")
//        settings.connectedMetaMask = true
        
        switch result {
        case let .failure(error):
            errorMessage = error.localizedDescription
            showError = true
        default:
            break
        }
    }
}

#Preview {
    LoginView()
        .preferredColorScheme(.dark)
}
