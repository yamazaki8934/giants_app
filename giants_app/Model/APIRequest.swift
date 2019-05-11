//
//  APIRequest.swift
//  giants_app
//
//  Created by 山崎浩毅 on 2019/05/06.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import Alamofire_SwiftyJSON
import ObjectMapper

struct HogeEntity: Mappable {
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        // ここでパースする
    }
}

final class APIRequest {
    private let baseUrl: String = "https://c7f9eb4a.ngrok.io/api/v1/giants/players"
    
    
    
    func createSingle<T: Mappable>(withEndpoint endpoint: String,
                                   method: HTTPMethod = .get,
                                   parameters: Parameters? = nil,
                                   encoding: ParameterEncoding = JSONEncoding.default) -> Single<T> {
        return Single<T>.create { singleEvent in
            let request = Alamofire.request(endpoint,
                                            method: method,
                                            parameters: parameters,
                                            encoding: encoding)
                .responseJSON { response in
                    switch response.result {
                    case .success(let data):
                        let entity = Mapper<T>().map(JSONObject: data)!
                        singleEvent(.success(entity))
                    case .failure(let error):
                        singleEvent(.error(error))
                    }
            }
            return Disposables.create { request.cancel() }
        }
    }
    
    func getHoge() -> Single<HogeEntity> {
        return createSingle(withEndpoint: "https://c7f9eb4a.ngrok.io/api/v1/giants/players")
    }
    
    private let disposeBag = DisposeBag()
    
    func callAPI() {
        getHoge()
            .subscribe(
                onSuccess: { [unowned self] entity in
                    // 成功時に呼ばれるので処理をする。（例えば取得したモデルをViewに渡すなど）
                },
                onError: { [unowned self] error in
                    // 失敗時に呼ばれるので処理をする。（例えばエラーをViewに通知するなど）
                }
            ).disposed(by: disposeBag)
    }
    
//    func getResponse() -> Observable<DataResponse<JSON>> {
//        return Observable.create { observer in
//            Alamofire.request(self.baseUrl)
//                .responseSwiftyJSON { response in
//                    print("success")
//                    observer.onNext(response)
//                    observer.onCompleted()
//            }
//            return Disposables.create()
//        }
//    }
}
