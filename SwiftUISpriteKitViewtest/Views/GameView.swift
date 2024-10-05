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
    @State private var isLocked: Bool = true
    let levelTitle: String
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(vm.skScenes, id: \.self) { scene in
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
                        .foregroundStyle(.white)
                    Button {
                        isLocked.toggle()
                    } label: {
                        Text("Unlock Screen")
                    }
                }
            }
            .padding(.top, 80)
        }
    }
}
