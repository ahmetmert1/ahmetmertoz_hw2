//
//  DetailViewController.swift
//  ahmetmert_hw2
//
//  Created by Ahmet Mert ÖZ on 15.05.2023.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {
    
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var newsDescription: UILabel!
    @IBOutlet var seeInWebButton: UIButton!
    
    var newsModel : ResultNews? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsImageView.sd_setImage(with: URL(string: newsModel?.multimedia?[0].url ?? ""),placeholderImage: UIImage(named: "loadingImage")?.withTintColor(.black))
        newsTitle.text = newsModel?.title
        newsDescription.text = newsModel?.abstract
        
    }

    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

    @IBAction func seeInWebButtonPressed(_ sender: Any) {
        let safariVC = SFSafariViewController(url: ((URL(string: newsModel?.url ?? "") ?? URL(string: ""))!)  )
        present(safariVC, animated: true)
    }
    
}
