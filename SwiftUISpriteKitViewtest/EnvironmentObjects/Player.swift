//
//  Player.swift
//  SwiftUISpriteKitViewtest
//
//  Created by David Malicke on 10/6/24.
//

import Foundation
import SwiftUI

@Observable
class Player {
    static let shared: Player = Player()
    
    var name = "David"
    
    func resetName() {
        name = ""
    }
}
