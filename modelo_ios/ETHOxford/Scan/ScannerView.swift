//
//  ScannerView.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 09/03/2024.
//

import SwiftUI

struct ScannerView: View {
    
    init() {
        var titleFont = UIFont.preferredFont(forTextStyle: .largeTitle) /// the default large title font
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
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Scan NFC")
        }
    }
}

#Preview {
    ScannerView()
        .preferredColorScheme(.dark)
}
