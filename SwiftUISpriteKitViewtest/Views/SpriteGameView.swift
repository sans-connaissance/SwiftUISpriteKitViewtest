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
    @Binding var score: Int
    var gameScore = ScoreViewModel.shared.score
    
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
        .onChange(of: gameScore) {
            score = gameScore
        }
    }
}

@Observable
class ScoreViewModel {
    static let shared: ScoreViewModel = ScoreViewModel()
    
    var score = 0
    
    func resetScore() {
        score = 0
    }
}


