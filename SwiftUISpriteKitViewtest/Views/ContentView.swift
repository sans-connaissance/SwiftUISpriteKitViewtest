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
    @State private var vm = HomeViewModel()
    @State private var path = [String]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ForEach(vm.levelTitles, id: \.self) { title in
                    Button {
                        path = [title]
                    } label: {
                        Text("select game")
                    }
                }
                .navigationDestination(for: String.self) { title in
                    GameView(levelTitle: title, hideLabel: false)
                }
            }
            .navigationTitle("Jet Pilot Pro")
        }
        .onAppear(perform: {
            vm.loadLevelTitles()
        })
    }
}

#Preview {
    ContentView()
}
