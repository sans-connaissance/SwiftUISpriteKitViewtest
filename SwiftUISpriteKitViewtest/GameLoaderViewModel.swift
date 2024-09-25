//
//  GameLoaderViewModel.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 9/24/24.
//

import SwiftUI
import SpriteKit

class GameLoaderViewModel: ObservableObject {
    @Published var gameScenes: [SKScene] = []
    
    func deleteGames() {
        self.gameScenes.removeAll()
    }
    
    func createGames() {
        let gameOne = SKScene()
        gameScenes.append(gameOne)
        
        let gameTwo = SKScene()
        gameScenes.append(gameTwo)
        
    }
}
