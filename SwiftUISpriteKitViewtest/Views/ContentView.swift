//
//  ContentView.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 9/24/24.
//

import SwiftUI
import SpriteKit
import GameplayKit

struct ContentView: View {
    @State private var vm = GameLoaderViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ForEach(vm.gameScenes, id: \.self) { scene in
                    NavigationLink("Select Game", value: scene)
                }
                .navigationDestination(for: GKScene.self) { scene in
                    GameView(path: $path, gkScene: scene)
                        .onDisappear {
                            vm.deleteGames()
                            vm.createGames()
                        }
                }
            }
            .navigationTitle("Jet Pilot Pro")
        }
        .onAppear(perform: {
            vm.createGames()
        })
    }
}

#Preview {
    ContentView()
}
