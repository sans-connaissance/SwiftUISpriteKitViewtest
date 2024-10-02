//
//  GameLoaderViewModel.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 9/24/24.
//

import SwiftUI
import SpriteKit
import GameplayKit

@Observable
class HomeViewModel {
    var levelTitles: [String] = []
    
    func deleteTitles() {
        self.levelTitles.removeAll()
    }
    
    func loadLevelTitles() {
        self.levelTitles = Constants.Levels.titles
    }
}
