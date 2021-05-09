//
//  Articles.swift
//  NewsRxSwift
//
//  Created by Ivan Ivanov on 5/9/21.
//

import Foundation


struct ArticlesList: Codable {
    let articles: [Article]
}

extension ArticlesList {
    
    static var all: Resourece<ArticlesList> = {
        let url = URL(string: "Add your NEWS Url Here!")!
        return Resourece(url: url)
    }()
}


struct Article: Codable {
    let title: String
    let description: String?
}
