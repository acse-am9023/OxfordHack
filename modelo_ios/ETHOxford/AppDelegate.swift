//
//  AppDelegate.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 09/03/2024.
//

import UIKit
import SwiftUI

@main
struct ETHOxfordApp: App {
    @AppStorage("signin") var isSignedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isSignedIn {
                TabBarView()
                    .preferredColorScheme(.dark)
            } else {
                LoginView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
