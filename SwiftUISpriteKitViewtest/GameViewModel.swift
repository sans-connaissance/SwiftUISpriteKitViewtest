//
//  GameViewModel.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 9/24/24.
//

import SwiftUI
import SpriteKit

class GameViewModel: ObservableObject {

    @Published var spriteView: SpriteView?
    
    func loadBlankView() {
        let sView = SpriteView(
            scene: SKScene(),
            isPaused: false,
            preferredFramesPerSecond: 120,
            options: [.ignoresSiblingOrder, .shouldCullNonVisibleNodes],
            debugOptions: [.showsFPS, .showsNodeCount, .showsPhysics]
        )
        self.spriteView = sView
    }
}
