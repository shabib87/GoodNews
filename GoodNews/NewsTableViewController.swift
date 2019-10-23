//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Shabib Hossain on 2019-10-20.
//  Copyright © 2019 Code With Shabib. All rights reserved.
//

import UIKit

final class NewsTableViewController: UITableViewController {

    private var articles = [Article]()
    private let newsService = TopNewsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNews()
    }
    
    @IBAction private func refreshAction() {
        articles.removeAll()
        fetchNews()
    }
    
    private func fetchNews() {
        newsService.fetchNews { [weak self] articles in
            if let articles = articles {
                self?.articles = articles
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.refreshControl?.endRefreshing()
                }
            }
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("crash")
        }
        
        let article = articles[indexPath.row]
        cell.title = article.title
        cell.descriptionText = article.description
        cell.imageURL = article.urlToImage
        cell.source = article.source?.name
        cell.published = article.published
        
        return cell
    }
}
