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

    var spriteView: SpriteView?
    
    func emptySpriteView() {
        self.spriteView = nil
    }
    
    func loadSpriteView(with scene: GKScene) {
        // Get the SKScene from the loaded GKScene
        if let sceneNode = scene.rootNode as? GameScene?, let _scene = sceneNode {
            
            // Copy gameplay related content over to the scene
            _scene.entities = scene.entities
            _scene.graphs = scene.graphs
            
            // Set the scale mode to scale to fit the window
            _scene.scaleMode = .aspectFill
            
            let sView = SpriteView(
                scene: _scene,
                isPaused: false,
                preferredFramesPerSecond: 120,
                options: [.ignoresSiblingOrder, .shouldCullNonVisibleNodes],
                debugOptions: [.showsFPS, .showsNodeCount, .showsPhysics]
            )
            self.spriteView = sView
        } else if let sceneNode = scene.rootNode as? GameScene2?, let _scene = sceneNode {
            // Copy gameplay related content over to the scene
            _scene.entities = scene.entities
            _scene.graphs = scene.graphs
            
            // Set the scale mode to scale to fit the window
            _scene.scaleMode = .aspectFill
            
            let sView = SpriteView(
                scene: _scene,
                isPaused: false,
                preferredFramesPerSecond: 120,
                options: [.ignoresSiblingOrder, .shouldCullNonVisibleNodes],
                debugOptions: [.showsFPS, .showsNodeCount, .showsPhysics]
            )
            self.spriteView = sView
        }
    }
}
