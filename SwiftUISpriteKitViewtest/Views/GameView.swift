//
//  GameView.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 9/24/24.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    @State private var vm = GameViewModel()
    @State private var isLocked: Bool = true
    @State private var score: Int = 0
    let levelTitle: String
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(vm.skScenes, id: \.self) { scene in
                        SpriteGameView(scene: scene, score: $score)
                    }
                }
            }
            .simultaneousGesture(!isLocked ? DragGesture().onEnded({ _ in
                isLocked = true
            }) : nil)
            .scrollDisabled(isLocked)
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollBounceBehavior(.basedOnSize)
            .onAppear {
                vm.createGKScenes(with: levelTitle)
            }
            .onDisappear {
                vm.resetVM()
            }
            
            VStack {
                HStack {
                    Text("Hello World")
                    Text("Score: \(score)")
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
