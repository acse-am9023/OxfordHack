//
//  TabBarView.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 09/03/2024.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                
            AugmentView()
                .tabItem {
                    Label("AR View", systemImage: "arkit")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarView()
}
