//
//  HomeView.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 09/03/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var presentNerfView: Bool = false
    
    let columns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    let columns_list = [
        GridItem(.adaptive(minimum: 170))
    ]
    
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
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("Scan a new item, or purchase items from current collectible collections")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.white.opacity(0.7))
                        .hLeading()
                    
                    Text("Categories")
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .hLeading()
                    
                    LazyVGrid(columns: columns) {
                        CategoryView(emoji: "🚀", text: "Rockets")
                        CategoryView(emoji: "⚡️", text: "PCB Boards")
                        CategoryView(emoji: "🔥", text: "Cards")
                        CategoryView(emoji: "🥇", text: "Medals")
                    }
                    
                    Text("Popular Items")
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .hLeading()
                    
                    LazyVGrid(columns: columns_list) {
                        ItemView(imageUrl: "rocket", name: "Rocket", price: "80 XTZ")
                        ItemView(imageUrl: "pcb", name: "PCB Board", price: "50 XTZ")
                        ItemView(imageUrl: "magic", name: "Magic Cards", price: "20 XTZ")
                        ItemView(imageUrl: "medal1", name: "Marathon Medal", price: "90 XTZ")
                        ItemView(imageUrl: "medal2", name: "Medal", price: "75 XTZ")
                    }
                
                    Spacer()
                }
                .padding(.horizontal, 16)
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            presentNerfView.toggle()
                        } label: {
                            Image(systemName: "plus.app")
                        }
                    }
                }
                .fullScreenCover(isPresented: $presentNerfView, content: {
                    CreateNeRFView()
            })
            }
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
