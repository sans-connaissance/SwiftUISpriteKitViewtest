//
//  GameView.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 9/24/24.
//

import SwiftUI
import SpriteKit
import GameplayKit

struct GameView: View {
    @State private var vm = GameViewModel()
    let gkScenes: [GKScene]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(vm.gameScenes, id: \.self) { scene in
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
        }
        .ignoresSafeArea()
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging)
        .scrollBounceBehavior(.basedOnSize)
        .onAppear {
          //  vm.resetVM()
            vm.loadSpriteView(with: gkScenes)
        }
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
