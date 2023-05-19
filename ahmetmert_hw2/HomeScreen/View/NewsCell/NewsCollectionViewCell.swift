//
//  NewsCollectionViewCell.swift
//  ahmetmert_hw2
//
//  Created by Ahmet Mert ÖZ on 15.05.2023.
//

import UIKit
import SDWebImage

class NewsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var newsDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(model : ResultNews){
        newsImageView.sd_setImage(with: URL(string: model.multimedia?.first?.url ?? ""), placeholderImage: UIImage(named: "loadingImage"))
        newsTitle.text = model.title
        newsDescription.text = model.abstract
    }

}
