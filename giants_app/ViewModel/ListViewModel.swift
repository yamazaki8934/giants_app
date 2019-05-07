//
//  ListViewModel.swift
//  giants_app
//
//  Created by 山崎浩毅 on 2019/05/06.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import Foundation
import UIKit
import  RxSwift

final class ListViewModel {
    
    var players: Observable<Player> {
        return Observable.of(Player.dummyData)
    }
}

