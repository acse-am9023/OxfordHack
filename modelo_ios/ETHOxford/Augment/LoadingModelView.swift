//
//  LoadingModelView.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 09/03/2024.
//

import SwiftUI

struct LoadingModelView: View {
    var name: String
    var time: String
    var imageUrl: String
    var progress: Double

    var body: some View {
        HStack(spacing: 12) {
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                
                Text(time)
                    .font(.system(size: 15, design: .rounded))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            CircularProgressView(progress: progress)
                .frame(width: 30, height: 30)
        }
        .padding(14)
        .background(.white.opacity(0.14))
        .cornerRadius(20)
    }
}

#Preview {
    LoadingModelView(name: "Rubik's cube", time: "8.3.2024", imageUrl: "icon", progress: 0.60)
        .preferredColorScheme(.dark)
}
