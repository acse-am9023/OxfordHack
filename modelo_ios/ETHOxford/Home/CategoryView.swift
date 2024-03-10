//
//  CategoryView.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 10/03/2024.
//

import SwiftUI

struct CategoryView: View {
    var emoji: String
    var text: String
    
    var body: some View {
        Text(emoji + " " + text)
            .font(.system(size: 15))
            .bold()
            .frame(width: 170, height: 40)
            .background(.white.opacity(0.14))
            .cornerRadius(6)
            .lineLimit(1)

    }
}

#Preview {
    CategoryView(emoji: "🚀", text: "Pokemon")
        .preferredColorScheme(.dark)
}
