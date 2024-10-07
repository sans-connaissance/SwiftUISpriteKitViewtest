//
//  GameData.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 10/6/24.
//

import Foundation
import SwiftUI

@Observable
class GameData {
    static let shared: GameData = GameData()
    
    var score = 0
    var hideLabel = false
    
    func resetScore() {
        score = 0
    }
}
