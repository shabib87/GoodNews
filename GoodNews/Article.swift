//
//  Article.swift
//  GoodNews
//
//  Created by Shabib Hossain on 2019-10-20.
//  Copyright © 2019 Code With Shabib. All rights reserved.
//

import Foundation
import Keys

struct Article: Decodable {
    let title: String?
    let description: String?
    let urlToImage: String?
    let source: NewsSource?
    
    private let publishedAt: String?
    
    var published: String? {
        get {
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            df.timeZone = TimeZone(abbreviation: "UTC")
            if let date = df.date(from: publishedAt ?? "") {
                df.dateFormat = "MMM d, yyyy"
                df.timeZone = TimeZone.current
                let date = df.string(from: date)
                return "Publised at \(date)"
            }
            return nil
        }
    }
}

struct ArticlesList: Decodable {
    let articles: [Article]
}

struct NewsSource: Decodable {
    let name: String?
}

extension ArticlesList {
    static var all: Resource<ArticlesList> = {
        let keys = GoodNewsKeys()
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ca&apiKey=\(keys.newsAPIKey)") else {
            fatalError("crash")
        }
        return Resource(url: url)
    }()
}
