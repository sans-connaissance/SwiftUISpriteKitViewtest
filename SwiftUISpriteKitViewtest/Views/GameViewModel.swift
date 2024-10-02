//
//  GameViewModel.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 9/24/24.
//

import SwiftUI
import SpriteKit
import GameplayKit

@Observable
class GameViewModel {
    var gameScenes: [GameScene] = []
    var gameScene2s: [GameScene2] = []
    
    func resetVM() {
        self.gameScenes.removeAll()
        self.gameScene2s.removeAll()
    }
    
    func loadSpriteView(with scenes: [GKScene]) {
        for scene in scenes {
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as? GameScene?, let _scene = sceneNode {
                
                // Copy gameplay related content over to the scene
                _scene.entities = scene.entities
                _scene.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                _scene.scaleMode = .aspectFill
                
                gameScenes.append(_scene)
                
            } else if let sceneNode = scene.rootNode as? GameScene2?, let _scene = sceneNode {
                // Copy gameplay related content over to the scene
                _scene.entities = scene.entities
                _scene.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                _scene.scaleMode = .aspectFill
                
                gameScene2s.append(_scene)
            }
        }
    }
}
