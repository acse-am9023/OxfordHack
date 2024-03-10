//
//  ModelPreview.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 10/03/2024.
//

import SwiftUI

struct ModelPreview: View {
    var name: String
    var date: String
    var imageUrl: String
    var url: String
    
    var body: some View {
        HStack {
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                
                Text(date)
                    .font(.system(size: 15, design: .rounded))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button {
                let urlString = url

                if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            } label: {
                Image(systemName: "link")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
        }
        .padding(14)
        .background(.white.opacity(0.14))
        .cornerRadius(20)
    }
}

#Preview {
    ModelPreview(name: "Rubik's cube", date: "8.3.2024", imageUrl: "icon3", url: "https://apple.co.uk")
        .preferredColorScheme(.dark)
}
