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
    let levelTitle: String
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {
                SpriteGameView(vm: $vm)
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
