//
//  SpriteGameView.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 10/5/24.
//

import SwiftUI
import SpriteKit

struct SpriteGameView: View {
    let scene: SKScene
    
    var body: some View {
        SpriteView(
            scene: scene,
            isPaused: false,
            preferredFramesPerSecond: 120,
            options: [.ignoresSiblingOrder, .shouldCullNonVisibleNodes],
            debugOptions: [.showsFPS, .showsNodeCount, .showsPhysics]
        )
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        .containerRelativeFrame(.horizontal, alignment: .center)
        .scrollTransition { content, phase in
            content
                .opacity(phase.isIdentity ? 1 : 0)
        }
    }
}
