//
//  AugmentView.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 09/03/2024.
//

import SwiftUI

struct AugmentView: View {
    
    @State private var showARView: Bool = false
    @State private var showLoading: Bool = false
    @State private var updateModels: Bool = false
    @State private var loadingProgress: Float = 0
    @State private var showModels: Bool = true
    
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
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    if showLoading {
                        Text("Loading Models")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .hLeading()
                        
                        LoadingModelView(name: "Rubik's cube", time: "8.3.2024", imageUrl: "icon3", progress: Double(loadingProgress))
                    }

                    HStack {
                        Text("Your Models")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        .hLeading()
                        
                        Spacer()
                        
                        Button {
                            loadModels()
                            
                        } label: {
                            Image("chevron.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Button {
                        showARView.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "arkit")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                            
                            Text("Enter AR Experience")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.screenWidth - 32, height: 60)
                        .background(.blue)
                        .cornerRadius(16)
                    }
                    
                    ForEach(updateModels ? amodels : models) { model in
                        ModelPreview(name: model.name, date: model.date, imageUrl: model.imageUrl, url: model.model)
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 16)
                .navigationTitle("NFT AR View")
                .animation(.easeInOut, value: updateModels)
                .fullScreenCover(isPresented: $showARView, content: {
                    ARExperienceView()
                })
            }
        }
    }
    
    func loadModels() {
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: true) { timer in
            if self.loadingProgress < 1 {
                self.showLoading = true
                self.loadingProgress += 0.02
            } else {
                self.updateModels = true
                self.showLoading = false
            }
        }
    }
}

#Preview {
    AugmentView()
        .preferredColorScheme(.dark)
}
