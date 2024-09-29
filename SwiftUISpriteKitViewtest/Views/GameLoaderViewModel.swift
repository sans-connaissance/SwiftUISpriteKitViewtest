//
//  GameLoaderViewModel.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 9/24/24.
//

import SwiftUI
import SpriteKit
import GameplayKit

@Observable
class GameLoaderViewModel {
    var gameScenes: [GKScene] = []
    
    func deleteGames() {
        self.gameScenes.removeAll()
    }
    
    func createGames() {

        if let scene = GKScene(fileNamed: "GameScene") {
            self.gameScenes.append(scene)
        }
        
        if let scene2 = GKScene(fileNamed: "GameScene2") {
            self.gameScenes.append(scene2)
        }
    }
}
