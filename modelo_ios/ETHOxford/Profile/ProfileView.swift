//
//  ProfileView.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 09/03/2024.
//

import SwiftUI

struct ProfileView: View {
    init() {
        var titleFont = UIFont.preferredFont(forTextStyle: .largeTitle) 
        titleFont = UIFont(
            descriptor:
                titleFont.fontDescriptor
                .withDesign(.rounded)?
                .withSymbolicTraits(.traitBold)
                ??
                titleFont.fontDescriptor,
            size: titleFont.pointSize
        )
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: titleFont]
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Image("icon3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 68, height: 68)
                            .cornerRadius(50)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Artemiy Malyshau")
                                .font(.system(size: 22, weight: .regular, design: .rounded))
                            
                            Text(shortenAddress(address: "0x057074B001F934cC5dD6B1d335940b5a1685c0Da"))
                                .font(.system(size: 14, weight: .regular, design: .rounded))
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                    }
                }
                
                Section(header: Text("Connections")) {
                    HStack {
                        Image("metamask")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 26, height: 26)
                        
                        Text("MetaMask")
                        
                        Spacer()
                        
                        Text("Connected")
                            .foregroundStyle(.white.opacity(0.7))
                    }
                    
                    HStack {
                        Image("google")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 26, height: 26)
                        
                        Text("Google")
                        
                        Spacer()
                        
                        Text("Not Connected")
                            .foregroundStyle(.white.opacity(0.7))
                    }
                }
                
                Section(header: Text("General")) {
                    NavigationLink {
                        
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "info")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 10, height: 10)
                                .padding(10)
                                .background(.green)
                                .cornerRadius(8)
                            
                            Text("About")
                        }
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "gearshape")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .padding(5)
                                .background(.blue)
                                .cornerRadius(8)
                            
                            Text("Settings")
                        }
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18)
                                .padding(6)
                                .background(.orange)
                                .cornerRadius(8)
                            
                            Text("Account Details")
                        }
                    }
                }
                
                Section {
                    Button {
                        UserDefaults.standard.set(false, forKey: "signin")
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "arrow.uturn.left")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18)
                                .padding(6)
                                .background(.red)
                                .cornerRadius(8)
                            
                            Text("Log Out")
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            .navigationTitle("Profile")

        }
    }
    
    func shortenAddress(address: String) -> String {
        guard address.count > 8 else { return address }
        let startIndex = address.index(address.startIndex, offsetBy: 6)
        let endIndex = address.index(address.endIndex, offsetBy: -4)
        return "\(address[..<startIndex])...\(address[endIndex...])"
    }
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
}
