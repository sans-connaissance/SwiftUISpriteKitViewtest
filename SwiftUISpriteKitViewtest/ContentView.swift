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
    @StateObject private var vm = GameLoaderViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(vm.gameScenes, id: \.self) { scene in
                    NavigationLink {
                        GameView(gkScene: scene)
                            .onDisappear {
                                vm.deleteGames()
                                vm.createGames()
                            }
                    } label: {
                        Label("Launch Game !", systemImage: "globe")
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
