//
//  TopNewsService.swift
//  GoodNews
//
//  Created by Shabib Hossain on 2019-10-20.
//  Copyright © 2019 Code With Shabib. All rights reserved.
//

import Foundation
import Keys
import RxSwift
import RxCocoa

struct TopNewsService {

    private let disposeBag = DisposeBag()
    
    func fetchNews(completion: @escaping ([Article]?) -> ()) {        
        URLRequest.load(resource: ArticlesList.all).subscribe(onNext: { result in
            completion(result?.articles)
        }).disposed(by: disposeBag)
    }
}

