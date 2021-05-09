//
//  URLRequest+Extentions.swift
//  NewsRxSwift
//
//  Created by Ivan Ivanov on 5/9/21.
//

import Foundation
import RxSwift
import RxCocoa


struct Resourece<T: Decodable> {
    let url: URL
}

extension URLRequest {
     
    static func load<T>(resource: Resourece<T>) -> Observable<T?> {
        return Observable.just(resource.url)
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map{ data -> T? in
                return try? JSONDecoder().decode(T.self, from: data)
            }.asObservable()
    }
    
}
