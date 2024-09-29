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
    
    let gkScene: GKScene
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if let spriteView = vm.spriteView {
                    spriteView
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
                if let scene = vm.loadedScene {
                    NavigationLink("restart Game", value: scene)
                }
            }
        }
        .navigationDestination(for: GKScene.self) { scene in
            GameView(gkScene: scene)
                .onDisappear {
                    vm.resetVM()
                    vm.loadSpriteView(with: gkScene)
                }
        }
        .onAppear {
            vm.resetVM()
            vm.loadSpriteView(with: gkScene)
        }
    }
}
