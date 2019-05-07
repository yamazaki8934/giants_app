//
//  Player.swift
//  giants_app
//
//  Created by 山崎浩毅 on 2019/05/06.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import Foundation
import UIKit

struct Player: Codable {
    var name: String
    var number: Int
    
    init(_ name: String, _ number: Int) {
        self.name = name
        self.number = number
    }
    static var dummyData: [Player] { return [Player("坂本勇人", 6), Player("岡本和真", 25)] }
}
