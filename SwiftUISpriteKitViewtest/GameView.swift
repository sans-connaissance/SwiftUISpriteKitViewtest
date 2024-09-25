//
//  GameView.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 9/24/24.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    @StateObject private var vm = GameViewModel()
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if let spriteView = vm.spriteView {
                    spriteView
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
        .onAppear {
            vm.loadBlankView()
        }
    }
}
