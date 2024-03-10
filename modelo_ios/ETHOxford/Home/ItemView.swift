//
//  ItemView.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 10/03/2024.
//

import SwiftUI

struct ItemView: View {
    var imageUrl: String
    var name: String
    var price: String

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Image(imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 140)
                    .cornerRadius(14)
                
                Text(name)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                
                Text(price)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundStyle(.white.opacity(0.7))
                
            }
            .padding()
        }
        .background(.white.opacity(0.14))
        .cornerRadius(24)
    }
}

#Preview {
    ItemView(imageUrl: "icon3", name: "Icon", price: "34 XTZ")
        .preferredColorScheme(.dark)
}
