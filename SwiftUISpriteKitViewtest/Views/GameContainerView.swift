//
//  GameView.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 9/24/24.
//

import SwiftUI
import SpriteKit

struct GameContainerView: View {
    @Environment(GameData.self) var gameData
    @State private var vm = GameContainerViewModel()
    @State private var isLocked: Bool = true
    let levelTitle: String
    var hideLabel: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(vm.skScenes, id: \.self) { scene in
                        GameView(scene: scene)
                    }
                }
            }
            .simultaneousGesture(!isLocked ? DragGesture().onEnded({ _ in
                isLocked = true
                gameData.hideLabel.toggle()
                gameData.resetScore()
                vm.resetVM()
                vm.createGKScenes(with: levelTitle)
            }) : nil)
            
            .scrollDisabled(isLocked)
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollBounceBehavior(.basedOnSize)
            .onAppear {
                gameData.hideLabel = hideLabel
                vm.createGKScenes(with: levelTitle)
            }
            .onDisappear {
                gameData.resetScore()
                vm.resetVM()
            }
            
            VStack {
                HStack {
                    Text("Hello World")
                    Text("Score: \(gameData.score)")
                    Button {
                        isLocked.toggle()
                    } label: {
                        Text("Unlock Screen")
                    }
                }
                .foregroundStyle(.white)
            }
            .padding(.top, 80)
        }
    }
}
