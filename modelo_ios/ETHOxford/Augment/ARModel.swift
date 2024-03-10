//
//  3DModel.swift
//  ETHOxford
//
//  Created by Artemiy Malyshau on 10/03/2024.
//

import SwiftUI

struct ARModel: Identifiable {
    var id = UUID()
    var name: String
    var date: String
    var link: String
    var imageUrl: String
    var model: String
}

var models: [ARModel] = [
    ARModel(name: "Xbox Controller", date: "8.3.2024", link: "https://apple.com", imageUrl: "xbox", model: "xbox.usdz"),
    ARModel(name: "Camera", date: "8.3.2024", link: "https://apple.com", imageUrl: "camera", model: "camera.usdz")
]

var amodels: [ARModel] = [
    ARModel(name: "Rubik's cube", date: "8.3.2024", link: "https://apple.com", imageUrl: "rubiks", model: "rubiks.usdz"),
    ARModel(name: "Xbox Controller", date: "8.3.2024", link: "https://apple.com", imageUrl: "xbox", model: "xbox.usdz"),
    ARModel(name: "Camera", date: "8.3.2024", link: "https://apple.com", imageUrl: "camera", model: "camera.usdz")
]
