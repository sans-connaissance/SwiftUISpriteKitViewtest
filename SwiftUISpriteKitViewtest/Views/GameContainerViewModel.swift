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
class GameContainerViewModel {
    var skScenes: [SKScene] = []
    
    func resetVM() {
        self.skScenes.removeAll()
    }
    
    func createGKScenes(with title: String) {
        for _ in 0...1 {
            if let scene = GKScene(fileNamed: title) {
                loadSpriteView(with: scene)
            }
        }
    }
    
    func loadSpriteView(with scene: GKScene) {
        // Get the SKScene from the loaded GKScene
        if let sceneNode = scene.rootNode as? GameScene?, let _scene = sceneNode {
            
            // Copy gameplay related content over to the scene
            _scene.entities = scene.entities
            _scene.graphs = scene.graphs
            
            // Set the scale mode to scale to fit the window
            _scene.scaleMode = .aspectFill
            skScenes.append(_scene)
            
        } else if let sceneNode = scene.rootNode as? GameScene2?, let _scene = sceneNode {
            // Copy gameplay related content over to the scene
            _scene.entities = scene.entities
            _scene.graphs = scene.graphs
            
            // Set the scale mode to scale to fit the window
            _scene.scaleMode = .aspectFill
            skScenes.append(_scene)
        }
    }
}
