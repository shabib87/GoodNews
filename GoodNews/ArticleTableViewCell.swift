//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by Shabib Hossain on 2019-10-20.
//  Copyright © 2019 Code With Shabib. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet private var sourceLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var publishedLabel: UILabel!
    @IBOutlet private var newsImageView: UIImageView!

    var source: String? {
        didSet {
            sourceLabel.text = source
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    var published: String? {
        didSet {
            publishedLabel.text = published
        }
    }
    
    var imageURL: String? {
        didSet {
            if
              let urlStr = imageURL,
              let url = URL(string: urlStr) {
                newsImageView.kf.setImage(with: url)
            }
        }
    }
}
