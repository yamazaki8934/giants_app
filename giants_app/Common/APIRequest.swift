//
//  APIRequest.swift
//  giants_app
//
//  Created by 山崎浩毅 on 2019/05/06.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import Foundation
import RxSwift

final class APIRequest {
    private let baseUrl: String = "https://c7f9eb4a.ngrok.io/api/v1/giants/players"
    
    func getResponse() -> Observable
}
