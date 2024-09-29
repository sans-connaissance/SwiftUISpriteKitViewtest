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
    @State private var path = [GKScene]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ForEach(vm.gameScenes, id: \.self) { scene in
                    Button {
                        path = [scene, scene]
                    } label: {
                        Text("select game")
                    }
                }
                .navigationDestination(for: GKScene.self) { scene in
                    GameView(gkScene: scene)
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
