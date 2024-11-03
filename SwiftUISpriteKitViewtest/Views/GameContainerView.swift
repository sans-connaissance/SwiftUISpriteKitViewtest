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
    @State private var id = UUID()
    let levelTitle: String
    
    var body: some View {
        ZStack(alignment: .top) {
            GameScrollView(vm: $vm, isLocked: $isLocked, id: $id, levelTitle: levelTitle)
                .id(id)

            .onAppear {
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

struct GameScrollView: View {
    @Environment(GameData.self) var gameData
    @Binding var vm: GameContainerViewModel
    @Binding var isLocked: Bool
    @Binding var id: UUID
    let levelTitle: String
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(vm.skScenes, id: \.self) { scene in
                        GameView(scene: scene)
                    }
                }
            }
            .defaultScrollAnchor(.trailing)
            
            .simultaneousGesture(!isLocked ? DragGesture().onEnded({ _ in
                isLocked = true
                gameData.resetScore()
                vm.resetVM()
                vm.createGKScenes(with: levelTitle)
                id = UUID()
            }) : nil)
            
            .scrollDisabled(isLocked)
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollBounceBehavior(.basedOnSize)
        }
    }
}
