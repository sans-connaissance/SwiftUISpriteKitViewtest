//
//  SwiftUISpriteKitViewtestApp.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 9/24/24.
//

import SwiftUI

@main
struct SwiftUISpriteKitViewtestApp: App {
    @State var gameData = GameData.shared
    @State var player = Player.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(gameData)
                .environment(player)
        }
    }
}
